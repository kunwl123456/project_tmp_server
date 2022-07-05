#ifndef __VM_COMMON_ALLOC_H__
#define __VM_COMMON_ALLOC_H__

#include "../_include/type_def.h"

struct CommonAllocConfig
{
    uint64_t qwTotalSize;
    int32_t  nPageSizeK;
    int32_t  nMaxPagePerAlloc;
    int32_t  nSlabMinObjSize;
    int32_t  nSlabMaxObjSize;
    int32_t  nSlabInitObjCount;
};

BOOL vm_common_alloc_init(const char* szID,const struct CommonAllocConfig* pCfg);
BOOL vm_common_alloc_restore(const char* szID);

void* vm_alignment_alloc(size_t nSize,size_t nAlignmentOrder = 3);
void  vm_alignment_free(void* p,size_t nAlignmentOrder = 3);

void* vm_page_alloc(size_t nSize);
void  vm_page_free(void* p);


#endif