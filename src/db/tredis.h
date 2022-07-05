#ifndef __TREDIS_H__
#define __TREDIS_H__

#include "../../3rd/hiredis/include/hiredis.h"
#include "../_include/type_def.h"
#include <string>
#define MAX_REDIS_USER_DATA_LEN (60)



enum E_REDIS_CMD_FLAG
{
    rcfCoTask = 0,
};

#if defined(_WIN32) || (_WIN64)
struct aeEventLoop
#else
struct event_base;
#endif
struct redisAsyncContext;

typedef void(*redisCmdCallback)(struct redisAsyncContext*,redisReply*,const char*,size_t);

namespace CRedisUtils
{
#define PRIMITIVE_LEN 32
#define PATH_LEN 256
    template<typename t>
    inline const char* tostr(const t v,char* s,int32_t slen);
    
    //1
    template<>
    inline const char* tostr(const char* v,char* s,int32_t slen)
    {
        return v;
    }

    //2
    template<>
    inline const char* tostr(const int32_t v,char* s,int32_t slen)
    {
        int32_t nRetCode = 0;

        nRetCode = snprintf(s,slen,"%d",v);
        //LOG_PROCESS_ERROR(nRetCode>0);
        if(nRetCode <=0) return "";

        return s;
Exit0:
        return "";
    }

    //3
    template<>
    inline const char* tostr(const uint32_t v,char* s,int32_t slen)
    {
        int32_t nRetCode = 0;

        nRetCode = snprintf(s,slen,"%d",v);
        //LOG_PROCESS_ERROR(nRetCode>0);
        if(nRetCode <=0) return "";

        return s;
Exit0:
        return "";
    }

    //4
    template<>
    inline const char* tostr(const int64_t v,char* s,int32_t slen)
    {
        int32_t nRetCode = 0;

        nRetCode = snprintf(s,slen,"%d",v);
        //LOG_PROCESS_ERROR(nRetCode>0);
        if(nRetCode <=0) return "";

        return s;
Exit0:
        return "";
    }

    //5
    template<>
    inline const char* tostr(const uint64_t v,char* s,int32_t slen)
    {
        int32_t nRetCode = 0;

        nRetCode = snprintf(s,slen,"%d",v);
        //LOG_PROCESS_ERROR(nRetCode>0);
        if(nRetCode <=0) return "";

        return s;
Exit0:
        return "";
    }
    
    //6
    template<typename t1,typename t2>
    std::string packPath(const t1& path1,const t2& path2)
    {
        int32_t nRetCode = 0;

        static char s1[PRIMITIVE_LEN];
        static char s2[PRIMITIVE_LEN];
        static char s[PATH_LEN];

        nRetCode = snprintf(s,PATH_LEN,"%s:%s",tostr(path1,s1,PRIMITIVE_LEN),tostr(path2,s2,PRIMITIVE_LEN));
        //LOG_PROCESS_ERROR(nRetCode>0);
        if(nRetCode <=0) return "";

        return s;
Exit0:
        return "";
    }

    //7
    template<typename t1,typename t2,typename t3>
    std::string packPath(const t1& path1,const t2& path2,const t3& path3)
    {
        int32_t nRetCode = 0;

        static char s1[PRIMITIVE_LEN];
        static char s2[PRIMITIVE_LEN];
        static char s3[PRIMITIVE_LEN];
        static char s[PATH_LEN];

        nRetCode = snprintf(s,PATH_LEN,"%s:%s:%s",tostr(path1,s1,PRIMITIVE_LEN),tostr(path2,s2,PRIMITIVE_LEN),tostr(path3,s3,PRIMITIVE_LEN));
        //LOG_PROCESS_ERROR(nRetCode>0);
        if(nRetCode <=0) return "";

        return s;
Exit0:
        return "";
    }

    //8
    template<typename t1,typename t2,typename t3,typename t4>
    std::string packPath(const t1& path1,const t2& path2,const t3& path3,const t4& path4)
    {
        int32_t nRetCode = 0;

        static char s1[PRIMITIVE_LEN];
        static char s2[PRIMITIVE_LEN];
        static char s3[PRIMITIVE_LEN];
        static char s4[PRIMITIVE_LEN];
        static char s[PATH_LEN];

        nRetCode = snprintf(s,PATH_LEN,"%s:%s:%s:%s",tostr(path1,s1,PRIMITIVE_LEN),tostr(path2,s2,PRIMITIVE_LEN),tostr(path3,s3,PRIMITIVE_LEN),tostr(path4,s4,PRIMITIVE_LEN));
        //LOG_PROCESS_ERROR(nRetCode>0);
        if(nRetCode <=0) return "";

        return s;
Exit0:
        return "";
    }

