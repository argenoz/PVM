#ifndef _PVM_RUNTIME_
#define _PVM_RUNTIME_ 1

#include <pvm/pvm_baseStructs.h>
#include <pvm/pvm_runtimeAnswers.h>


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
			if(!(j=(flg>>2)))
				command = commands[i];
			else
				switch(j)
				{
					case 1:
						{
							command = _JMP;
							break;
						}
					case 2:
						{
							command=_ZJMP;
							break;
						}
					
				}
			if(command)
			switch(command)
				{
					/*
					case 0:
						{
						break;	
						}
						*/
					default:
						{
							ans = _BAD_COMMAND_ERROR;
							break;
						}
					case _HALT:
						{
							
							if(ts[0])
								do
									{
										ts[1]=ts[0]->n;
										j=_PVM_STACK_MAX_BLOCK_SIZE_;
										do
											{
												j--;
												printf("%d\n",(int)ts[0]->arr[j]);
											}
										while(j);
										_delTS(ts[0]);
									}
								while(ts[0]=ts[1]);
							flg = flg^1;
							continue;
						}
					case _CHNG:
						{
							flg = flg^2;
							//_xor(actual,)
							break;
						}
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
															i=_CLB_MAX_SIZE_-1;
															bs_tmp = actual->x;
															_xor(bs_tmp,x,bs_tmp,BS*);
															x = actual;
															actual = bs_tmp;
															if(!actual)
																break;
															commands =(BYTE*) actual->v;
														}
													j--;
												}
											while(j);
										else
											do
												{
													i++;
													if(!(i^_CLB_MAX_SIZE_))
														{
															i=_CLB_MAX_SIZE_-1;
															bs_tmp = actual->x;
															_xor(bs_tmp,x,bs_tmp,BS*);
															x = actual;
															actual = bs_tmp;
															if(!actual)
																break;
															commands =(BYTE*) actual->v;
														}
													j--;
												}
											while(j);
										else
											if((flg>>2)!=1)
												ans = _COMMAND_LINE_ERROR;
									if(j!=0)
										ans = _COMMAND_LINE_ERROR;
									else
										if((flg>>2)==1)
											flg = (BYTE)( (flg&3)|(2<<2));
								}
							else
								ans = _STACK_ERROR;
							continue;
						}
					case _ZJMP:
						{
							if((flg>>2)==0)
								if(ts[0])
									if(ts[0]->arr[k])
										flg = (BYTE)( (flg&3)|4);
									else
										flg = (BYTE)( (flg&3));
								else
									ans = _STACK_ERROR;
							else
								{
									if(k)
										k--;
									else
										{
											k=_PVM_STACK_MAX_BLOCK_SIZE_-1;
											ts[0]=(ts[1]=ts[0])->n;
											_delTS(ts[1]);
										}
									if(ts[0])
										if(ts[0]->arr[k])
											flg = (BYTE)( (flg&3)|8);
										else
											flg = (BYTE)( (flg&3));
									else
										ans = _STACK_ERROR;
								}
							
							continue;
						}
					case _CJMP:
						{
							break;
							
						}
					case _GOTO:
						{
							break;
						}
						
					case _PUSH:
						{
							if(flg&2)
								if(i)
									i--;
								else
									{
										i=_CLB_MAX_SIZE_-1;
										bs_tmp = actual->x;
										_xor(bs_tmp,x,bs_tmp,BS*);
										x = actual;
										actual = bs_tmp;
										commands =(BYTE*) actual->v;
									}
							else
								if((i=i+1)!=_CLB_MAX_SIZE_)
									{
											
									}
								else
									{
										i=0;
										bs_tmp = actual->x;
										_xor(bs_tmp,x,bs_tmp,BS*);
										x = actual;
										actual = bs_tmp;
										commands =(BYTE*) actual->v;
									}
							if(actual)
								{
									if(ts[0])
									{
									k++;
									if((k==_PVM_STACK_MAX_BLOCK_SIZE_))
										{
											k=0;
											_newTS(ts[1]);
											ts[1]->n=ts[0];
											ts[0]=ts[1];
										}
									}
									else
										{
											_newTS(ts[0]);
											k=0;
										}
									ts[0]->arr[k]=commands[i];
								}
							else
								{
									ans = _COMMAND_LINE_ERROR;
									continue;
								}
							break;
						}
					case _POP:
						{
							if(ts[0])
								if(k)
									{
										//ts[0]->arr[k]=0;
										k--;
									}
								else
									{
									ts[0] = (ts[1]=ts[0])->n;	
									_delTS(ts[1]);
									k=0;
									}
							else
								ans = _STACK_ERROR;
							break;
						}
					case _LET:
						{
							if(ts[0])
								r = ts[0]->arr[k];
							else
								ans = _STACK_ERROR;
							break;
						}
					case _PUT:
						{
							if(!ts[0])
								{_newTS(ts[0]);k=0;}
							else
							if((k=k+1)==_PVM_STACK_MAX_BLOCK_SIZE_)
								{
									k=0;
									_newTS(ts[1]);
									ts[1]->n=ts[0];
									ts[0]=ts[1];
								}
							ts[0]->arr[k]=r;	
							break;
						}
					case _GET:
						{
							if(r<_PVM_REGISTER_ARRAY_SIZE_)
								{
								if(!ts[0])
									{_newTS(ts[0]);k=0;}
								else
								if((k=k+1)==_PVM_STACK_MAX_BLOCK_SIZE_)
									{
										k=0;
										_newTS(ts[1]);
										ts[1]->n=ts[0];
										ts[0]=ts[1];
									}
								ts[0]->arr[k]=regi[r];
								}
							else
								ans = _WRONG_REGISTER_ERROR;
							break;
						}
					case _SET:
						{
							if(r>=_PVM_REGISTER_ARRAY_SIZE_)
								ans = _WRONG_REGISTER_ERROR;
							else
								if(ts[0])
									{
										regi[r]=ts[0]->arr[k];
									}
								else
									ans = _STACK_ERROR;
							break;
						}
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
										j = ts[0]->arr[k];
										k = _PVM_STACK_MAX_BLOCK_SIZE_-1;
										ts[0]->arr[0] = (ts[1]=ts[0]->n)->arr[k];
										ts[1]->arr[k] = j;
										k=0;
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
								{
									j = r;
									kk = k;
									ts[1]=ts[0];
									if(j)
									{
									if(j)
										do
										{
											j--;
											if(kk)
												{
													kk--;
												}
											else
												if(ts[1])
													{
														kk = _PVM_STACK_MAX_BLOCK_SIZE_-1;
														ts[1] = ts[1]->n;
													}
												else
													{
														ans = _STACK_ERROR;	
														break;	
													}
										}
										while(j);
									if(!j)
										{
											j = ts[0]->arr[k];
											ts[0]->arr[k]=ts[1]->arr[kk];
											ts[1]->arr[kk]=j;
										}
									}
								}
							else
								ans = _STACK_ERROR;
							break;
						}
					
					
					
				}//switch
			if(!ans)	
			if(flg&2)
				if(i)
					i--;
				else
					{
						i=_CLB_MAX_SIZE_-1;
						bs_tmp = actual->x;
						_xor(bs_tmp,x,bs_tmp,BS*);
						x = actual;
						actual = bs_tmp;
						if(actual)
						commands =(BYTE*) actual->v;
						else ans = _COMMAND_LINE_ERROR;
					}
			else
				if((i=i+1)==_CLB_MAX_SIZE_)
					{
						i=0;
						bs_tmp = actual->x;
						_xor(bs_tmp,x,bs_tmp,BS*);
						x = actual;
						actual = bs_tmp;
						if(actual)
						commands =(BYTE*) actual->v;
						else ans = _COMMAND_LINE_ERROR;
						
					}
			
		}
	
	
	return ans;
	}

#endif