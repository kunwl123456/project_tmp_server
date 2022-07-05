
//和网络以及逻辑处理 有关的函数放这里

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>    //uintptr_t
#include <stdarg.h>    //va_start....
#include <unistd.h>    //STDERR_FILENO等
#include <sys/time.h>  //gettimeofday
#include <time.h>      //localtime_r
#include <fcntl.h>     //open
#include <errno.h>     //errno
//#include <sys/socket.h>
#include <sys/ioctl.h> //ioctl
#include <arpa/inet.h>
#include <pthread.h>   //多线程

//第三方库
//#include <mysql/mysql.h>        //Mysql
//#include <hiredis/hiredis.h>    //Redis
#include "../json/cJson.h"              //cjson库

#include "../config/ngx_c_conf.h"
#include "../_include/ngx_macro.h"
#include "../_include/ngx_global.h"
#include "../_include/ngx_func.h"
//#include "ngx_c_socket.h"
#include "../misc/ngx_c_memory.h"
#include "../misc/ngx_c_crc32.h"
#include "../logic/ngx_c_slogic.h"  
#include "../_include/ngx_logiccomm.h"  
#include "../_include/ngx_c_lockmutex.h"  
#include "../json/cJson.h"

//服务器相关参数
//MYSQL       *conn;
//MYSQL_RES   *res;
//MYSQL_ROW    row;
#define DB_DATABASE_NAME    "tonase"              // 数据库对应的库名字, 这里需要自己提前用命令创建完毕
#define DB_USERNAME         "root"                // 数据库用户名
#define DB_PASSWORD         "1234"                // 数据库密码
#define DB_SERVER           "localhost"           // 使用服务器为本地服务器
unsigned int queryRet;

//定义成员函数指针
typedef bool (CLogicSocket::*handler)(  lpngx_connection_t pConn,      //连接池中连接的指针
                                        LPSTRUC_MSG_HEADER pMsgHeader,  //消息头指针
                                        char *pPkgBody,                 //包体指针
                                        unsigned short iBodyLength);    //包体长度

//用来保存 成员函数指针 的这么个数组
static const handler statusHandler[] = 
{
    //数组前5个元素，保留，以备将来增加一些基本服务器功能
    &CLogicSocket::_HandlePing,                             //【0】：心跳包的实现
    &CLogicSocket::_forTestMysql,                           //【1】：下标从0开始
    &CLogicSocket::_forTestRedis,                           //【2】：下标从0开始
    &CLogicSocket::_searchByEnglish,                        //【3】：下标从0开始
    //&CLogicSocket::_searchByChinese,                        //【4】：下标从0开始
    //开始处理具体的业务逻辑
    &CLogicSocket::_HandleRegister,                         //【5】：实现具体的注册功能
    &CLogicSocket::_HandleLogIn,                            //【6】：实现具体的登录功能
    //......其他待扩展，比如实现攻击功能，实现加血功能等等；


};
#define AUTH_TOTAL_COMMANDS sizeof(statusHandler)/sizeof(handler) //整个命令有多少个，编译时即可知道

//构造函数
CLogicSocket::CLogicSocket()
{

}
//析构函数
CLogicSocket::~CLogicSocket()
{

}

//初始化函数【fork()子进程之前干这个事】
//成功返回true，失败返回false
bool CLogicSocket::Initialize()
{
    //做一些和本类相关的初始化工作
    //....日后根据需要扩展        
    bool bParentInit = CSocekt::Initialize();  //调用父类的同名函数
    return bParentInit;
}

