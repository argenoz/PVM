	.file	"main.c"
	.text
	.globl	_foo
	.def	_foo;	.scl	2;	.type	32;	.endef
_foo:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	notl	%eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	sarl	%eax
	xorl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %eax
	xorl	%edx, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section .rdata,"dr"
LC0:
	.ascii "%d\12\0"
	.text
	.globl	_pvm_execute
	.def	_pvm_execute;	.scl	2;	.type	32;	.endef
_pvm_execute:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$132, %esp
	.cfi_offset 3, -12
	movl	16(%ebp), %eax
	movb	%al, -108(%ebp)
	movl	$0, -12(%ebp)
	movb	$16, -19(%ebp)
L4:
	movzbl	-19(%ebp), %eax
	subl	$1, %eax
	movb	%al, -19(%ebp)
	movzbl	-19(%ebp), %eax
	movb	$0, -94(%ebp,%eax)
	cmpb	$0, -19(%ebp)
	jne	L4
	movl	$0, -100(%ebp)
	movl	-100(%ebp), %eax
	movl	%eax, -104(%ebp)
	movb	$0, -18(%ebp)
	movzbl	-108(%ebp), %eax
	movb	%al, -20(%ebp)
	movb	$0, -22(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
L115:
	movzbl	-18(%ebp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	L118
	cmpl	$0, -12(%ebp)
	je	L7
	movb	$32, -17(%ebp)
	jmp	L8
L7:
	movzbl	-18(%ebp), %eax
	shrb	$2, %al
	movb	%al, -21(%ebp)
	cmpb	$0, -21(%ebp)
	jne	L9
	movzbl	-20(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -17(%ebp)
	jmp	L8
L9:
	movzbl	-21(%ebp), %eax
	cmpl	$1, %eax
	je	L10
	cmpl	$2, %eax
	je	L11
	jmp	L8
L10:
	movb	$34, -17(%ebp)
	jmp	L8
L11:
	movb	$35, -17(%ebp)
	nop
L8:
	cmpb	$0, -17(%ebp)
	je	L12
	movzbl	-17(%ebp), %eax
	subl	$32, %eax
	cmpl	$13, %eax
	ja	L13
	movl	L15(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L15:
	.long	L14
	.long	L16
	.long	L17
	.long	L18
	.long	L119
	.long	L119
	.long	L21
	.long	L22
	.long	L23
	.long	L24
	.long	L25
	.long	L26
	.long	L27
	.long	L28
	.text
L13:
	movl	$2, -12(%ebp)
	jmp	L12
L14:
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L29
L32:
	movl	-104(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -100(%ebp)
	movb	$1, -21(%ebp)
L30:
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	movl	-104(%ebp), %edx
	movzbl	-21(%ebp), %eax
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	cmpb	$0, -21(%ebp)
	jne	L30
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L31
	movl	-104(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
L31:
	movl	-100(%ebp), %eax
	movl	%eax, -104(%ebp)
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	jne	L32
L29:
	xorb	$1, -18(%ebp)
	jmp	L33
L16:
	xorb	$2, -18(%ebp)
	jmp	L12
L17:
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L34
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	(%edx,%eax), %eax
	movb	%al, -21(%ebp)
	cmpb	$0, -21(%ebp)
	je	L35
	movzbl	-18(%ebp), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	L36
L42:
	cmpb	$0, -20(%ebp)
	je	L37
	movzbl	-20(%ebp), %eax
	subl	$1, %eax
	movb	%al, -20(%ebp)
	jmp	L38
L37:
	movb	$63, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	movl	$4, -28(%ebp)
L39:
	subl	$1, -28(%ebp)
	leal	-76(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	leal	-76(%ebp), %ecx
	movl	-28(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %ebx
	leal	12(%ebp), %ecx
	movl	-28(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	xorl	%ebx, %edx
	movb	%dl, (%eax)
	cmpl	$0, -28(%ebp)
	jne	L39
	movl	8(%ebp), %eax
	movl	%eax, 12(%ebp)
	movl	-76(%ebp), %eax
	movl	%eax, 8(%ebp)
	cmpl	$0, 8(%ebp)
	je	L120
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
L38:
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	cmpb	$0, -21(%ebp)
	jne	L42
	jmp	L47
L36:
	movzbl	-20(%ebp), %eax
	addl	$1, %eax
	movb	%al, -20(%ebp)
	cmpb	$64, -20(%ebp)
	jne	L44
	movb	$63, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	movl	$4, -32(%ebp)
L45:
	subl	$1, -32(%ebp)
	leal	-76(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	leal	-76(%ebp), %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %ebx
	leal	12(%ebp), %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	xorl	%ebx, %edx
	movb	%dl, (%eax)
	cmpl	$0, -32(%ebp)
	jne	L45
	movl	8(%ebp), %eax
	movl	%eax, 12(%ebp)
	movl	-76(%ebp), %eax
	movl	%eax, 8(%ebp)
	cmpl	$0, 8(%ebp)
	je	L121
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
L44:
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	cmpb	$0, -21(%ebp)
	jne	L36
	jmp	L47
L35:
	movzbl	-18(%ebp), %eax
	shrb	$2, %al
	cmpb	$1, %al
	je	L47
	movl	$1, -12(%ebp)
	jmp	L47
L120:
	nop
	jmp	L47
L121:
	nop
L47:
	cmpb	$0, -21(%ebp)
	je	L48
	movl	$1, -12(%ebp)
	jmp	L122
L48:
	movzbl	-18(%ebp), %eax
	shrb	$2, %al
	cmpb	$1, %al
	jne	L122
	movzbl	-18(%ebp), %eax
	andl	$3, %eax
	orl	$8, %eax
	movb	%al, -18(%ebp)
	jmp	L122
L34:
	movl	$3, -12(%ebp)
	jmp	L122
L18:
	movzbl	-18(%ebp), %eax
	shrb	$2, %al
	testb	%al, %al
	jne	L51
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L52
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	(%edx,%eax), %eax
	testb	%al, %al
	je	L53
	movzbl	-18(%ebp), %eax
	andl	$3, %eax
	orl	$4, %eax
	movb	%al, -18(%ebp)
	jmp	L33
L53:
	andb	$3, -18(%ebp)
	jmp	L33
L52:
	movl	$3, -12(%ebp)
	jmp	L33
L51:
	cmpb	$0, -22(%ebp)
	je	L57
	movzbl	-22(%ebp), %eax
	subl	$1, %eax
	movb	%al, -22(%ebp)
	jmp	L58
L57:
	movb	$0, -22(%ebp)
	movl	-104(%ebp), %eax
	movl	%eax, -100(%ebp)
	movl	-100(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -104(%ebp)
	movl	-100(%ebp), %eax
	testl	%eax, %eax
	je	L58
	movl	-100(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
L58:
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L59
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	(%edx,%eax), %eax
	testb	%al, %al
	je	L60
	movzbl	-18(%ebp), %eax
	andl	$3, %eax
	orl	$8, %eax
	movb	%al, -18(%ebp)
	jmp	L33
L60:
	andb	$3, -18(%ebp)
	jmp	L33
L59:
	movl	$3, -12(%ebp)
	jmp	L33
L21:
	movzbl	-18(%ebp), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	L62
	cmpb	$0, -20(%ebp)
	je	L63
	movzbl	-20(%ebp), %eax
	subl	$1, %eax
	movb	%al, -20(%ebp)
	jmp	L66
L63:
	movb	$63, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	movl	$4, -36(%ebp)
L65:
	subl	$1, -36(%ebp)
	leal	-76(%ebp), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	leal	-76(%ebp), %ecx
	movl	-36(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %ebx
	leal	12(%ebp), %ecx
	movl	-36(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	xorl	%ebx, %edx
	movb	%dl, (%eax)
	cmpl	$0, -36(%ebp)
	jne	L65
	movl	8(%ebp), %eax
	movl	%eax, 12(%ebp)
	movl	-76(%ebp), %eax
	movl	%eax, 8(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L66
L62:
	addb	$1, -20(%ebp)
	cmpb	$64, -20(%ebp)
	jne	L66
	movb	$0, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	movl	$4, -40(%ebp)
L67:
	subl	$1, -40(%ebp)
	leal	-76(%ebp), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	leal	-76(%ebp), %ecx
	movl	-40(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %ebx
	leal	12(%ebp), %ecx
	movl	-40(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	xorl	%ebx, %edx
	movb	%dl, (%eax)
	cmpl	$0, -40(%ebp)
	jne	L67
	movl	8(%ebp), %eax
	movl	%eax, 12(%ebp)
	movl	-76(%ebp), %eax
	movl	%eax, 8(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
L66:
	cmpl	$0, 8(%ebp)
	je	L68
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L69
	movzbl	-22(%ebp), %eax
	addl	$1, %eax
	movb	%al, -22(%ebp)
	cmpb	$1, -22(%ebp)
	jne	L72
	movb	$0, -22(%ebp)
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -100(%ebp)
	movl	-100(%ebp), %eax
	movl	$0, 4(%eax)
	movl	$1, -44(%ebp)
L71:
	subl	$1, -44(%ebp)
	movl	-100(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	cmpl	$0, -44(%ebp)
	jne	L71
	movl	-100(%ebp), %eax
	movl	-104(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-100(%ebp), %eax
	movl	%eax, -104(%ebp)
	jmp	L72
L69:
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -104(%ebp)
	movl	-104(%ebp), %eax
	movl	$0, 4(%eax)
	movl	$1, -48(%ebp)
L73:
	subl	$1, -48(%ebp)
	movl	-104(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	cmpl	$0, -48(%ebp)
	jne	L73
	movb	$0, -22(%ebp)
L72:
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	-20(%ebp), %ebx
	movl	-16(%ebp), %ecx
	addl	%ebx, %ecx
	movzbl	(%ecx), %ecx
	movb	%cl, (%edx,%eax)
	jmp	L12
L68:
	movl	$1, -12(%ebp)
	jmp	L33
L22:
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L75
	cmpb	$0, -22(%ebp)
	je	L76
	movzbl	-22(%ebp), %eax
	subl	$1, %eax
	movb	%al, -22(%ebp)
	jmp	L12
L76:
	movl	-104(%ebp), %eax
	movl	%eax, -100(%ebp)
	movl	-100(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -104(%ebp)
	movl	-100(%ebp), %eax
	testl	%eax, %eax
	je	L78
	movl	-100(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
L78:
	movb	$0, -22(%ebp)
	jmp	L12
L75:
	movl	$3, -12(%ebp)
	jmp	L12
L23:
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L80
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	(%edx,%eax), %eax
	movb	%al, -19(%ebp)
	jmp	L12
L80:
	movl	$3, -12(%ebp)
	jmp	L12
L24:
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	jne	L82
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -104(%ebp)
	movl	-104(%ebp), %eax
	movl	$0, 4(%eax)
	movl	$1, -52(%ebp)
L83:
	subl	$1, -52(%ebp)
	movl	-104(%ebp), %edx
	movl	-52(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	cmpl	$0, -52(%ebp)
	jne	L83
	movb	$0, -22(%ebp)
	jmp	L84
L82:
	addb	$1, -22(%ebp)
	cmpb	$1, -22(%ebp)
	jne	L84
	movb	$0, -22(%ebp)
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -100(%ebp)
	movl	-100(%ebp), %eax
	movl	$0, 4(%eax)
	movl	$1, -56(%ebp)
L85:
	subl	$1, -56(%ebp)
	movl	-100(%ebp), %edx
	movl	-56(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	cmpl	$0, -56(%ebp)
	jne	L85
	movl	-100(%ebp), %eax
	movl	-104(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-100(%ebp), %eax
	movl	%eax, -104(%ebp)
L84:
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	-19(%ebp), %ecx
	movb	%cl, (%edx,%eax)
	jmp	L12
L25:
	cmpb	$15, -19(%ebp)
	ja	L86
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	jne	L87
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -104(%ebp)
	movl	-104(%ebp), %eax
	movl	$0, 4(%eax)
	movl	$1, -60(%ebp)
L88:
	subl	$1, -60(%ebp)
	movl	-104(%ebp), %edx
	movl	-60(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	cmpl	$0, -60(%ebp)
	jne	L88
	movb	$0, -22(%ebp)
	jmp	L89
L87:
	addb	$1, -22(%ebp)
	cmpb	$1, -22(%ebp)
	jne	L89
	movb	$0, -22(%ebp)
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -100(%ebp)
	movl	-100(%ebp), %eax
	movl	$0, 4(%eax)
	movl	$1, -64(%ebp)
L90:
	subl	$1, -64(%ebp)
	movl	-100(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	cmpl	$0, -64(%ebp)
	jne	L90
	movl	-100(%ebp), %eax
	movl	-104(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-100(%ebp), %eax
	movl	%eax, -104(%ebp)
L89:
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	-19(%ebp), %ecx
	movzbl	-94(%ebp,%ecx), %ecx
	movb	%cl, (%edx,%eax)
	jmp	L12
L86:
	movl	$5, -12(%ebp)
	jmp	L12
L26:
	cmpb	$15, -19(%ebp)
	jbe	L92
	movl	$5, -12(%ebp)
	jmp	L12
L92:
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L94
	movzbl	-19(%ebp), %eax
	movl	-104(%ebp), %ecx
	movzbl	-22(%ebp), %edx
	movzbl	(%ecx,%edx), %edx
	movb	%dl, -94(%ebp,%eax)
	jmp	L12
L94:
	movl	$3, -12(%ebp)
	jmp	L12
L27:
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L95
	cmpb	$0, -22(%ebp)
	je	L96
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	(%edx,%eax), %eax
	movb	%al, -21(%ebp)
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movl	-104(%ebp), %ecx
	movzbl	-22(%ebp), %ebx
	subl	$1, %ebx
	movzbl	(%ecx,%ebx), %ecx
	movb	%cl, (%edx,%eax)
	movl	-104(%ebp), %eax
	movzbl	-22(%ebp), %edx
	leal	-1(%edx), %ecx
	movzbl	-21(%ebp), %edx
	movb	%dl, (%eax,%ecx)
	jmp	L12
L96:
	movl	-104(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	je	L98
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	(%edx,%eax), %eax
	movb	%al, -21(%ebp)
	movb	$0, -22(%ebp)
	movl	-104(%ebp), %eax
	movl	-104(%ebp), %edx
	movl	4(%edx), %edx
	movl	%edx, -100(%ebp)
	movl	-100(%ebp), %ecx
	movzbl	-22(%ebp), %edx
	movzbl	(%ecx,%edx), %edx
	movb	%dl, (%eax)
	movl	-100(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	-21(%ebp), %ecx
	movb	%cl, (%edx,%eax)
	movb	$0, -22(%ebp)
	jmp	L12
L98:
	movl	$3, -12(%ebp)
	jmp	L12
L95:
	movl	$3, -12(%ebp)
	jmp	L12
L28:
	movl	-104(%ebp), %eax
	testl	%eax, %eax
	je	L100
	movzbl	-19(%ebp), %eax
	movb	%al, -21(%ebp)
	movzbl	-22(%ebp), %eax
	movb	%al, -23(%ebp)
	movl	-104(%ebp), %eax
	movl	%eax, -100(%ebp)
	cmpb	$0, -21(%ebp)
	je	L123
	cmpb	$0, -21(%ebp)
	je	L102
L106:
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	cmpb	$0, -23(%ebp)
	je	L103
	movzbl	-23(%ebp), %eax
	subl	$1, %eax
	movb	%al, -23(%ebp)
	jmp	L104
L103:
	movl	-100(%ebp), %eax
	testl	%eax, %eax
	je	L105
	movb	$0, -23(%ebp)
	movl	-100(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -100(%ebp)
	jmp	L104
L105:
	movl	$3, -12(%ebp)
	jmp	L102
L104:
	cmpb	$0, -21(%ebp)
	jne	L106
L102:
	cmpb	$0, -21(%ebp)
	jne	L123
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movzbl	(%edx,%eax), %eax
	movb	%al, -21(%ebp)
	movl	-104(%ebp), %edx
	movzbl	-22(%ebp), %eax
	movl	-100(%ebp), %ebx
	movzbl	-23(%ebp), %ecx
	movzbl	(%ebx,%ecx), %ecx
	movb	%cl, (%edx,%eax)
	movl	-100(%ebp), %edx
	movzbl	-23(%ebp), %eax
	movzbl	-21(%ebp), %ecx
	movb	%cl, (%edx,%eax)
	jmp	L123
L100:
	movl	$3, -12(%ebp)
	jmp	L123
L119:
	nop
	jmp	L12
L123:
	nop
L12:
	cmpl	$0, -12(%ebp)
	jne	L115
	movzbl	-18(%ebp), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	L108
	cmpb	$0, -20(%ebp)
	je	L109
	movzbl	-20(%ebp), %eax
	subl	$1, %eax
	movb	%al, -20(%ebp)
	jmp	L115
L109:
	movb	$63, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	movl	$4, -68(%ebp)
L111:
	subl	$1, -68(%ebp)
	leal	-76(%ebp), %edx
	movl	-68(%ebp), %eax
	addl	%edx, %eax
	leal	-76(%ebp), %ecx
	movl	-68(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %ebx
	leal	12(%ebp), %ecx
	movl	-68(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	xorl	%ebx, %edx
	movb	%dl, (%eax)
	cmpl	$0, -68(%ebp)
	jne	L111
	movl	8(%ebp), %eax
	movl	%eax, 12(%ebp)
	movl	-76(%ebp), %eax
	movl	%eax, 8(%ebp)
	cmpl	$0, 8(%ebp)
	je	L112
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L115
L112:
	movl	$1, -12(%ebp)
	jmp	L115
L108:
	addb	$1, -20(%ebp)
	cmpb	$64, -20(%ebp)
	jne	L115
	movb	$0, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	movl	$4, -72(%ebp)
L113:
	subl	$1, -72(%ebp)
	leal	-76(%ebp), %edx
	movl	-72(%ebp), %eax
	addl	%edx, %eax
	leal	-76(%ebp), %ecx
	movl	-72(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %ebx
	leal	12(%ebp), %ecx
	movl	-72(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	xorl	%ebx, %edx
	movb	%dl, (%eax)
	cmpl	$0, -72(%ebp)
	jne	L113
	movl	8(%ebp), %eax
	movl	%eax, 12(%ebp)
	movl	-76(%ebp), %eax
	movl	%eax, 8(%ebp)
	cmpl	$0, 8(%ebp)
	je	L114
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L115
L114:
	movl	$1, -12(%ebp)
	jmp	L115
L122:
	nop
L33:
	jmp	L115
L118:
	nop
	movl	-12(%ebp), %eax
	addl	$132, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "%d____\12\0"
LC2:
	.ascii "___________\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	call	___main
	movb	$38, 25(%esp)
	movb	$33, 26(%esp)
	movb	$38, 27(%esp)
	movb	$4, 28(%esp)
	movb	$38, 29(%esp)
	movb	$41, 30(%esp)
	movb	$38, 31(%esp)
	movb	$42, 32(%esp)
	movb	$39, 33(%esp)
	movb	$38, 34(%esp)
	movb	$1, 35(%esp)
	movb	$40, 36(%esp)
	movb	$41, 37(%esp)
	movb	$41, 38(%esp)
	movb	$39, 39(%esp)
	movb	$39, 40(%esp)
	movb	$39, 41(%esp)
	movb	$38, 42(%esp)
	movb	$5, 43(%esp)
	movb	$40, 44(%esp)
	movb	$39, 45(%esp)
	movb	$43, 46(%esp)
	movb	$39, 47(%esp)
	movb	$42, 48(%esp)
	movb	$42, 49(%esp)
	movb	$42, 50(%esp)
	movb	$38, 51(%esp)
	movb	$17, 52(%esp)
	movb	$44, 53(%esp)
	movb	$38, 54(%esp)
	movb	$4, 55(%esp)
	movb	$40, 56(%esp)
	movb	$39, 57(%esp)
	movb	$45, 58(%esp)
	movb	$32, 59(%esp)
	movl	$35, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, 60(%esp)
	movl	60(%esp), %eax
	leal	25(%esp), %edx
	movl	%edx, 4(%eax)
	movl	$LC2, (%esp)
	call	_puts
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	_pvm_execute
	movl	$LC2, (%esp)
	call	_puts
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
