


#include "pvm/pvm_opcodes_1.h"

int foo(int g)
	{
		return (~g)^(g>>1)^(g<<1);
		
	}