//处理收到的数据包，由线程池来调用本函数，本函数是一个单独的线程；
//pMsgBuf：消息头 + 包头 + 包体 ：自解释；
void CLogicSocket::threadRecvProcFunc(char *pMsgBuf)
{          
    LPSTRUC_MSG_HEADER pMsgHeader = (LPSTRUC_MSG_HEADER)pMsgBuf;                  //消息头
    LPCOMM_PKG_HEADER  pPkgHeader = (LPCOMM_PKG_HEADER)(pMsgBuf+m_iLenMsgHeader); //包头
    void  *pPkgBody;                                                              //指向包体的指针
    unsigned short pkglen = ntohs(pPkgHeader->pkgLen);                            //客户端指明的包宽度【包头+包体】

    if(m_iLenPkgHeader == pkglen)
    {
        //没有包体，只有包头
		if(pPkgHeader->crc32 != 0) //只有包头的crc值给0
		{
			return; //crc错，直接丢弃
		}
		pPkgBody = NULL;
    }
    else 
	{
        //有包体，走到这里
		pPkgHeader->crc32 = ntohl(pPkgHeader->crc32);		          //针对4字节的数据，网络序转主机序
		pPkgBody = (void *)(pMsgBuf+m_iLenMsgHeader+m_iLenPkgHeader); //跳过消息头 以及 包头 ，指向包体

		//计算crc值判断包的完整性        
		int calccrc = CCRC32::GetInstance()->Get_CRC((unsigned char *)pPkgBody,pkglen-m_iLenPkgHeader); //计算纯包体的crc值
		if(calccrc != pPkgHeader->crc32) //服务器端根据包体计算crc值，和客户端传递过来的包头中的crc32信息比较
		{
            ngx_log_stderr(0,"CLogicSocket::threadRecvProcFunc()中CRC错误，丢弃数据!");    //正式代码中可以干掉这个信息
			return; //crc错，直接丢弃
		}
	}

    //包crc校验OK才能走到这里    	
    unsigned short imsgCode = ntohs(pPkgHeader->msgCode); //消息代码拿出来
    lpngx_connection_t p_Conn = pMsgHeader->pConn;        //消息头中藏着连接池中连接的指针

    //我们要做一些判断
    //(1)如果从收到客户端发送来的包，到服务器释放一个线程池中的线程处理该包的过程中，客户端断开了，那显然，这种收到的包我们就不必处理了；    
    if(p_Conn->iCurrsequence != pMsgHeader->iCurrsequence)   //该连接池中连接以被其他tcp连接【其他socket】占用，这说明原来的 客户端和本服务器的连接断了，这种包直接丢弃不理
    {
        return; //丢弃不理这种包了【客户端断开了】
    }

    //(2)判断消息码是正确的，防止客户端恶意侵害我们服务器，发送一个不在我们服务器处理范围内的消息码
	if(imsgCode >= AUTH_TOTAL_COMMANDS) //无符号数不可能<0
    {
        ngx_log_stderr(0,"CLogicSocket::threadRecvProcFunc()中imsgCode=%d消息码不对!",imsgCode); //这种有恶意倾向或者错误倾向的包，希望打印出来看看是谁干的
        return; //丢弃不理这种包【恶意包或者错误包】
    }

    //能走到这里的，包没过期，不恶意，那好继续判断是否有相应的处理函数
    //(3)有对应的消息处理函数吗
    if(statusHandler[imsgCode] == NULL) //这种用imsgCode的方式可以使查找要执行的成员函数效率特别高
    {
        ngx_log_stderr(0,"CLogicSocket::threadRecvProcFunc()中imsgCode=%d消息码找不到对应的处理函数!",imsgCode); //这种有恶意倾向或者错误倾向的包，希望打印出来看看是谁干的
        return;  //没有相关的处理函数
    }

    //一切正确，可以放心大胆的处理了
    //(4)调用消息码对应的成员函数来处理
    (this->*statusHandler[imsgCode])(p_Conn,pMsgHeader,(char *)pPkgBody,pkglen-m_iLenPkgHeader);
    return;	
}

//心跳包检测时间到，该去检测心跳包是否超时的事宜，本函数是子类函数，实现具体的判断动作
void CLogicSocket::procPingTimeOutChecking(LPSTRUC_MSG_HEADER tmpmsg,time_t cur_time)
{
    CMemory *p_memory = CMemory::GetInstance();

    if(tmpmsg->iCurrsequence == tmpmsg->pConn->iCurrsequence) //此连接没断
    {
        lpngx_connection_t p_Conn = tmpmsg->pConn;

        if(/*m_ifkickTimeCount == 1 && */m_ifTimeOutKick == 1)  //能调用到本函数第一个条件肯定成立，所以第一个条件加不加无所谓，主要是第二个条件
        {
            //到时间直接踢出去的需求
            zdClosesocketProc(p_Conn); 
        }            
        else if( (cur_time - p_Conn->lastPingTime ) > (m_iWaitTime*3+10) ) //超时踢的判断标准就是 每次检查的时间间隔*3，超过这个时间没发送心跳包，就踢【大家可以根据实际情况自由设定】
        {
            //踢出去【如果此时此刻该用户正好断线，则这个socket可能立即被后续上来的连接复用  如果真有人这么倒霉，赶上这个点了，那么可能错踢，错踢就错踢】            
            //ngx_log_stderr(0,"时间到不发心跳包，踢出去!");   //感觉OK
            zdClosesocketProc(p_Conn); 
        }   
             
        p_memory->FreeMemory(tmpmsg);//内存要释放
    }
    else //此连接断了
    {
        p_memory->FreeMemory(tmpmsg);//内存要释放
    }
    return;
}

//发送没有包体的数据包给客户端
void CLogicSocket::SendNoBodyPkgToClient(LPSTRUC_MSG_HEADER pMsgHeader,unsigned short iMsgCode)
{
    CMemory  *p_memory = CMemory::GetInstance();

    char *p_sendbuf = (char *)p_memory->AllocMemory(m_iLenMsgHeader+m_iLenPkgHeader,false);
    char *p_tmpbuf = p_sendbuf;
    
	memcpy(p_tmpbuf,pMsgHeader,m_iLenMsgHeader);
	p_tmpbuf += m_iLenMsgHeader;

    LPCOMM_PKG_HEADER pPkgHeader = (LPCOMM_PKG_HEADER)p_tmpbuf;	  //指向的是我要发送出去的包的包头	
    pPkgHeader->msgCode = htons(iMsgCode);	
    pPkgHeader->pkgLen = htons(m_iLenPkgHeader); 
	pPkgHeader->crc32 = 0;		
    msgSend(p_sendbuf);
    return;
}

