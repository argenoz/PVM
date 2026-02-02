#include <stdio.h>

#include "pvm/pvm_opcodes.h"

#include "pvm/pvm_runtime.h"


int main(int ac, char** as)
	{
		BYTE qwe[]={
			_HALT,//0
			_CHNG,//1
			_PUSH, //2
			4,//3
			_PUSH,//4 
			41,//5
			_PUSH,//6 
			42,//7
			_POP,//8
			_PUSH, //9
			1,//10
			_LET,//11
			_PUT,//12
			_PUT,//13
			_POP,//14
			_POP,//15
			_POP,//16
			_PUSH, //17
			5,//18
			_LET,//19
			_POP,//20
			_SET,//21
			_POP,//22
			_GET,//23
			_GET,//24
			_GET,//25
			_PUSH, //26
			17,//27
			_SWAP,//28
			_PUSH,//29
			4,//30
			_LET,//31
			_POP,//32
			_DSWAP,//33
			_HALT,//////////////////34
			_PUSH,////
			7,
			_JMP,
			_ZJMP,
			37,
			_PUSH,
			0,
			_PUSH,
			_POP,
			_CHNG,
			 
		};
		printf("%d____\n",sizeof(qwe));
		//return 0;
		BS* actual,*x;
		actual = malloc(sizeof(BS));
		actual->v = qwe;
		printf("___________\n");
		INTI res=pvm_execute(actual,NULL,35);
		printf("___________%d_________\n",res);
	}