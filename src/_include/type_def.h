#ifndef __TYPES_DEF_H_
#define __TYPES_DEF_H_

#include <stddef.h>
#include <time.h>
#include <sys/types.h>

typedef int BOOL;
#ifndef TRUE
    #define TRUE (1)
#endif
#ifndef FALSE
    #define FALSE (0)
#endif

#if !defined(_WIN32) && !defined(_WIN64)
    #include <stdint.h>
    #include <inttypes.h>

    #undef PRIdPTR
    #if defined (__LP64__) || defined (__64BIT__) || defined (_LP64) || (__WORDSIZE == 64)
        #define PRIdPTR "lu"
    #else
        #define PRIdPTR "u"
    #endif

    #undef PRIu64
    #if defined (__LP64__) || defined (__64BIT__) || defined (_LP64) || (__WORDSIZE == 64)
        #define PRIu64 "lu"
    #else
        #define PRIu64 "llu"
    #endif
#endif


#define FLT_EPS  (1.192092896e-04F)
#define FLT_BZERO  (-FLT_EPS)
#define FLT_HZERO  (FLT_EPS)
//趋近于0
#define FLT_ZERO(x)   (x>= FLT_BZERO && x <= FLT_HZERO)

#endif










