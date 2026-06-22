#ifndef _PVM_OPCODES_
#define _PVM_OPCODES_ 1

#define _BASE_SHIFT ((1<<5)-1)
//31
////////////////////////////
////////////////////////////
//the basest primitive virtual machine commands.



#define _HALT (_BASE_SHIFT+1)

#define _CHNG (_HALT+1)

#define _JMP (_CHNG+1)

#define _ZJMP (_JMP+1)

#define _CJMP (_ZJMP+1)

#define _GOTO (_CJMP+1)

////////////////////////////
////////////////////////////
//base work with the stack


#define _PUSH (_GOTO+1)
//push in stack


#define _POP (_PUSH+1)
//pop from stack. only destroy the last value.


#define _LET (_POP+1)
//set the R register value is value of the last value of the stack.


#define _PUT (_LET+1)
//push in stack value of R register.


#define _GET (_PUT+1)
//push in stack value from register with number of value of R register


#define _SET (_GET+1)
//set register with number of value of R register from last stack value.



#define _SWAP (_SET+1)

#define _DSWAP (_SWAP+1)
//deep swap



////////////////////////////
////////////////////////////
//work with bytes in the stack

#define _NOT (_DSWAP+1)

#define _AND (_NOT+1)

#define _LSHIFT (_AND+1)

#define _RSHIFT (_LSHIFT+1)



#endif