//----------------------------------------------------------------------------------------------------------
//处理各种业务逻辑

//6
bool CLogicSocket::_HandleLogIn(lpngx_connection_t pConn,LPSTRUC_MSG_HEADER pMsgHeader,char *pPkgBody,unsigned short iBodyLength)
{
    ngx_log_stderr(0,"执行了CLogicSocket::_HandleLogIn()!");
    //(1)首先判断包体的合法性
    if(pPkgBody == NULL) //具体看客户端服务器约定，如果约定这个命令[msgCode]必须带包体，那么如果不带包体，就认为是恶意包，直接不处理    
    {        
        return false;
    }
		    
    int iRecvLen = sizeof(STRUCT_REGISTER); 
    if(iRecvLen != iBodyLength) //发送过来的结构大小不对，认为是恶意包，直接不处理
    {     
        return false; 
    }

    //(2)对于同一个用户，可能同时发送来多个请求过来，造成多个线程同时为该 用户服务，比如以网游为例，用户要在商店中买A物品，又买B物品，而用户的钱 只够买A或者B，不够同时买A和B呢？
       //那如果用户发送购买命令过来买了一次A，又买了一次B，如果是两个线程来执行同一个用户的这两次不同的购买命令，很可能造成这个用户购买成功了 A，又购买成功了 B
       //所以，为了稳妥起见，针对某个用户的命令，我们一般都要互斥,我们需要增加临界的变量于ngx_connection_s结构中
    CLock lock(&pConn->logicPorcMutex); //凡是和本用户有关的访问都互斥
    
    //(3)取得了整个发送过来的数据
    LPSTRUCT_REGISTER p_RecvInfo = (LPSTRUCT_REGISTER)pPkgBody; 
    p_RecvInfo->iType = ntohl(p_RecvInfo->iType);          //所有数值型,short,int,long,uint64_t,int64_t这种大家都不要忘记传输之前主机网络序，收到后网络转主机序
    p_RecvInfo->username[sizeof(p_RecvInfo->username)-1]=0;//这非常关键，防止客户端发送过来畸形包，导致服务器直接使用这个数据出现错误。 
    p_RecvInfo->password[sizeof(p_RecvInfo->password)-1]=0;//这非常关键，防止客户端发送过来畸形包，导致服务器直接使用这个数据出现错误。 


    //(4)这里可能要考虑 根据业务逻辑，进一步判断收到的数据的合法性，
       //当前该玩家的状态是否适合收到这个数据等等【比如如果用户没登陆，它就不适合购买物品等等】
    //。。。。。。。。

    //(5)给客户端返回数据时，一般也是返回一个结构，这个结构内容具体由客户端/服务器协商，这里我们就以给客户端也返回同样的 STRUCT_REGISTER 结构来举例    
    //LPSTRUCT_REGISTER pFromPkgHeader =  (LPSTRUCT_REGISTER)(((char *)pMsgHeader)+m_iLenMsgHeader);	//指向收到的包的包头，其中数据后续可能要用到
	LPCOMM_PKG_HEADER pPkgHeader;
	CMemory  *p_memory = CMemory::GetInstance();
	CCRC32   *p_crc32 = CCRC32::GetInstance();
    int iSendLen = sizeof(STRUCT_REGISTER);  
    //a)分配要发送出去的包的内存

    //iSendLen = 65000; //unsigned最大也就是这个值
    char *p_sendbuf = (char *)p_memory->AllocMemory(m_iLenMsgHeader+m_iLenPkgHeader+iSendLen,false);//准备发送的格式，这里是 消息头+包头+包体
    //b)填充消息头
    memcpy(p_sendbuf,pMsgHeader,m_iLenMsgHeader);                   //消息头直接拷贝到这里来
    //c)填充包头
    pPkgHeader = (LPCOMM_PKG_HEADER)(p_sendbuf+m_iLenMsgHeader);    //指向包头
    pPkgHeader->msgCode = _CMD_REGISTER;	                        //消息代码，可以统一在ngx_logiccomm.h中定义
    pPkgHeader->msgCode = htons(pPkgHeader->msgCode);	            //htons主机序转网络序 
    pPkgHeader->pkgLen  = htons(m_iLenPkgHeader + iSendLen);        //整个包的尺寸【包头+包体尺寸】 
    //d)填充包体
    LPSTRUCT_REGISTER p_sendInfo = (LPSTRUCT_REGISTER)(p_sendbuf+m_iLenMsgHeader+m_iLenPkgHeader);	//跳过消息头，跳过包头，就是包体了
    //。。。。。这里根据需要，填充要发回给客户端的内容,int类型要使用htonl()转，short类型要使用htons()转；
    
    //e)包体内容全部确定好后，计算包体的crc32值
    pPkgHeader->crc32   = p_crc32->Get_CRC((unsigned char *)p_sendInfo,iSendLen);
    pPkgHeader->crc32   = htonl(pPkgHeader->crc32);		

    //f)发送数据包
    msgSend(p_sendbuf);
    /*if(ngx_epoll_oper_event(
                                pConn->fd,          //socekt句柄
                                EPOLL_CTL_MOD,      //事件类型，这里是增加
                                EPOLLOUT,           //标志，这里代表要增加的标志,EPOLLOUT：可写
                                0,                  //对于事件类型为增加的，EPOLL_CTL_MOD需要这个参数, 0：增加   1：去掉 2：完全覆盖
                                pConn               //连接池中的连接
                                ) == -1)        
    {
        ngx_log_stderr(0,"1111111111111111111111111111111111111111111111111111111111111!");
    } */
    
    /*
    sleep(100);  //休息这么长时间
    //如果连接回收了，则肯定是iCurrsequence不等了
    if(pMsgHeader->iCurrsequence != pConn->iCurrsequence)
    {
        //应该是不等，因为这个插座已经被回收了
        ngx_log_stderr(0,"插座不等,%L--%L",pMsgHeader->iCurrsequence,pConn->iCurrsequence);
    }
    else
    {
        ngx_log_stderr(0,"插座相等哦,%L--%L",pMsgHeader->iCurrsequence,pConn->iCurrsequence);
    }
    
    */
    return true;
}

