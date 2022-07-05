#ifndef __ERRO_CHECK_H__
#define __ERRO_CHECK_H__
#define ARGS_CHECK(argc, val) \
    if(argc != val) { \
        printf("error args\n"); \
        return -1; \
    } 


#define ERROR_CHECK(ret, retVal, funcName) { \
    if(ret == retVal) { \
        perror(funcName); \
        return -1; \
    } \
}

#define THREAD_ERROR_CHECK(ret, funcName) \
    do { \
        if (0 != ret) { \
            printf("%s : %s\n", funcName, strerror(ret)); \
        } \
    }while(0)
#endif