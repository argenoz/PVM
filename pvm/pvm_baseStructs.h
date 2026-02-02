#ifndef _PVM_BASE_STRUCTS
#define _PVM_BASE_STRUCTS 1




#define _PVM_REGISTER_ARRAY_SIZE_ 16

#define _PVM_BASE_STRUCTS_INTI unsigned int
#ifndef INTI
	#define INTI _PVM_BASE_STRUCTS_INTI
#else
	#undef INTI
	#define INTI _PVM_BASE_STRUCTS_INTI
#endif


#define _PVM_BASE_STRUCTS_BYTE unsigned char
#ifndef BYTE
	#define BYTE _PVM_BASE_STRUCTS_BYTE
#else
	#undef BYTE
	#define BYTE _PVM_BASE_STRUCTS_BYTE
#endif


//#undef _PVM_BASE_STRUCTS_INTI

#include <malloc.h>

#define _new_(_,__) {_=malloc(sizeof(__));} 
#define _del_(_) {if(_){free(_);}}

#define _xor(_,__,___,____) {INTI _____ = sizeof(____); do{_____--;((char*)&___)[_____]=(char)(((char*)&_)[_____]^((char*)&__)[_____]);}while(_____); }

#define _swap(_,__,___) {INTI ____=sizeof(___); do{____--;((char*)&_)[____]=(char)(((char*)&_)[____]^((char*)&__)[____]); ((char*)&__)[____]=(char)(((char*)&_)[____]^((char*)&__)[____]); ((char*)&_)[____]=(char)(((char*)&_)[____]^((char*)&__)[____]);  }while(____);}


struct BaseStack
	{
		struct BaseStack *x;
		void *v;
	};

#define BS struct BaseStack

/*
#define _newBS(_) {_ = malloc(sizeof(BS); _->v=_->x=NULL; }

#define _delBS(_){if(_){free(_);}}
*/
#define _newBS(_) {_new_(_,BS); _->v=_->x=NULL; }

#define _delBS(_){_del_(_);}

#define _CLB_MAX_SIZE_ 64

/*
#define CLB struct commandLineBlock


struct commandLineBlock
	{
		BYTE  clb[_CLB_MAX_SIZE_];
		CLB *n;
	};




#define _newCLB(_) {_new_(_,CLB); INTI __ = sizeof(); }
#define _delCLB(_) {_del_(_);}
*/

#define _PVM_STACK_MAX_BLOCK_SIZE_ 1

struct TheStack
	{
		BYTE arr[_PVM_STACK_MAX_BLOCK_SIZE_];
		struct TheStack *n;
	};

#define TS struct TheStack

#define _newTS(_) {_new_(_,TS);_->n=NULL;  INTI __ = sizeof(BYTE)*_PVM_STACK_MAX_BLOCK_SIZE_;do{__--;_->arr[__]=0;}while(__); }
#define _delTS(_) {_del_(_);}


#endif