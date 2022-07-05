#ifndef _LINKED_LIST_H__
#define _LINKED_LIST_H__

#include "type_def.h"

#define list_node_cast(__obj_class_ptr__,__member__,__node_ptr__) \
      ((__obj_class_ptr__)((char*)(__node_ptr__) - (char*)&(((__obj_class_ptr__)0)->__member__)))

struct LINKED_LIST_NODE
{
    LINKED_LIST_NODE* pPrev;
    LINKED_LIST_NODE* pNext;
};

inline void clear_list_node(LINKED_LIST_NODE* pNode)
{
    pNode->pNext = NULL;
    pNode->pPrev = NULL;
}

class CLinkedList
{
public:
    CLinkedList(){}
    ~CLinkedList(){}

    inline void init(void);
    inline void unit(void);

    inline BOOL empty(void);

    inline LINKED_LIST_NODE& head(void);
    inline LINKED_LIST_NODE& rear(void);

    static inline BOOL insert_after(LINKED_LIST_NODE* pNewNode,LINKED_LIST_NODE* pInsertAfter);
    static inline BOOL insert_before(LINKED_LIST_NODE* pNewNode,LINKED_LIST_NODE* pInsertAfter);

    static inline BOOL remove(LINKED_LIST_NODE* pNode);

    inline BOOL push_head(LINKED_LIST_NODE* pNode);
    inline LINKED_LIST_NODE* pop_head(void);

    inline BOOL push_read(LINKED_LIST_NODE* pNode);
    inline LINKED_LIST_NODE* pop_rear(void);

    inline void merge_from(CLinkedList& OtherList);

private:
    LINKED_LIST_NODE m_Head;
    LINKED_LIST_NODE m_Rear;
};

#endif