//0
//接收并处理客户端发送过来的ping包
bool CLogicSocket::_HandlePing(lpngx_connection_t pConn,LPSTRUC_MSG_HEADER pMsgHeader,char *pPkgBody,unsigned short iBodyLength)
{
    //心跳包要求没有包体；
    if(iBodyLength != 0)  //有包体则认为是 非法包
		return false; 

    CLock lock(&pConn->logicPorcMutex); //凡是和本用户有关的访问都考虑用互斥，以免该用户同时发送过来两个命令达到各种作弊目的
    pConn->lastPingTime = time(NULL);   //更新该变量

    //服务器也发送 一个只有包头的数据包给客户端，作为返回的数据
    SendNoBodyPkgToClient(pMsgHeader,_CMD_PING);

    ngx_log_stderr(0,"成功收到了心跳包并返回结果！");
    return true;
}

//1
//专门测试专用
bool CLogicSocket::_forTestMysql(lpngx_connection_t pConn,LPSTRUC_MSG_HEADER pMsgHeader,char *pPkgBody,unsigned short iBodyLength)
{

    //(1)首先判断包体的合法性
    //这个命令必须携带包体，包体为空表示为恶意包
    if(pPkgBody == NULL)    //具体看客户端服务器约定，约定这个命令[msgCode]必须带包体，没包体就认定为恶意包，直接丢弃
    {
        return false;
    }
    
    //(2)对于同一个用户，可能同时发送来多个请求过来，造成多个线程同时为该 用户服务
    CLock lock(&pConn->logicPorcMutex);//凡是和本用户有关的访问都互斥

    //(3)拆包
    if(pPkgBody == NULL)
    {
        ngx_log_stderr(0,"wulikaka");//空的包体就会打印这句话到屏幕上
    }
    char str1[500];//初始化缓冲区存客户发过来的字符串
    char *p_instead = (char*)pPkgBody;
    memset(str1,0,sizeof(str1));
    memcpy(str1,p_instead,iBodyLength);

    //开始拆json数据


    //str1[299] = "\0";
    ngx_log_stderr(0,"invalid option: %p",str1);//将字符串打印到屏幕上
    ngx_log_stderr(0,"invalid option: %s",str1);
    //printf("%s\n",str1);                            //将收到的字符串打印到屏幕上
    ngx_log_stderr(0,"invalid option: %d",sizeof(str1));

    //(4)处理业务逻辑
    //阿巴阿坝

    //若插入mysql的函数
    //这么写
    char mysqlReturnString[4000] = {0};           //用来存mysql返回的字符串
    char query[300] = "select * from hero where name = '";
    sprintf(query,"%s%s%s",query,str1,"'");
    //初始化
    /*
    conn = mysql_init(NULL);
    if(!conn)
    {
        ngx_log_stderr(0,"MySQL初始化失败！");//打印到屏幕上
        return false;
    }
    //连接mysql数据库
    if(!mysql_real_connect(conn,DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE_NAME,0,NULL,0))
    {
        ngx_log_stderr(0,"连接MySQL失败！");//打印到屏幕上
        return false;
    }
    ngx_log_stderr(0,"连接MySQL成功！");//连接MySQL成功就打印到屏幕上
    queryRet = mysql_query(conn, query);
    if(queryRet)
    {
        ngx_log_stderr(0,"语句输入格式错误,错误原因是:%s",mysql_error(conn));//打印错误原因
        return false;
    }
    else
    {
        do
        {
            for(queryRet = 0; queryRet < mysql_num_fields(res); ++queryRet)
            {
                strcat(mysqlReturnString,row[queryRet]);
                //测试用，打印每一个返回的字符串
                ngx_log_stderr(0,"invalid option: %8s",row[queryRet]);
            }
        }while(NULL != (row = mysql_fetch_row(res)));
        mysql_free_result(res);
    }
    mysql_close(conn);//关闭数据库连接


    //(5)准备数据包并发送
    LPCOMM_PKG_HEADER pPkgHeader;	
	CMemory  *p_memory = CMemory::GetInstance();
	CCRC32   *p_crc32 = CCRC32::GetInstance();
    //int iSendLen = sizeof(STRUCT_REGISTER);  
    //a)分配要发送出去的包的内存
    //char str[] = "laozijiushikuang1";
    int iSendLen = sizeof(mysqlReturnString); 
    char *p_sendbuf = (char *)p_memory->AllocMemory(m_iLenMsgHeader+m_iLenPkgHeader+iSendLen,false);//准备发送的格式，这里是 消息头+包头+包体
    //b)填充消息头
    //void* memcpy(void* destination, const void* source, size_t num);
    memcpy(p_sendbuf,pMsgHeader,m_iLenMsgHeader);                   //消息头直接拷贝到这里来
    //c)填充包头
    pPkgHeader = (LPCOMM_PKG_HEADER)(p_sendbuf+m_iLenMsgHeader);    //指向包头
    pPkgHeader->msgCode = _CMD_REGISTER;	                        //消息代码，可以统一在ngx_logiccomm.h中定义
    pPkgHeader->msgCode = htons(pPkgHeader->msgCode);	            //htons主机序转网络序 
    pPkgHeader->pkgLen  = htons(m_iLenPkgHeader + iSendLen);        //整个包的尺寸【包头+包体尺寸】 
    //d)填充包体
    //LPSTRUCT_REGISTER p_sendInfo = (LPSTRUCT_REGISTER)(p_sendbuf+m_iLenMsgHeader+m_iLenPkgHeader);	//跳过消息头，跳过包头，就是包体了
    //。。。。。这里根据需要，填充要发回给客户端的内容,int类型要使用htonl()转，short类型要使用htons()转；
    //char *p_sendReality = p_sendbuf+m_iLenMsgHeader+m_iLenPkgHeader;//p_sendReality指针指向包体
    strcat(p_sendbuf+m_iLenPkgHeader+m_iLenMsgHeader,mysqlReturnString);

    //e)包体内容全部确定好后，计算包体的crc32值
    //pPkgHeader->crc32   = p_crc32->Get_CRC((unsigned char *)p_sendInfo,iSendLen);
    pPkgHeader->crc32   = p_crc32->Get_CRC((unsigned char *)mysqlReturnString,iSendLen);
    pPkgHeader->crc32   = htonl(pPkgHeader->crc32);		            //存好包体的crc值

    //f)发送数据包
    msgSend(p_sendbuf);


*/


    return true;
}

