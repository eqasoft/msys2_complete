	.file	"fileutils.c"
	.text
	.globl	gMS3FileParam
	.bss
	.align 32
gMS3FileParam:
	.space 560
	.text
	.globl	ms3_readmsr
	.def	ms3_readmsr;	.scl	2;	.type	32;	.endef
	.seh_proc	ms3_readmsr
ms3_readmsr:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	56(%rbp), %eax
	movb	%al, -20(%rbp)
	leaq	gMS3FileParam(%rip), %rax
	movq	%rax, -8(%rbp)
	movsbl	-20(%rbp), %edx
	movq	32(%rbp), %r8
	movq	24(%rbp), %rcx
	leaq	-8(%rbp), %rax
	movl	%edx, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	48(%rbp), %edx
	movl	%edx, 40(%rsp)
	movq	40(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	ms3_readmsr_selection
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	ms3_readmsr_r
	.def	ms3_readmsr_r;	.scl	2;	.type	32;	.endef
	.seh_proc	ms3_readmsr_r
ms3_readmsr_r:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	64(%rbp), %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %edx
	movq	40(%rbp), %r8
	movq	32(%rbp), %rcx
	movq	24(%rbp), %rax
	movl	%edx, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	56(%rbp), %edx
	movl	%edx, 40(%rsp)
	movq	48(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	ms3_readmsr_selection
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "%s(): Cannot shift buffer, shift: %d, readlength: %d, readoffset: %d\12\0"
	.text
	.def	ms3_shift_msfp;	.scl	3;	.type	32;	.endef
	.seh_proc	ms3_shift_msfp
ms3_shift_msfp:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L11
	cmpl	$0, 24(%rbp)
	jg	.L8
	movq	16(%rbp), %rax
	movl	528(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jle	.L8
	movq	16(%rbp), %rax
	movl	532(%rax), %edx
	movq	16(%rbp), %rax
	movl	528(%rax), %eax
	movl	24(%rbp), %ecx
	movl	%edx, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%ecx, %r9d
	leaq	__func__.86551(%rip), %r8
	leaq	.LC0(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	jmp	.L5
.L8:
	movq	16(%rbp), %rax
	movl	528(%rax), %eax
	subl	24(%rbp), %eax
	movslq	%eax, %rcx
	movq	16(%rbp), %rax
	movq	520(%rax), %rdx
	movl	24(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	520(%rax), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	memmove
	movq	16(%rbp), %rax
	movl	528(%rax), %eax
	subl	24(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	%edx, 528(%rax)
	movq	16(%rbp), %rax
	movl	532(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jge	.L9
	movq	16(%rbp), %rax
	movl	532(%rax), %eax
	subl	24(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	%edx, 532(%rax)
	jmp	.L5
.L9:
	movq	16(%rbp), %rax
	movq	536(%rax), %rdx
	movq	16(%rbp), %rax
	movl	532(%rax), %eax
	movl	24(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	cltq
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 536(%rax)
	movq	16(%rbp), %rax
	movl	$0, 532(%rax)
	jmp	.L5
.L11:
	nop
.L5:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "%s(): Cannot allocate memory for MSFP\12\0"
	.align 8
.LC2:
	.ascii "%s(): Cannot allocate memory for read buffer\12\0"
	.align 8
.LC3:
	.ascii "%s() called with a different file name without being reset\12\0"
.LC4:
	.ascii "-\0"
.LC5:
	.ascii "rb\0"
.LC6:
	.ascii "Cannot open file: %s (%s)\12\0"
.LC7:
	.ascii "Cannot seek in file: %s (%s)\12\0"
	.align 8
.LC8:
	.ascii "Short read of %d bytes starting from %I64d\12\0"
	.align 8
.LC9:
	.ascii "Skipping (selection) record for %s (%d bytes) starting at offset %I64d\12\0"
	.align 8
.LC10:
	.ascii "Cannot unpack data samples for record at byte offset %I64d: %s\12\0"
	.align 8
.LC11:
	.ascii "Read record length of %d bytes\12\0"
	.align 8
.LC12:
	.ascii "Skipped %d bytes of non-data record at byte offset %I64d\12\0"
	.align 8
.LC13:
	.ascii "Cannot detect record at byte offset %I64d: %s\12\0"
	.align 8
.LC14:
	.ascii "Truncated record at byte offset %I64d, filesize %I64d: %s\12\0"
	.align 8
.LC15:
	.ascii "Truncated record at byte offset %I64d\12\0"
	.align 8
.LC16:
	.ascii "%s: No data records read, not SEED?\12\0"
	.text
	.globl	ms3_readmsr_selection
	.def	ms3_readmsr_selection;	.scl	2;	.type	32;	.endef
	.seh_proc	ms3_readmsr_selection
ms3_readmsr_selection:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$152, %rsp
	.seh_stackalloc	152
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 48(%rbp)
	movq	%rdx, 56(%rbp)
	movq	%r8, 64(%rbp)
	movq	%r9, 72(%rbp)
	movl	104(%rbp), %eax
	movb	%al, -68(%rbp)
	movl	88(%rbp), %eax
	movl	%eax, 4(%rbp)
	movl	$0, 0(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -4(%rbp)
	cmpq	$0, 56(%rbp)
	jne	.L13
	movl	$-1, %eax
	jmp	.L14
.L13:
	cmpq	$0, 48(%rbp)
	jne	.L15
	movl	$-1, %eax
	jmp	.L14
.L15:
	movq	48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rbp)
	cmpq	$0, 8(%rbp)
	jne	.L16
	movq	.refptr.libmseed_memory(%rip), %rax
	movq	(%rax), %rax
	movl	$560, %ecx
	call	*%rax
	movq	%rax, 8(%rbp)
	cmpq	$0, 8(%rbp)
	jne	.L17
	leaq	__func__.86568(%rip), %r8
	leaq	.LC1(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movl	$-1, %eax
	jmp	.L14
.L17:
	movq	48(%rbp), %rax
	movq	8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbp), %rax
	movq	$0, (%rax)
	movq	8(%rbp), %rax
	movb	$0, 8(%rax)
	movq	8(%rbp), %rax
	movq	$0, 520(%rax)
	movq	8(%rbp), %rax
	movl	$0, 528(%rax)
	movq	8(%rbp), %rax
	movl	$0, 532(%rax)
	movq	8(%rbp), %rax
	movq	$0, 536(%rax)
	movq	8(%rbp), %rax
	movq	$0, 544(%rax)
	movq	8(%rbp), %rax
	movq	$0, 552(%rax)
.L16:
	cmpq	$0, 64(%rbp)
	jne	.L18
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	msr3_free
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L19
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
.L19:
	movq	8(%rbp), %rax
	movq	520(%rax), %rax
	testq	%rax, %rax
	je	.L20
	movq	.refptr.libmseed_memory(%rip), %rax
	movq	16(%rax), %rdx
	movq	8(%rbp), %rax
	movq	520(%rax), %rax
	movq	%rax, %rcx
	call	*%rdx
.L20:
	movq	48(%rbp), %rax
	movq	(%rax), %rax
	leaq	gMS3FileParam(%rip), %rdx
	cmpq	%rdx, %rax
	jne	.L21
	movq	$0, gMS3FileParam(%rip)
	movb	$0, 8+gMS3FileParam(%rip)
	movq	$0, 520+gMS3FileParam(%rip)
	movl	$0, 528+gMS3FileParam(%rip)
	movl	$0, 532+gMS3FileParam(%rip)
	movq	$0, 536+gMS3FileParam(%rip)
	movq	$0, 544+gMS3FileParam(%rip)
	movq	$0, 552+gMS3FileParam(%rip)
	jmp	.L22
.L21:
	movq	.refptr.libmseed_memory(%rip), %rax
	movq	16(%rax), %rdx
	movq	48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	*%rdx
	movq	48(%rbp), %rax
	movq	$0, (%rax)
.L22:
	movl	$0, %eax
	jmp	.L14
.L18:
	movq	8(%rbp), %rax
	movq	520(%rax), %rax
	testq	%rax, %rax
	jne	.L23
	movq	.refptr.libmseed_memory(%rip), %rax
	movq	(%rax), %rax
	movl	$131172, %ecx
	call	*%rax
	movq	8(%rbp), %rdx
	movq	%rax, 520(%rdx)
	movq	8(%rbp), %rax
	movq	520(%rax), %rax
	testq	%rax, %rax
	jne	.L23
	leaq	__func__.86568(%rip), %r8
	leaq	.LC2(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movl	$-1, %eax
	jmp	.L14
.L23:
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L24
	movq	8(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	64(%rbp), %rax
	movl	$512, %r8d
	movq	%rax, %rcx
	call	strncmp
	testl	%eax, %eax
	je	.L24
	leaq	__func__.86568(%rip), %r8
	leaq	.LC3(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L25
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
.L25:
	movq	8(%rbp), %rax
	movq	$0, (%rax)
	movq	8(%rbp), %rax
	movl	$0, 528(%rax)
	movq	8(%rbp), %rax
	movl	$0, 532(%rax)
	movq	8(%rbp), %rax
	movq	$0, 536(%rax)
	movq	8(%rbp), %rax
	movq	$0, 544(%rax)
	movq	8(%rbp), %rax
	movq	$0, 552(%rax)
.L24:
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L26
	movq	8(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	64(%rbp), %rax
	movl	$511, %r8d
	movq	%rax, %rdx
	call	strncpy
	movq	8(%rbp), %rax
	movb	$0, 519(%rax)
	movq	64(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L27
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	8(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L26
.L27:
	movq	64(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L28
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %eax
	movl	%eax, %ecx
	call	strerror
	movq	64(%rbp), %rdx
	movq	%rax, %r9
	movq	%rdx, %r8
	leaq	.LC6(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	msr3_free
	movl	$-1, %eax
	jmp	.L14
.L28:
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fileno
	movl	%eax, %ecx
	leaq	-64(%rbp), %rax
	movq	%rax, %rdx
	call	_fstat64i32
	testl	%eax, %eax
	je	.L29
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %eax
	movl	%eax, %ecx
	call	strerror
	movq	64(%rbp), %rdx
	movq	%rax, %r9
	movq	%rdx, %r8
	leaq	.LC6(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	msr3_free
	movl	$-1, %eax
	jmp	.L14
.L29:
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	8(%rbp), %rax
	movq	%rdx, 544(%rax)
.L26:
	cmpq	$0, 72(%rbp)
	je	.L30
	movq	72(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jns	.L30
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	cmpq	%rax, %rbx
	je	.L30
	movq	72(%rbp), %rax
	movq	(%rax), %rax
	negq	%rax
	movq	%rax, %rdx
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	lmp_fseek64
	testl	%eax, %eax
	je	.L31
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %eax
	movl	%eax, %ecx
	call	strerror
	movq	64(%rbp), %rdx
	movq	%rax, %r9
	movq	%rdx, %r8
	leaq	.LC7(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movl	$-1, %eax
	jmp	.L14
.L31:
	movq	72(%rbp), %rax
	movq	(%rax), %rax
	negq	%rax
	movq	%rax, %rdx
	movq	8(%rbp), %rax
	movq	%rdx, 536(%rax)
	movq	8(%rbp), %rax
	movl	$0, 528(%rax)
	movq	8(%rbp), %rax
	movl	$0, 532(%rax)
.L30:
	cmpq	$0, 80(%rbp)
	je	.L32
	movq	80(%rbp), %rax
	movb	$0, (%rax)
.L32:
	movl	88(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L60
	cmpq	$0, 96(%rbp)
	je	.L60
	andl	$-2, 4(%rbp)
.L60:
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	feof
	testl	%eax, %eax
	jne	.L34
	movq	8(%rbp), %rax
	movl	528(%rax), %edx
	movq	8(%rbp), %rax
	movl	532(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$39, %eax
	jle	.L35
	cmpl	$0, 0(%rbp)
	jle	.L34
.L35:
	movq	8(%rbp), %rax
	movl	528(%rax), %edx
	movq	8(%rbp), %rax
	movl	532(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	testl	%eax, %eax
	jg	.L36
	movq	8(%rbp), %rax
	movl	$0, 528(%rax)
	movq	8(%rbp), %rax
	movl	$0, 532(%rax)
	jmp	.L37
.L36:
	movq	8(%rbp), %rax
	movl	532(%rax), %eax
	testl	%eax, %eax
	jle	.L37
	movq	8(%rbp), %rax
	movl	532(%rax), %edx
	movq	8(%rbp), %rax
	movq	%rax, %rcx
	call	ms3_shift_msfp
.L37:
	movq	8(%rbp), %rax
	movl	528(%rax), %eax
	movl	$131172, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -8(%rbp)
	movq	8(%rbp), %rax
	movq	(%rax), %rcx
	movq	8(%rbp), %rax
	movq	520(%rax), %rdx
	movq	8(%rbp), %rax
	movl	528(%rax), %eax
	cltq
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movq	%rcx, %r9
	movl	%edx, %r8d
	movl	$1, %edx
	movq	%rax, %rcx
	call	ms_fread
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	je	.L38
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	feof
	testl	%eax, %eax
	jne	.L38
	movq	8(%rbp), %rax
	movq	536(%rax), %rdx
	movl	-8(%rbp), %eax
	movq	%rdx, %r9
	movl	%eax, %r8d
	leaq	.LC8(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movl	$-1, -4(%rbp)
	jmp	.L39
.L38:
	movq	8(%rbp), %rax
	movl	528(%rax), %edx
	movl	-12(%rbp), %eax
	addl	%eax, %edx
	movq	8(%rbp), %rax
	movl	%edx, 528(%rax)
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	cmpq	%rax, %rbx
	je	.L34
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	lmp_ftell64
	movq	8(%rbp), %rdx
	movl	528(%rdx), %edx
	movslq	%edx, %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	8(%rbp), %rax
	movq	%rdx, 536(%rax)
.L34:
	movq	8(%rbp), %rax
	movl	528(%rax), %edx
	movq	8(%rbp), %rax
	movl	532(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$39, %eax
	jle	.L40
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	feof
	testl	%eax, %eax
	je	.L41
	orl	$32, 4(%rbp)
.L41:
	movsbl	-68(%rbp), %edx
	movq	8(%rbp), %rax
	movl	528(%rax), %ecx
	movq	8(%rbp), %rax
	movl	532(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cltq
	movq	8(%rbp), %rcx
	movq	520(%rcx), %r8
	movq	8(%rbp), %rcx
	movl	532(%rcx), %ecx
	movslq	%ecx, %rcx
	addq	%r8, %rcx
	movl	4(%rbp), %r9d
	movq	56(%rbp), %r8
	movl	%edx, 32(%rsp)
	movq	%rax, %rdx
	call	msr3_parse
	movl	%eax, 0(%rbp)
	cmpl	$0, 0(%rbp)
	jne	.L42
	cmpq	$0, 96(%rbp)
	je	.L43
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movzbl	97(%rax), %eax
	movzbl	%al, %ebx
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	msr3_endtime
	movq	%rax, %rcx
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movq	80(%rax), %r8
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	leaq	13(%rax), %rdx
	movq	96(%rbp), %rax
	movq	$0, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movq	%rcx, %r9
	movq	%rax, %rcx
	call	ms3_matchselect
	testq	%rax, %rax
	jne	.L43
	cmpb	$1, -68(%rbp)
	jle	.L44
	movq	8(%rbp), %rax
	movq	536(%rax), %rax
	movq	56(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	8(%rdx), %ecx
	movq	56(%rbp), %rdx
	movq	(%rdx), %rdx
	addq	$13, %rdx
	movq	%rax, 32(%rsp)
	movl	%ecx, %r9d
	movq	%rdx, %r8
	leaq	.LC9(%rip), %rdx
	movl	$1, %ecx
	call	ms_log
.L44:
	movq	8(%rbp), %rax
	movl	532(%rax), %edx
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %eax
	addl	%eax, %edx
	movq	8(%rbp), %rax
	movl	%edx, 532(%rax)
	movq	8(%rbp), %rax
	movq	536(%rax), %rdx
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %eax
	cltq
	addq	%rax, %rdx
	movq	8(%rbp), %rax
	movq	%rdx, 536(%rax)
	jmp	.L40
.L43:
	movl	4(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L45
	movl	88(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L45
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movq	104(%rax), %rax
	testq	%rax, %rax
	jle	.L45
	movsbl	-68(%rbp), %edx
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	msr3_unpack_data
	movq	56(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	104(%rdx), %rdx
	cmpq	%rdx, %rax
	je	.L45
	movq	8(%rbp), %rax
	movq	536(%rax), %rax
	movq	64(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rax, %r8
	leaq	.LC10(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movl	$0, -4(%rbp)
	jmp	.L39
.L45:
	cmpb	$1, -68(%rbp)
	jle	.L46
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %eax
	movl	%eax, %r8d
	leaq	.LC11(%rip), %rdx
	movl	$1, %ecx
	call	ms_log
.L46:
	cmpq	$0, 80(%rbp)
	je	.L47
	movq	8(%rbp), %rax
	movq	544(%rax), %rax
	testq	%rax, %rax
	je	.L47
	movq	8(%rbp), %rax
	movq	544(%rax), %rdx
	movq	8(%rbp), %rax
	movq	536(%rax), %rcx
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %eax
	cltq
	addq	%rcx, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cmpq	$39, %rax
	jg	.L47
	movq	80(%rbp), %rax
	movb	$1, (%rax)
.L47:
	cmpq	$0, 72(%rbp)
	je	.L48
	movq	8(%rbp), %rax
	movq	536(%rax), %rdx
	movq	72(%rbp), %rax
	movq	%rdx, (%rax)
.L48:
	movq	8(%rbp), %rax
	movl	532(%rax), %edx
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %eax
	addl	%eax, %edx
	movq	8(%rbp), %rax
	movl	%edx, 532(%rax)
	movq	8(%rbp), %rax
	movq	536(%rax), %rdx
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %eax
	cltq
	addq	%rax, %rdx
	movq	8(%rbp), %rax
	movq	%rdx, 536(%rax)
	movq	8(%rbp), %rax
	movq	552(%rax), %rax
	leaq	1(%rax), %rdx
	movq	8(%rbp), %rax
	movq	%rdx, 552(%rax)
	movl	$0, -4(%rbp)
	jmp	.L39
.L42:
	cmpl	$0, 0(%rbp)
	jns	.L49
	movl	88(%rbp), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L50
	cmpb	$1, -68(%rbp)
	jle	.L51
	movq	8(%rbp), %rax
	movq	536(%rax), %rax
	movq	%rax, %r9
	movl	$1, %r8d
	leaq	.LC12(%rip), %rdx
	movl	$1, %ecx
	call	ms_log
.L51:
	movq	8(%rbp), %rax
	movl	532(%rax), %eax
	leal	1(%rax), %edx
	movq	8(%rbp), %rax
	movl	%edx, 532(%rax)
	movq	8(%rbp), %rax
	movq	536(%rax), %rax
	leaq	1(%rax), %rdx
	movq	8(%rbp), %rax
	movq	%rdx, 536(%rax)
	jmp	.L40
.L50:
	movq	8(%rbp), %rax
	movq	536(%rax), %rax
	movq	64(%rbp), %rdx
	movq	%rdx, %r9
	movq	%rax, %r8
	leaq	.LC13(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movl	0(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L39
.L49:
	movq	8(%rbp), %rax
	movl	528(%rax), %edx
	movq	8(%rbp), %rax
	movl	532(%rax), %eax
	subl	%eax, %edx
	movl	0(%rbp), %eax
	addl	%edx, %eax
	cmpl	$131172, %eax
	jle	.L52
	movl	88(%rbp), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L53
	movq	8(%rbp), %rax
	movl	532(%rax), %eax
	leal	1(%rax), %edx
	movq	8(%rbp), %rax
	movl	%edx, 532(%rax)
	movq	8(%rbp), %rax
	movq	536(%rax), %rax
	leaq	1(%rax), %rdx
	movq	8(%rbp), %rax
	movq	%rdx, 536(%rax)
	jmp	.L40
.L53:
	movl	$-4, -4(%rbp)
	jmp	.L39
.L52:
	movq	8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	feof
	testl	%eax, %eax
	je	.L40
	cmpb	$0, -68(%rbp)
	je	.L54
	movq	8(%rbp), %rax
	movq	544(%rax), %rax
	testq	%rax, %rax
	je	.L55
	movq	8(%rbp), %rax
	movq	544(%rax), %rcx
	movq	8(%rbp), %rax
	movq	536(%rax), %rdx
	movq	64(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC14(%rip), %rdx
	movl	$1, %ecx
	call	ms_log
	jmp	.L54
.L55:
	movq	8(%rbp), %rax
	movq	536(%rax), %rax
	movq	%rax, %r8
	leaq	.LC15(%rip), %rdx
	movl	$1, %ecx
	call	ms_log
.L54:
	movl	$1, -4(%rbp)
	jmp	.L39
.L40:
	movq	8(%rbp), %rax
	movq	544(%rax), %rdx
	movq	8(%rbp), %rax
	movq	536(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cmpq	$39, %rax
	jg	.L60
	movq	8(%rbp), %rax
	movl	528(%rax), %edx
	movq	8(%rbp), %rax
	movl	532(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$39, %eax
	jg	.L60
	movq	8(%rbp), %rax
	movq	552(%rax), %rax
	testq	%rax, %rax
	jne	.L57
	cmpb	$0, -68(%rbp)
	jle	.L58
	movq	64(%rbp), %rax
	movq	%rax, %r8
	leaq	.LC16(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
.L58:
	movl	$-2, -4(%rbp)
	jmp	.L39
.L57:
	movl	$1, -4(%rbp)
.L39:
	cmpl	$0, -4(%rbp)
	je	.L61
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	msr3_free
.L61:
	movl	-4(%rbp), %eax
.L14:
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	ms3_readtracelist
	.def	ms3_readtracelist;	.scl	2;	.type	32;	.endef
	.seh_proc	ms3_readtracelist
ms3_readtracelist:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	%r9d, %edx
	movl	56(%rbp), %eax
	movb	%dl, 40(%rbp)
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %ecx
	movsbl	40(%rbp), %edx
	movq	32(%rbp), %r8
	movq	24(%rbp), %rax
	movl	%ecx, 48(%rsp)
	movl	48(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	ms3_readtracelist_selection
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	ms3_readtracelist_timewin
	.def	ms3_readtracelist_timewin;	.scl	2;	.type	32;	.endef
	.seh_proc	ms3_readtracelist_timewin
ms3_readtracelist_timewin:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$240, %rsp
	.seh_stackalloc	240
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	56(%rbp), %edx
	movl	72(%rbp), %eax
	movb	%dl, -164(%rbp)
	movb	%al, -168(%rbp)
	movb	$42, -128(%rbp)
	movb	$0, -127(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	40(%rbp), %rax
	movq	%rax, -160(%rbp)
	movq	48(%rbp), %rax
	movq	%rax, -152(%rbp)
	movq	$0, -144(%rbp)
	movsbl	-168(%rbp), %ecx
	movsbl	-164(%rbp), %edx
	leaq	-128(%rbp), %r9
	movq	32(%rbp), %r8
	movq	24(%rbp), %rax
	movl	%ecx, 48(%rsp)
	movl	64(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	%edx, 32(%rsp)
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	ms3_readtracelist_selection
	addq	$240, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "%s(%s) Cannot add record to trace list\12\0"
	.text
	.globl	ms3_readtracelist_selection
	.def	ms3_readtracelist_selection;	.scl	2;	.type	32;	.endef
	.seh_proc	ms3_readtracelist_selection
ms3_readtracelist_selection:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$144, %rsp
	.seh_stackalloc	144
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	48(%rbp), %edx
	movl	64(%rbp), %eax
	movb	%dl, -68(%rbp)
	movb	%al, -72(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -40(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L67
	movl	$-1, %eax
	jmp	.L78
.L67:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L70
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	mstl3_init
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L70
	movl	$-1, %eax
	jmp	.L78
.L76:
	movsbl	-68(%rbp), %r9d
	movl	56(%rbp), %eax
	andl	$64, %eax
	testl	%eax, %eax
	je	.L71
	leaq	-40(%rbp), %r8
	jmp	.L72
.L71:
	movl	$0, %r8d
.L72:
	movq	-24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rbp), %rcx
	movq	%rcx, 48(%rsp)
	movl	56(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	$1, 32(%rsp)
	movq	%rax, %rcx
	call	mstl3_addmsr_recordptr
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L73
	movq	-24(%rbp), %rax
	addq	$13, %rax
	movq	%rax, %r9
	leaq	__func__.86609(%rip), %r8
	leaq	.LC17(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	movl	$-1, -4(%rbp)
	jmp	.L74
.L73:
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	je	.L70
	movq	-24(%rbp), %rax
	leaq	-48(%rbp), %rcx
	leaq	-44(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	msr3_data_bounds
	testl	%eax, %eax
	je	.L75
	movl	$-1, -4(%rbp)
	jmp	.L74
.L75:
	movq	-40(%rbp), %rax
	movq	$0, (%rax)
	movq	-40(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-40(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-40(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-40(%rbp), %rax
	movl	-44(%rbp), %edx
	movl	%edx, 48(%rax)
	movq	-40(%rbp), %rax
	movq	$0, 56(%rax)
.L70:
	movsbl	-72(%rbp), %ecx
	leaq	-56(%rbp), %r9
	movq	24(%rbp), %r8
	leaq	-24(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movl	%ecx, 56(%rsp)
	movq	40(%rbp), %rcx
	movq	%rcx, 48(%rsp)
	movl	56(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	%rax, %rcx
	call	ms3_readmsr_selection
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L76
.L74:
	cmpl	$1, -4(%rbp)
	jne	.L77
	movl	$0, -4(%rbp)
.L77:
	leaq	-24(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movl	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	ms3_readmsr_selection
	movl	-4(%rbp), %eax
.L78:
	addq	$144, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC18:
	.ascii "%s(): Cannot read input file\12\0"
	.align 8
.LC19:
	.ascii "%s(): Unknown return from fread()\12\0"
	.text
	.def	ms_fread;	.scl	3;	.type	32;	.endef
	.seh_proc	ms_fread
ms_fread:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$0, -4(%rbp)
	movl	32(%rbp), %eax
	movslq	%eax, %rdx
	movl	24(%rbp), %eax
	cltq
	movq	40(%rbp), %rcx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	fread
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jg	.L80
	cmpl	$0, 24(%rbp)
	je	.L80
	cmpl	$0, 32(%rbp)
	je	.L80
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	ferror
	testl	%eax, %eax
	je	.L81
	leaq	__func__.86620(%rip), %r8
	leaq	.LC18(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
	jmp	.L80
.L81:
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	feof
	testl	%eax, %eax
	jne	.L80
	leaq	__func__.86620(%rip), %r8
	leaq	.LC19(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
.L80:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC20:
	.ascii "Error writing to output file\12\0"
	.text
	.def	ms_record_handler_int;	.scl	3;	.type	32;	.endef
	.seh_proc	ms_record_handler_int
ms_record_handler_int:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	24(%rbp), %eax
	cltq
	movq	32(%rbp), %rdx
	movq	%rdx, %r9
	movl	$1, %r8d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	fwrite
	cmpq	$1, %rax
	je	.L85
	leaq	.LC20(%rip), %rdx
	movl	$2, %ecx
	call	ms_log
.L85:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC21:
	.ascii "wb\0"
.LC22:
	.ascii "ab\0"
	.align 8
.LC23:
	.ascii "Cannot open output file %s: %s\12\0"
.LC24:
	.ascii "Cannot write miniSEED for %s\12\0"
	.text
	.globl	msr3_writemseed
	.def	msr3_writemseed;	.scl	2;	.type	32;	.endef
	.seh_proc	msr3_writemseed
msr3_writemseed:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, %edx
	movl	%r9d, 40(%rbp)
	movl	48(%rbp), %eax
	movb	%dl, 32(%rbp)
	movb	%al, -36(%rbp)
	cmpb	$0, 32(%rbp)
	je	.L87
	leaq	.LC21(%rip), %rax
	jmp	.L88
.L87:
	leaq	.LC22(%rip), %rax
.L88:
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L89
	cmpq	$0, 24(%rbp)
	jne	.L90
.L89:
	movq	$-1, %rax
	jmp	.L91
.L90:
	movq	24(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L92
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, -8(%rbp)
	jmp	.L93
.L92:
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L93
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %eax
	movl	%eax, %ecx
	call	strerror
	movq	24(%rbp), %rdx
	movq	%rax, %r9
	movq	%rdx, %r8
	leaq	.LC23(%rip), %rdx
	movl	$1, %ecx
	call	ms_log
	movq	$-1, %rax
	jmp	.L91
.L93:
	movzbl	-36(%rbp), %eax
	subl	$1, %eax
	movsbl	%al, %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 40(%rsp)
	movl	40(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	$0, %r9d
	movq	%rdx, %r8
	leaq	ms_record_handler_int(%rip), %rdx
	movq	16(%rbp), %rcx
	call	msr3_pack
	cltq
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jns	.L94
	movq	16(%rbp), %rax
	addq	$13, %rax
	movq	%rax, %r8
	leaq	.LC24(%rip), %rdx
	movl	$1, %ecx
	call	ms_log
.L94:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	$-1, %rax
	cmpq	$0, -24(%rbp)
	cmovns	-24(%rbp), %rax
.L91:
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC25:
	.ascii "Cannot write miniSEED for trace list\12\0"
	.text
	.globl	mstl3_writemseed
	.def	mstl3_writemseed;	.scl	2;	.type	32;	.endef
	.seh_proc	mstl3_writemseed
mstl3_writemseed:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	addq	$-128, %rsp
	.seh_stackalloc	128
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, %ecx
	movl	%r9d, 40(%rbp)
	movl	48(%rbp), %edx
	movl	64(%rbp), %eax
	movb	%cl, 32(%rbp)
	movb	%dl, -36(%rbp)
	movb	%al, -40(%rbp)
	cmpb	$0, 32(%rbp)
	je	.L96
	leaq	.LC21(%rip), %rax
	jmp	.L97
.L96:
	leaq	.LC22(%rip), %rax
.L97:
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L98
	cmpq	$0, 24(%rbp)
	jne	.L99
.L98:
	movq	$-1, %rax
	jmp	.L100
.L99:
	movq	24(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L101
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, -8(%rbp)
	jmp	.L102
.L101:
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L102
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %eax
	movl	%eax, %ecx
	call	strerror
	movq	24(%rbp), %rdx
	movq	%rax, %r9
	movq	%rdx, %r8
	leaq	.LC23(%rip), %rdx
	movl	$1, %ecx
	call	ms_log
	movq	$-1, %rax
	jmp	.L100
.L102:
	orl	$128, 56(%rbp)
	orl	$16, 56(%rbp)
	movsbl	-40(%rbp), %edx
	movsbl	-36(%rbp), %eax
	movl	40(%rbp), %r8d
	movq	-8(%rbp), %rcx
	movq	$0, 64(%rsp)
	movl	%edx, 56(%rsp)
	movl	56(%rbp), %edx
	movl	%edx, 48(%rsp)
	movq	$0, 40(%rsp)
	movl	%eax, 32(%rsp)
	movl	%r8d, %r9d
	movq	%rcx, %r8
	leaq	ms_record_handler_int(%rip), %rdx
	movq	16(%rbp), %rcx
	call	mstl3_pack
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jns	.L103
	leaq	.LC25(%rip), %rdx
	movl	$1, %ecx
	call	ms_log
.L103:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	$-1, %rax
	cmpq	$0, -24(%rbp)
	cmovns	-24(%rbp), %rax
.L100:
	subq	$-128, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
__func__.86551:
	.ascii "ms3_shift_msfp\0"
	.align 16
__func__.86568:
	.ascii "ms3_readmsr_selection\0"
	.align 16
__func__.86609:
	.ascii "ms3_readtracelist_selection\0"
	.align 8
__func__.86620:
	.ascii "ms_fread\0"
	.ident	"GCC: (Rev1, Built by MSYS2 project) 9.3.0"
	.def	ms_log;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	msr3_free;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	strerror;	.scl	2;	.type	32;	.endef
	.def	fileno;	.scl	2;	.type	32;	.endef
	.def	_fstat64i32;	.scl	2;	.type	32;	.endef
	.def	lmp_fseek64;	.scl	2;	.type	32;	.endef
	.def	feof;	.scl	2;	.type	32;	.endef
	.def	lmp_ftell64;	.scl	2;	.type	32;	.endef
	.def	msr3_parse;	.scl	2;	.type	32;	.endef
	.def	msr3_endtime;	.scl	2;	.type	32;	.endef
	.def	ms3_matchselect;	.scl	2;	.type	32;	.endef
	.def	msr3_unpack_data;	.scl	2;	.type	32;	.endef
	.def	mstl3_init;	.scl	2;	.type	32;	.endef
	.def	mstl3_addmsr_recordptr;	.scl	2;	.type	32;	.endef
	.def	msr3_data_bounds;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	ferror;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	msr3_pack;	.scl	2;	.type	32;	.endef
	.def	mstl3_pack;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.libmseed_memory, "dr"
	.globl	.refptr.libmseed_memory
	.linkonce	discard
.refptr.libmseed_memory:
	.quad	libmseed_memory
