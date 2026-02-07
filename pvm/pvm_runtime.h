#ifndef _PVM_RUNTIME_
#define _PVM_RUNTIME_ 1

#include "pvm/pvm_baseStructs.h"
#include "pvm/pvm_opcodes.h"
#include "pvm/pvm_runtimeAnswers.h"


INTI pvm_execute(BS* actual, BS* x, BYTE st_i)
	{
	INTI ans=0;
	BS* bs_tmp;
	BYTE *commands, command,b[2];
	BYTE
		flg,
		r;//r regist
	BYTE 
		i,//index for commands
		j,//universal index
		k,kk;//index for stack
	BYTE regi[_PVM_REGISTER_ARRAY_SIZE_];//all registers
	TS *ts[2];
	
	r = _PVM_REGISTER_ARRAY_SIZE_;
	do
		{
			r--;
			regi[r]=0;
		}
	while(r);
	ts[0]=ts[1]=NULL;
	flg=0;
	i=st_i;
	k=0;
	
	commands =(BYTE*) actual->v;
	while(1)
		{
			if(flg&1)
				break;
			else
			if(ans)
			command = _HALT;
			else
			command = commands[i];
			if(command)
			switch(command)
				{
					default:
						{
							ans = _BAD_COMMAND_ERROR;
							continue;
						}
					case _HALT:
						{
							ts[1]=ts[0];
							while(ts[1])
								{
									/*
									do
									{
										if(k)
											k--;
										printf("\t%u\n",ts[1]->arr[k]);
									}
									while(k);
									*/
									ts[1]=ts[1]->n;
									k = _PVM_STACK_MAX_BLOCK_SIZE_;
								}
							if(ts[0])
								do
								{
									ts[1]=ts[0]->n;
									_delTS(ts[0]);
								}
								while(ts[0]=ts[1]);
							
							
							flg = flg^1;
							continue;
						}//_HALT
					case _CHNG:
						{
							flg=flg^2;
							bs_tmp = actual->x;
							_xor(bs_tmp,x,x,BS*);
							break;
						}//_CHNG
					case _JMP:
						{
							if(ts[0])
								{
									j = ts[0]->arr[k];
									if(j)
										if(flg&2)
											do
											{
												if(i)
													i--;
												else
													{
														
														_xor(bs_tmp,x,actual,BS*);
														if(actual)
															{
															i = _CLB_MAX_SIZE_-1;
															x = bs_tmp;
															commands =(BYTE*) actual->v;
															}
														else 
															{
																ans = _COMMAND_LINE_ERROR;
																break;
															}
													}
											}
											while(j=j-1);
										else
											do
											{
												if((i=1+i)==_CLB_MAX_SIZE_)
													{
														bs_tmp = actual->x;
														_xor(bs_tmp,x,actual,BS*);
														if(actual)
															{
															x = bs_tmp;
															i=0;
															commands =(BYTE*) actual->v;
															}
														else 
															{
																ans = _COMMAND_LINE_ERROR;
																break;
															}															
													}
											}
											while(j=j-1);
									else
										ans = _COMMAND_LINE_ERROR;
									//continue;
								}
								else
							ans = _STACK_ERROR;
							continue;
						}//_JMP
					case _ZJMP:
						{
						while(1)
						{
							if(ts[0])
								{
									j = ts[0]->arr[k];
									if(j)
										if(flg&2)
											do
											{
												if(i)
													i--;
												else
													{
														i = _CLB_MAX_SIZE_-1;
														_xor(bs_tmp,x,actual,BS*);
														if(actual)
															{
															x = bs_tmp;
															commands =(BYTE*) actual->v;
															}
														else 
															{
																ans = _COMMAND_LINE_ERROR;
																break;
															}
													}
											}
											while(j=j-1);
										else
											do
											{
												if((i=1+i)==_CLB_MAX_SIZE_)
													{
														bs_tmp = actual->x;
														_xor(bs_tmp,x,actual,BS*);
														if(actual)
															{
															x = bs_tmp;
															commands =(BYTE*) actual->v;
															}
														else 
															{
																ans = _COMMAND_LINE_ERROR;
																break;
															}															
													}
											}
											while(j=j-1);
									else
										flg = flg^4;
								}
							else
								ans = _STACK_ERROR;	
							if(ans)
								break;
							if(k)
								k--;
							else
								{
									ts[0]=(ts[1]=ts[0])->n;
									_delTS(ts[1]);
									k= _PVM_STACK_MAX_BLOCK_SIZE_ - 1;
								}
							if(flg&4)
								{
									flg = flg^4;
									break;
								}
								
						}//_ZJMP while
							continue;
						}//_ZJMP
					case _CJMP:
						{
							ans = _STACK_ERROR;
							if(k)
								if(k-1)
										{
											ans = 0;
											if(ts[0]->arr[k])
												j = ts[0]->arr[k-2];
											else
												j = ts[0]->arr[k-1];
										}
								else
									if(ts[0]->n)
										{
											ans = 0;
											if(ts[0]->arr[k])
												j = ts[0]->n->arr[_PVM_STACK_MAX_BLOCK_SIZE_-2];
											else
												j = ts[0]->n->arr[_PVM_STACK_MAX_BLOCK_SIZE_-1];
										}
								if(!ans)
									if(!j)
												{
												ans = _COMMAND_LINE_ERROR;	
												}
											else
											if(flg&2)
												do
												{
													if(i)
														i--;
													else
														{
															
															bs_tmp = actual->x;
															_xor(bs_tmp,x,actual,BS*);
															if(actual)
																{
																x = bs_tmp;
																i = _CLB_MAX_SIZE_-1;
																commands =(BYTE*) actual->v;
																}
															else 
																{
																	ans = _COMMAND_LINE_ERROR;
																	break;
																}
														}
													
												}
												while(j=j-1);
											else
												do
												{
													if((i=1+i)==_CLB_MAX_SIZE_)
														{
															bs_tmp = actual->x;
															_xor(bs_tmp,x,actual,BS*);
															x = bs_tmp;
															if(actual)
																{
																x = bs_tmp;
																i=0;
																commands =(BYTE*) actual->v;
																}
															else 
																{
																	ans = _COMMAND_LINE_ERROR;
																	break;
																}															
														}
												}
												while(j=j-1);
							continue;
						}//_CJMP
					case _GOTO:
						{
							
							break;
						}//goto
					case _PUSH:
						{
							
							if(flg&2)
								if(i)
									i--;
								else
									{
										bs_tmp = actual->x;
										_xor(bs_tmp,x,actual,BS*);
										if(actual)
											{
											x = bs_tmp;
											commands = (BYTE*) actual->v;
											i = _CLB_MAX_SIZE_-1;
											}
										else
											ans = _STACK_ERROR;
									}
							else
								if((i=1+i)==_CLB_MAX_SIZE_)
									{
										bs_tmp = actual->x;
										_xor(bs_tmp,x,actual,BS*);
										if(actual)
											{
											x = bs_tmp;
											commands = (BYTE*) actual->v;
											i = 0;
											}
										else
											ans = _STACK_ERROR;
									}
							if(!ans)
								{
									if(!ts[0])
									{
										k=0;
										_newTS(ts[0]);
									}
									else
									 if((k=k+1)==_PVM_STACK_MAX_BLOCK_SIZE_)
										{
											_newTS(ts[1]);
											ts[1]->n=ts[0];
											ts[0]=ts[1];
											k=0;
										}
									ts[0]->arr[k]=commands[i];	
								}
							break;
						}//push
					case _POP:
						{
							if(ts[0])
									if(k)
										k--;
									else
										{
											k = _PVM_STACK_MAX_BLOCK_SIZE_-1;
											ts[0]=(ts[1]=ts[0])->n;
											_delTS(ts[1]);
										}
							else
								ans = _STACK_ERROR;
							break;
						}//pop
					case _LET:
						{// stack -> r
							if(ts[0])
								r = ts[0]->arr[k];
							else
								ans = _STACK_ERROR;
							break;
						}//let
					case _PUT:
						{//r -> stack
							
									if(!ts[0])
									{
										k=0;
										_newTS(ts[0]);
									}
									else
									 if((k=k+1)==_PVM_STACK_MAX_BLOCK_SIZE_)
										{
											_newTS(ts[1]);
											ts[1]->n=ts[0];
											ts[0]=ts[1];
											k=0;
										}
									ts[0]->arr[k]=r;	
								
							break;
						}//put
					case _GET:
						{//regi[r] -> stack 
							if(r<_PVM_REGISTER_ARRAY_SIZE_)
								{
									if(!ts[0])
									{
										k=0;
										_newTS(ts[0]);
									}
									else
									 if((k=k+1)==_PVM_STACK_MAX_BLOCK_SIZE_)
										{
											_newTS(ts[1]);
											ts[1]->n=ts[0];
											ts[0]=ts[1];
											k=0;
										}
									ts[0]->arr[k]=regi[r];
									
									
								}
							else
								ans = _R_VALUE_OUT_BOUNDS;
							break;
						}//get
					case _SET:
						{//stack -> regi[r]
							if(r<_PVM_REGISTER_ARRAY_SIZE_)
								if(ts[0])
									regi[r]=ts[0]->arr[k];
								else
									ans = _STACK_ERROR;
							else
								ans = _R_VALUE_OUT_BOUNDS;
							break;
						}//set
					case _SWAP:
						{
							if(ts[0])
								if(k)
									{
										j = ts[0]->arr[k];
										ts[0]->arr[k]=ts[0]->arr[k-1];
										ts[0]->arr[k-1]=j;
									}
								else
									if(ts[0]->n)
										{
											j = _PVM_STACK_MAX_BLOCK_SIZE_-1;
											ts[1]=ts[0]->n;
											ts[1]->arr[j]=ts[1]->arr[j]^ts[0]->arr[k];
											ts[0]->arr[j]=ts[1]->arr[j]^ts[0]->arr[k];
											ts[1]->arr[j]=ts[1]->arr[j]^ts[0]->arr[k];
										}
									else
										ans = _STACK_ERROR;
							else
								ans = _STACK_ERROR;
							break;
						}
					case _DSWAP:
						{
							if(ts[0])
								if(k)
									j = ts[0]->arr[k];
								else
									if(ts[0]->n)
										j = ts[0]->arr[k];
									else
										ans = _STACK_ERROR;
							else
								ans = _STACK_ERROR;
							if(j&&!ans)
								{
									ts[1]=ts[0];
									kk = k;
									do
										{
											if(k)
												k--;
											else
												{
												k= _PVM_STACK_MAX_BLOCK_SIZE_-1;
												ts[1]=ts[1]->n;
												if(!ts[1])
													break;
												}
											j--;
										}
									while(kk);
									if(kk)
										ans = _STACK_ERROR;
									else
										{
											ts[0]->arr[k]=ts[0]->arr[k]^ts[1]->arr[kk];
											ts[1]->arr[k]=ts[0]->arr[k]^ts[1]->arr[kk];
											ts[0]->arr[k]=ts[0]->arr[k]^ts[1]->arr[kk];
										}
								}
							
							break;
						}
					case _NOT:
						{
							if(ts[0])
								{
									j = ~(ts[0]->arr[k]);
									if((k=k+1)==_PVM_STACK_MAX_BLOCK_SIZE_)
										{
											_newTS(ts[1]);
											ts[1]->n=ts[0];
											ts[0]=ts[1];
											k=0;
										}
									ts[0]->arr[k]=j;
								}
							else 
								ans = _STACK_ERROR;
							break;
						}
						
					case _AND:
						{
							
							if(ts[0])
								if(k)
									j = (BYTE)((ts[0]->arr[k])&(ts[0]->arr[k-1]));
								else
									if(ts[0]->n)
										j = (BYTE)((ts[0]->arr[k])&(ts[0]->n->arr[_PVM_STACK_MAX_BLOCK_SIZE_-1]));
									else 
										ans = _STACK_ERROR;
							else
								ans = _STACK_ERROR;
							if(!ans)
								{
									if((k=k+1)==_PVM_STACK_MAX_BLOCK_SIZE_)
										{
											_newTS(ts[1]);
											ts[1]->n=ts[0];
											ts[0]=ts[1];
											k=0;
										}
									ts[0]->arr[k]=j;
								}
							break;
						}
					case _LSHIFT:
					
						{
							if(ts[0])
								{
									j = ((ts[0]->arr[k])<<1);
									/*
									if(command == _LSHIFT)
										j = (j<<1);
									else
										j = (j>>1);
									*/
									if((k=k+1)==_PVM_STACK_MAX_BLOCK_SIZE_)
										{
											_newTS(ts[1]);
											ts[1]->n=ts[0];
											ts[0]=ts[1];
											k=0;
										}
									ts[0]->arr[k]=j;
								}
							else 
								ans = _STACK_ERROR;
							break;
						}
					case _RSHIFT:
						{
							if(ts[0])
								{
									j = ((ts[0]->arr[k])>>1);
									if((k=k+1)==_PVM_STACK_MAX_BLOCK_SIZE_)
										{
											_newTS(ts[1]);
											ts[1]->n=ts[0];
											ts[0]=ts[1];
											k=0;
										}
									ts[0]->arr[k]=j;
								}
							else 
								ans = _STACK_ERROR;
							break;
						}
					
					
				}
			
			if(!ans)
				if(flg&2)
					if(i)
						i--;
					else
						{
							i = _CLB_MAX_SIZE_ - 1;
							bs_tmp = actual;
							_xor(bs_tmp,x,actual,BS*);
							x = bs_tmp;
							if(actual)
								commands = (BYTE*) actual->v;
							else
								ans = _COMMAND_LINE_ERROR;
						}
				else
					if( ( i = i + 1 ) == _CLB_MAX_SIZE_ )
						{
							i = 0;
							bs_tmp = actual;
							_xor(bs_tmp,x,actual,BS*);
							x = bs_tmp;
							if(actual)
								commands = (BYTE*) actual->v;
							else
								ans = _COMMAND_LINE_ERROR;
						}
			
			
		}
	
	
	return ans;
	}

#endif