//2
bool CLogicSocket::_forTestRedis(lpngx_connection_t pConn,LPSTRUC_MSG_HEADER pMsgHeader,char *pPkgBody,unsigned short iBodyLength)
{
    
    // 连接Redis服务
    /*
    redisContext *context = redisConnect("127.0.0.1", 6379);
    if (context == NULL || context->err) {  //若连接错误
        if (context) {
            //printf("%s\n", context->errstr);
            ngx_log_stderr(0,"错误原因：%s",context->errstr);
        } else {
            ngx_log_stderr(0,"redisConnect error");
        }
        exit(EXIT_FAILURE);
    }

    //链接不上需要更新系统动态库配置
    //sudo /sbin/ldconfig

    redisReply *reply = static_cast<redisReply *>(redisCommand(context, "auth 0voice"));
    // printf("type : %d\n", reply->type);

    // GET Key
    int key_1 = 1;
    reply = static_cast<redisReply *>(redisCommand(context, "GET %d", key_1));
    if (reply->type == REDIS_REPLY_STRING) {//REDIS_REPLY_STRING == 1:返回值是 字符串
        /*GET str Hello World*/
        //printf("GET str %s\n", reply->str); //字符串储存在 redis->str 当中
        /*
        ngx_log_stderr(0,"查询字符为：%s",reply->str);
        /*GET len 11*/
        //printf("GET len %ld\n", reply->len);//字符串长度为 redis->len
        /*
        ngx_log_stderr(0,"查询长度为：%d",reply->len);
    }
    freeReplyObject(reply);

    redisFree(context);
    */
    return true;
}

