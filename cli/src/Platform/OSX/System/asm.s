
.globl _setmcontext
_setmcontext:
#if defined(__X86_64__)
	movq	16(%rdi), %rsi
	movq	24(%rdi), %rdx
	movq	32(%rdi), %rcx
	movq	40(%rdi), %r8
	movq	48(%rdi), %r9
	movq	56(%rdi), %rax
	movq	64(%rdi), %rbx
	movq	72(%rdi), %rbp
	movq	80(%rdi), %r10
	movq	88(%rdi), %r11
	movq	96(%rdi), %r12
	movq	104(%rdi), %r13
	movq	112(%rdi), %r14
	movq	120(%rdi), %r15
	movq	184(%rdi), %rsp
	pushq	160(%rdi)	/* new %eip */
	movq	8(%rdi), %rdi
	ret
#elif defined(__aarch64__)
	ldp	x0 , x1 ,  [sp], #16
	ldp	x2 , x3 ,  [sp], #16
	ldp	x4 , x5 ,  [sp], #16
	ldp	x6 , x7 ,  [sp], #16
	ldp	x8 , x9 ,  [sp], #16
	ldp	x10, x11,  [sp], #16
	ldp	x12, x13,  [sp], #16
	ldp	x14, x15,  [sp], #16
	ldp	x16, x17,  [sp], #16
	ldp	x18, x19,  [sp], #16
	ldp	x20, x21,  [sp], #16
	ldp	x22, x23,  [sp], #16
	ldp	x24, x25,  [sp], #16
	ldp	x26, x27,  [sp], #16
	ldp	x28, x29,  [sp], #16
	ldr 	x30,       [sp], #16
#endif

.globl _getmcontext
_getmcontext:
#if defined(__X86_64__)
	movq	%rdi, 8(%rdi)
	movq	%rsi, 16(%rdi)
	movq	%rdx, 24(%rdi)
	movq	%rcx, 32(%rdi)
	movq	%r8, 40(%rdi)
	movq	%r9, 48(%rdi)
	movq	$1, 56(%rdi)	/* %rax */
	movq	%rbx, 64(%rdi)
	movq	%rbp, 72(%rdi)
	movq	%r10, 80(%rdi)
	movq	%r11, 88(%rdi)
	movq	%r12, 96(%rdi)
	movq	%r13, 104(%rdi)
	movq	%r14, 112(%rdi)
	movq	%r15, 120(%rdi)

	movq	(%rsp), %rcx	/* %rip */
	movq	%rcx, 160(%rdi)
	leaq	8(%rsp), %rcx	/* %rsp */
	movq	%rcx, 184(%rdi)
	
	movq	32(%rdi), %rcx	/* restore %rcx */
	movq	$0, %rax
	ret
#elif defined(__aarch64__)
	str	x30,      [sp, #-16]!
	stp	x28, x29, [sp, #-16]!
	stp	x26, x27, [sp, #-16]!
	stp	x24, x25, [sp, #-16]!
	stp	x22, x23, [sp, #-16]!
	stp	x20, x21, [sp, #-16]!
	stp	x18, x19, [sp, #-16]!
	stp	x16, x17, [sp, #-16]!
	stp	x14, x15, [sp, #-16]!
	stp	x12, x13, [sp, #-16]!
	stp	x10, x11, [sp, #-16]!
	stp	x8 , x9 , [sp, #-16]!
	stp	x6 , x7 , [sp, #-16]!
	stp	x4 , x5 , [sp, #-16]!
	stp	x2 , x3 , [sp, #-16]!
	stp	x0 , x1 , [sp, #-16]!
#endif
