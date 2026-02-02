#ifndef _PVM_OPCODES_
#define _PVM_OPCODES_ 1


//31
////////////////////////////
////////////////////////////
//the basest primitive virtual machine commands.
#define _HALT 32

#define _CHNG 33

#define _JMP 34

#define _ZJMP 35

#define _CJMP 36

#define _GOTO 37

////////////////////////////
////////////////////////////
//base work with the stack


#define _PUSH 38
//push in stack


#define _POP 39
//pop from stack. only destroy the last value.


#define _LET 40
//set the R register value is value of the last value of the stack.


#define _PUT 41
//push in stack value of R register.


#define _GET 42
//push in stack value from register with number of value of R register


#define _SET 43
//set register with number of value of R register from last stack value.



#define _SWAP 44

#define _DSWAP 45
//deep swap



////////////////////////////
////////////////////////////
//work with bytes in the stack

#define _NOT 46

#define _AND 47

#define _LSHIFT 48

#define _RSHIFT 49



#endif
