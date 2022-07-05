#ifndef __MYSQL_WRAP__
#define __MYSQL_WRAP__

#include "mysql_def.h"

struct MYSQL_RES;
typedef char **MYSQL_ROW;
class CMysqlRecordSet
{
public:
    CMysqlRecordSet();
    ~CMysqlRecordSet();

    uint32_t get_row_num();
    uint32_t get_field_num();
    bool fetch_row();
    bool get_field_value(uint32_t dwIndex,const char** ppVlaue,uint32_t& dwLen);
    void release();

    MYSQL_RES* m_res;
    MYSQL_ROW  m_row;
    unsigned long* m_adwLengths;

};


#endif