//3
//pPkgBody是指向缓冲区的指针，iBodyLength是包体的长度
bool CLogicSocket::_searchByEnglish(lpngx_connection_t pConn,LPSTRUC_MSG_HEADER pMsgHeader,char *pPkgBody,unsigned short iBodyLength)
{
    //(1)首先判断包体的合法性
    //这个命令必须携带包体，包体为空表示为恶意包
    if(pPkgBody == NULL)    //具体看客户端服务器约定，约定这个命令[msgCode]必须带包体，没包体就认定为恶意包，直接丢弃
    {
        return false;
    }
    
    //(2)对于同一个用户，可能同时发送来多个请求过来，造成多个线程同时为该 用户服务
    CLock lock(&pConn->logicPorcMutex);//凡是和本用户有关的访问都互斥

    //(3)拆包
    if(pPkgBody == NULL)
    {
        ngx_log_stderr(0,"wulikaka");//空的包体就会打印这句话到屏幕上
    }
    char str1[500];//初始化缓冲区存客户发过来的字符串
    char *p_instead = (char*)pPkgBody;
    memset(str1,0,sizeof(str1));
    memcpy(str1,p_instead,iBodyLength);




    //开始拆json数据





    //str1[299] = "\0";
    ngx_log_stderr(0,"invalid option: %p",str1);//将字符串打印到屏幕上
    ngx_log_stderr(0,"invalid option: %s",str1);
    printf("%s\n",str1);
    ngx_log_stderr(0,"invalid option: %d",sizeof(str1));

    //(4)处理业务逻辑
    //阿巴阿坝
    

    //(5)准备数据包并发送
    LPCOMM_PKG_HEADER pPkgHeader;	
	CMemory  *p_memory = CMemory::GetInstance();
	CCRC32   *p_crc32 = CCRC32::GetInstance();
    //int iSendLen = sizeof(STRUCT_REGISTER);  
    //a)分配要发送出去的包的内存
    char str[] = "laozijiushikuang1";
    int iSendLen = sizeof(str); 
    char *p_sendbuf = (char *)p_memory->AllocMemory(m_iLenMsgHeader+m_iLenPkgHeader+iSendLen,false);//准备发送的格式，这里是 消息头+包头+包体
    //b)填充消息头
    //void* memcpy(void* destination, const void* source, size_t num);
    memcpy(p_sendbuf,pMsgHeader,m_iLenMsgHeader);                   //消息头直接拷贝到这里来
    //c)填充包头
    pPkgHeader = (LPCOMM_PKG_HEADER)(p_sendbuf+m_iLenMsgHeader);    //指向包头
    pPkgHeader->msgCode = _CMD_REGISTER;	                        //消息代码，可以统一在ngx_logiccomm.h中定义
    pPkgHeader->msgCode = htons(pPkgHeader->msgCode);	            //htons主机序转网络序 
    pPkgHeader->pkgLen  = htons(m_iLenPkgHeader + iSendLen);        //整个包的尺寸【包头+包体尺寸】 
    //d)填充包体
    //LPSTRUCT_REGISTER p_sendInfo = (LPSTRUCT_REGISTER)(p_sendbuf+m_iLenMsgHeader+m_iLenPkgHeader);	//跳过消息头，跳过包头，就是包体了
    //。。。。。这里根据需要，填充要发回给客户端的内容,int类型要使用htonl()转，short类型要使用htons()转；
    //char *p_sendReality = p_sendbuf+m_iLenMsgHeader+m_iLenPkgHeader;//p_sendReality指针指向包体
    strcat(p_sendbuf+m_iLenPkgHeader+m_iLenMsgHeader,str);

    //e)包体内容全部确定好后，计算包体的crc32值
    //pPkgHeader->crc32   = p_crc32->Get_CRC((unsigned char *)p_sendInfo,iSendLen);
    pPkgHeader->crc32   = p_crc32->Get_CRC((unsigned char *)str,iSendLen);
    pPkgHeader->crc32   = htonl(pPkgHeader->crc32);		            //存好包体的crc值

    //f)发送数据包
    msgSend(p_sendbuf);



    return true;
}

