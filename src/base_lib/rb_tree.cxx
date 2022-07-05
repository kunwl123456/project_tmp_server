#include "rb_tree.h"

#ifdef WIN32
    #pragma warning(push)
    #pragma warning(disable:4312)
    #pragma warning(disable:4244)
#endif

#define RB_RED   (0)
#define RB_BLACK (1)    

#define RB_GET_PARENT(__node__)       ((RB_TREE_NODE*)((__node__)->uColor & ~3))