    //9
    template<typename t1,typename t2,typename t3,typename t4,typename t5>
    std::string packPath(const t1& path1,const t2& path2,const t3& path3,const t4& path4,const t5& path5)
    {
        int32_t nRetCode = 0;

        static char s1[PRIMITIVE_LEN];
        static char s2[PRIMITIVE_LEN];
        static char s3[PRIMITIVE_LEN];
        static char s4[PRIMITIVE_LEN];
        static char s5[PRIMITIVE_LEN];
        static char s[PATH_LEN];

        nRetCode = snprintf(s,PATH_LEN,"%s:%s:%s:%s:%s",tostr(path1,s1,PRIMITIVE_LEN),tostr(path2,s2,PRIMITIVE_LEN),tostr(path3,s3,PRIMITIVE_LEN),tostr(path4,s4,PRIMITIVE_LEN),tostr(path5,s5,PRIMITIVE_LEN));
        //LOG_PROCESS_ERROR(nRetCode>0);
        if(nRetCode <=0) return "";

        return s;
Exit0:
        return "";
    }

    //10
    template<typename t1,typename t2,typename t3,typename t4,typename t5,typename t6>
    std::string packPath(const t1& path1,const t2& path2,const t3& path3,const t4& path4,const t5& path5,const t6& path6)
    {
        int32_t nRetCode = 0;

        static char s1[PRIMITIVE_LEN];
        static char s2[PRIMITIVE_LEN];
        static char s3[PRIMITIVE_LEN];
        static char s4[PRIMITIVE_LEN];
        static char s5[PRIMITIVE_LEN];
        static char s6[PRIMITIVE_LEN];
        static char s[PATH_LEN];

        nRetCode = snprintf(s,PATH_LEN,"%s:%s:%s:%s:%s:%s",tostr(path1,s1,PRIMITIVE_LEN),tostr(path2,s2,PRIMITIVE_LEN),tostr(path3,s3,PRIMITIVE_LEN),tostr(path4,s4,PRIMITIVE_LEN),tostr(path5,s5,PRIMITIVE_LEN),tostr(path6,s6,PRIMITIVE_LEN));
        //LOG_PROCESS_ERROR(nRetCode>0);
        if(nRetCode <=0) return "";

        return s;
Exit0:
        return "";
    }
}

class CRedis
{
    enum
    {
        eExecNum = 1024,
        ePingInterval = 2000,
        ePongInterval = 16000,
        eConnectInterval = 4000,
        eConnectTimeout = 4000,
        eDisConnectTimeout = 4000,
        eScriptName = 256,
        eScriptLen = 4096,
        eScriptSHALen = 256,
    };

    struct USERDATA
    {
        int16_t nCmd;
        int16_t cFlag;
        char szData[MAX_REDIS_USER_DATA_LEN]; 
    };

    struct CMD
    {
        int32_t nCmd;
        redisCmdCallback callback;
        char szName[eScriptName];
        char szScript[eScriptLen];
        char szKey[eScriptName];
        uint64_t qwOnCmdReq;
        uint64_t qwOnCmdReqtmp;
        uint64_t qwOnCmdRsp;
        uint64_t qwOnCmdRsptmp;
        uint64_t qwOnCmdRspRDTSC;
        uint64_t qwOnCmdRspRDTSCtmp;
    };

    struct EVAL
    {
        int32_t nCmd;
        redisCmdCallback callback;
        char szName[eScriptName];
        char szScriptSHA[eScriptSHALen];
        char szScript[eScriptLen];
        char szKey[eScriptName];
        BOOL bIsReg;
        char* pszScript;
        uint64_t qwOnEvalReq;
        uint64_t qwOnEvalReqtmp;
        uint64_t qwOnEvalRsp;
        uint64_t qwOnEvalRsptmp;
        uint64_t qwOnEvalRspRDTSC;
        uint64_t qwOnEvalRspRDTSCtmp;
    };

public:
    enum STATE
    {
        eNone,
        eConnecting,
        eConnected,
        eDisconnecting,
    };

    struct CMD_STAT
    {
        int32_t _nCmdID;
        uint64_t _qwReqCnts;
        uint64_t _qwRspCnts;
        uint64_t _qwRsoRDTSC;

        CMD_STAT(int32_t nCmdID,uint64_t qwReqCnts,uint64_t qwRspCnts,uint64_t qwRsoRDTSC)
        : _nCmdID(nCmdID),_qwReqCnts(qwReqCnts),_qwRspCnts(qwRspCnts),_qwRsoRDTSC(qwRsoRDTSC){}
    };

    struct COTASK_DATA
    {
        uint64_t qwTaskID;
        int32_t nYieldID;
    };

private:
    friend void _connect(const redisAsyncContext* c,int32_t status);
    friend void _disconnect(const redisAsyncContext* c,int32_t status);
    friend void _auth(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
    friend void _ping(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
    friend void _cmd(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
    friend void _eval(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
    friend void _RegEval(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
    friend void _CheckEval(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);

    class CReidsConn
    {
        friend void _connect(const redisAsyncContext* c,int32_t status);
        friend void _disconnect(const redisAsyncContext* c,int32_t status);
        friend void _auth(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
        friend void _ping(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
        friend void _cmd(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
        friend void _eval(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
        friend void _RegEval(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
        friend void _CheckEval(redisAsyncContext* c,void* r,void* privdata,const char* userdata,size_t userdatalen);
        
    
    };


};

#endif