//4
//pPkgBody是指向缓冲区的指针，iBodyLength是包体的长度
/*
bool CLogicSocket::_searchByChinese(lpngx_connection_t pConn,LPSTRUC_MSG_HEADER pMsgHeader,char *pPkgBody,unsigned short iBodyLength)
{
    //(1)首先判断包体的合法性
    //这个命令必须携带包体，包体为空表示为恶意包
    if(pPkgBody == NULL)    //具体看客户端服务器约定，约定这个命令[msgCode]必须带包体，没包体就认定为恶意包，直接丢弃
    {
        return false;
    }
    
    //(2)对于同一个用户，可能同时发送来多个请求过来，造成多个线程同时为该 用户服务
    CLock lock(&pConn->logicPorcMutex);//凡是和本用户有关的访问都互斥

    //(3)拆包
    if(pPkgBody == NULL)
    {
        ngx_log_stderr(0,"wulikaka");//空的包体就会打印这句话到屏幕上
    }
    //char str1[500];//初始化缓冲区存客户发过来的字符串
    // char *p_instead = (char*)pPkgBody;
    // memset(str1,0,sizeof(str1));
    // memcpy(str1,p_instead,iBodyLength);
    //str1[299] = "\0";
    ngx_log_stderr(0,"欧里给\n");
    char *cjson = (char*)pPkgBody;
    ngx_log_stderr(0,"*******************开始拆json数据包*******************\n");
    //开始拆json包
    //cJSON *json = cJSON_Parse(cjson);//包体是json数据，现在str1里面存了包体
    if (NULL == cjson) {
        ngx_log_stderr(0,"json怎么是空的啊!");
        return false;
    }
    ngx_log_stderr(0,"json数据大小： %d",sizeof(cjson));
    ngx_log_stderr(0,"json数据： %s",cjson);
    //开始解析json数据


    //从这里开始死进程

    cJSON *json_root = cJSON_Parse((const char*)cjson);
    if (NULL == json_root) {
        ngx_log_stderr(0,"cJSON_Parse error，json数据怎么是空的啊： %s\n",cJSON_GetErrorPtr());
        //printf("cJSON_Parse error:%s\n", cJSON_GetErrorPtr());
        return false;
    }
    cJSON *json_coment = cJSON_GetObjectItem(json_root, "comment");
    //printf("root->[%s:%s]\n", json_coment->string, json_coment->valuestring);
    ngx_log_stderr(0,"root->[%s:%s]\n", json_coment->string, json_coment->valuestring);


    // cJSON *json_name = cJSON_GetObjectItem(cjson, "comment");
    // //printf("json数据：[%s:%s]\n", json_name->string, json_name->valuestring);
    // ngx_log_stderr(0,"invalid option: %s : %s",json_name->string,json_name->valuestring);
    ngx_log_stderr(0,"---------------结束拆json数据包--------------------\n");

    // ngx_log_stderr(0,"invalid option: %p",str1);//将字符串打印到屏幕上
    // ngx_log_stderr(0,"invalid option: %s",str1);
    // printf("%s\n",str1);
    // ngx_log_stderr(0,"invalid option: %d",sizeof(str1));

    //(4)处理业务逻辑
    //阿巴阿坝
    

    //(5)准备数据包并发送
    LPCOMM_PKG_HEADER pPkgHeader;	
	CMemory  *p_memory = CMemory::GetInstance();
	CCRC32   *p_crc32 = CCRC32::GetInstance();
    //int iSendLen = sizeof(STRUCT_REGISTER);  
    //a)分配要发送出去的包的内存
    char str[] = "laozijiushikuang1";
    int iSendLen = sizeof(str); 
    char *p_sendbuf = (char *)p_memory->AllocMemory(m_iLenMsgHeader+m_iLenPkgHeader+iSendLen,false);//准备发送的格式，这里是 消息头+包头+包体
    //b)填充消息头
    //void* memcpy(void* destination, const void* source, size_t num);
    memcpy(p_sendbuf,pMsgHeader,m_iLenMsgHeader);                   //消息头直接拷贝到这里来
    //c)填充包头
    pPkgHeader = (LPCOMM_PKG_HEADER)(p_sendbuf+m_iLenMsgHeader);    //指向包头
    pPkgHeader->msgCode = _CMD_REGISTER;	                        //消息代码，可以统一在ngx_logiccomm.h中定义
    pPkgHeader->msgCode = htons(pPkgHeader->msgCode);	            //htons主机序转网络序 
    pPkgHeader->pkgLen  = htons(m_iLenPkgHeader + iSendLen);        //整个包的尺寸【包头+包体尺寸】 
    //d)填充包体
    //LPSTRUCT_REGISTER p_sendInfo = (LPSTRUCT_REGISTER)(p_sendbuf+m_iLenMsgHeader+m_iLenPkgHeader);	//跳过消息头，跳过包头，就是包体了
    //。。。。。这里根据需要，填充要发回给客户端的内容,int类型要使用htonl()转，short类型要使用htons()转；
    //char *p_sendReality = p_sendbuf+m_iLenMsgHeader+m_iLenPkgHeader;//p_sendReality指针指向包体
    strcat(p_sendbuf+m_iLenPkgHeader+m_iLenMsgHeader,str);

    //e)包体内容全部确定好后，计算包体的crc32值
    //pPkgHeader->crc32   = p_crc32->Get_CRC((unsigned char *)p_sendInfo,iSendLen);
    pPkgHeader->crc32   = p_crc32->Get_CRC((unsigned char *)str,iSendLen);
    pPkgHeader->crc32   = htonl(pPkgHeader->crc32);		            //存好包体的crc值

    //f)发送数据包
    msgSend(p_sendbuf);



    return true;
}
*/

