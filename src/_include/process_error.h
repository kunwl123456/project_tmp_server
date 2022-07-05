#ifndef _PROCESS_ERROR_H__
#define _PROCESS_ERROR_H__

#include "type_def.h"


enum WARNING_TAG
{
    warnMaxCount = 32,

    warnGSBegin = 0,

    warnGSDailySpawn = warnGSBegin,
    warnGSMainAttach,
    warnGSGetSRoleTooOften,
    warnGSGetSRoleFull,
    warnGSSRoleAllocFail,
    warnGSGetGuildBriefFull,

    warnGSEnd = warnMaxCount,


};

extern uint64_t g_qwWarningFlag[warnMaxCount];

inline void set_warning(int32_t nFlag)
{
    g_qwWarningFlag[nFlag]++;
}



#endif