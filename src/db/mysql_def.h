#ifndef __MYSQL_DEF__
#define __MYSQL_DEF__

#include "../_include/type_def.h"
const uint32_t WK_MYSQL_VERSION = 1;

#define ANGELMYSQL_MAX_NAME_LEN (32)
#define ANGELMYSQL_SUPPORT_CHARACTER_COUNT (50)
#define ANGELMYSQL_MAX_SQL_LEN (1024)

enum MYSQL_ERROR_CODE
{
    ER_DUP_ENTRY = 1062,
};

enum 
{
    CHARACTER_SET_CLIENT = 0,
    CHARACTER_SET_CONNECTION,
    CHARACTER_SET_DATABASE,
    CHARACTER_SET_RESULTS,
    CHARACTER_SET_COUNT,
};

typedef struct tagMysqlConnInfo
{
    tagMysqlConnInfo()
    {
        m_szHost[0] = '\0';
        m_wPort = 3306;
        m_szDataBase[0] = '\0';
        m_szLogin[0] = '\0';
        m_szPassWord[0] = '\0';
        m_szCharactSet[0] = '\0';
    }

    char m_szHost[ANGELMYSQL_MAX_NAME_LEN];      //mysql IP地址
    uint16_t m_wPort;                            //mysql 端口，默认3306
    char m_szDataBase[ANGELMYSQL_MAX_NAME_LEN];  //数据库名
    char m_szLogin[ANGELMYSQL_MAX_NAME_LEN];     //用户名
    char m_szPassWord[ANGELMYSQL_MAX_NAME_LEN];  //密码
    char m_szCharactSet[ANGELMYSQL_MAX_NAME_LEN];//字符集，必须是小写名称

}MYSQL_CONN_INFO;



#endif