//5
bool CLogicSocket::_HandleRegister(lpngx_connection_t pConn,LPSTRUC_MSG_HEADER pMsgHeader,char *pPkgBody,unsigned short iBodyLength)
{
    ngx_log_stderr(0,"执行了CLogicSocket::_HandleRegister()!");
    
    //(1)首先判断包体的合法性
    if(pPkgBody == NULL) //具体看客户端服务器约定，如果约定这个命令[msgCode]必须带包体，那么如果不带包体，就认为是恶意包，直接不处理    
    {        
        return false;
    }
		    
    int iRecvLen = sizeof(STRUCT_REGISTER); 
    if(iRecvLen != iBodyLength) //发送过来的结构大小不对，认为是恶意包，直接不处理
    {     
        return false; 
    }

    //(2)对于同一个用户，可能同时发送来多个请求过来，造成多个线程同时为该 用户服务，比如以网游为例，用户要在商店中买A物品，又买B物品，而用户的钱 只够买A或者B，不够同时买A和B呢？
       //那如果用户发送购买命令过来买了一次A，又买了一次B，如果是两个线程来执行同一个用户的这两次不同的购买命令，很可能造成这个用户购买成功了 A，又购买成功了 B
       //所以，为了稳妥起见，针对某个用户的命令，我们一般都要互斥,我们需要增加临界的变量于ngx_connection_s结构中
    CLock lock(&pConn->logicPorcMutex); //凡是和本用户有关的访问都互斥
    
    //(3)取得了整个发送过来的数据
    LPSTRUCT_REGISTER p_RecvInfo = (LPSTRUCT_REGISTER)pPkgBody; 

    //(4)这里可能要考虑 根据业务逻辑，进一步判断收到的数据的合法性，
       //当前该玩家的状态是否适合收到这个数据等等【比如如果用户没登陆，它就不适合购买物品等等】
    //。。。。。。。。

    //(5)给客户端返回数据时，一般也是返回一个结构，这个结构内容具体由客户端/服务器协商，这里我们就以给客户端也返回同样的 STRUCT_REGISTER 结构来举例    
    //LPSTRUCT_REGISTER pFromPkgHeader =  (LPSTRUCT_REGISTER)(((char *)pMsgHeader)+m_iLenMsgHeader);	//指向收到的包的包头，其中数据后续可能要用到
	LPCOMM_PKG_HEADER pPkgHeader;	
	CMemory  *p_memory = CMemory::GetInstance();
	CCRC32   *p_crc32 = CCRC32::GetInstance();
    int iSendLen = sizeof(STRUCT_REGISTER);  
    //a)分配要发送出去的包的内存

    //iSendLen = 65000; //unsigned最大也就是这个值
    char *p_sendbuf = (char *)p_memory->AllocMemory(m_iLenMsgHeader+m_iLenPkgHeader+iSendLen,false);//准备发送的格式，这里是 消息头+包头+包体
    //b)填充消息头
    memcpy(p_sendbuf,pMsgHeader,m_iLenMsgHeader);                   //消息头直接拷贝到这里来
    //c)填充包头
    pPkgHeader = (LPCOMM_PKG_HEADER)(p_sendbuf+m_iLenMsgHeader);    //指向包头
    pPkgHeader->msgCode = _CMD_REGISTER;	                        //消息代码，可以统一在ngx_logiccomm.h中定义
    pPkgHeader->msgCode = htons(pPkgHeader->msgCode);	            //htons主机序转网络序 
    pPkgHeader->pkgLen  = htons(m_iLenPkgHeader + iSendLen);        //整个包的尺寸【包头+包体尺寸】 
    //d)填充包体
    LPSTRUCT_REGISTER p_sendInfo = (LPSTRUCT_REGISTER)(p_sendbuf+m_iLenMsgHeader+m_iLenPkgHeader);	//跳过消息头，跳过包头，就是包体了
    //。。。。。这里根据需要，填充要发回给客户端的内容,int类型要使用htonl()转，short类型要使用htons()转；
    
    //e)包体内容全部确定好后，计算包体的crc32值
    pPkgHeader->crc32   = p_crc32->Get_CRC((unsigned char *)p_sendInfo,iSendLen);
    pPkgHeader->crc32   = htonl(pPkgHeader->crc32);		

    //f)发送数据包
    msgSend(p_sendbuf);
    /*if(ngx_epoll_oper_event(
                                pConn->fd,          //socekt句柄
                                EPOLL_CTL_MOD,      //事件类型，这里是增加
                                EPOLLOUT,           //标志，这里代表要增加的标志,EPOLLOUT：可写
                                0,                  //对于事件类型为增加的，EPOLL_CTL_MOD需要这个参数, 0：增加   1：去掉 2：完全覆盖
                                pConn               //连接池中的连接
                                ) == -1)        
    {
        ngx_log_stderr(0,"1111111111111111111111111111111111111111111111111111111111111!");
    } */
    
    /*
    sleep(100);  //休息这么长时间
    //如果连接回收了，则肯定是iCurrsequence不等了
    if(pMsgHeader->iCurrsequence != pConn->iCurrsequence)
    {
        //应该是不等，因为这个插座已经被回收了
        ngx_log_stderr(0,"插座不等,%L--%L",pMsgHeader->iCurrsequence,pConn->iCurrsequence);
    }
    else
    {
        ngx_log_stderr(0,"插座相等哦,%L--%L",pMsgHeader->iCurrsequence,pConn->iCurrsequence);
    }
    
    */
    ngx_log_stderr(0,"执行了CLogicSocket::_HandleRegister()!");
    return true;
}



























