	.text
	.file	"sqrt3.ll"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function iterate
.LCPI0_0:
	.quad	0x4000000000000000              # double 2
	.text
	.globl	iterate
	.p2align	4, 0x90
	.type	iterate,@function
iterate:                                # @iterate
	.cfi_startproc
# %bb.0:                                # %entry
	movsd	%xmm0, -32(%rsp)
	movsd	%xmm1, -40(%rsp)
	movabsq	$4547007122018943789, %rax      # imm = 0x3F1A36E2EB1C432D
	movq	%rax, -16(%rsp)
	mulsd	%xmm1, %xmm1
	movsd	%xmm1, -24(%rsp)
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	.p2align	4, 0x90
.LBB0_1:                                # %cond
                                        # =>This Inner Loop Header: Depth=1
	movsd	-32(%rsp), %xmm1                # xmm1 = mem[0],zero
	movsd	-24(%rsp), %xmm2                # xmm2 = mem[0],zero
	movapd	%xmm1, %xmm3
	subsd	%xmm2, %xmm3
	subsd	%xmm1, %xmm2
	movsd	-16(%rsp), %xmm1                # xmm1 = mem[0],zero
	movapd	%xmm1, %xmm4
	cmpnlepd	%xmm3, %xmm4
	cmpnlepd	%xmm2, %xmm1
	andpd	%xmm4, %xmm1
	movd	%xmm1, %eax
	testb	$1, %al
	jne	.LBB0_3
# %bb.2:                                # %loop
                                        #   in Loop: Header=BB0_1 Depth=1
	movsd	-40(%rsp), %xmm1                # xmm1 = mem[0],zero
	movsd	-32(%rsp), %xmm2                # xmm2 = mem[0],zero
	divsd	%xmm1, %xmm2
	addsd	%xmm1, %xmm2
	mulsd	%xmm1, %xmm1
	movsd	%xmm1, -24(%rsp)
	divsd	%xmm0, %xmm2
	movsd	%xmm2, -40(%rsp)
	jmp	.LBB0_1
.LBB0_3:                                # %merge
	movsd	-40(%rsp), %xmm0                # xmm0 = mem[0],zero
	retq
.Lfunc_end0:
	.size	iterate, .Lfunc_end0-iterate
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function sqrt
.LCPI1_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI1_1:
	.quad	0x4000000000000000              # double 2
	.text
	.globl	sqrt
	.p2align	4, 0x90
	.type	sqrt,@function
sqrt:                                   # @sqrt
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movapd	%xmm0, %xmm1
	movsd	%xmm0, (%rsp)
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	je	.LBB1_5
# %bb.1:                                # %falseexp
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	ucomisd	.LCPI1_0(%rip), %xmm0
	jae	.LBB1_3
# %bb.2:                                # %trueexp4
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	jmp	.LBB1_4
.LBB1_3:                                # %falseexp7
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm1
	divsd	.LCPI1_1(%rip), %xmm1
.LBB1_4:                                # %endcond11
	callq	iterate@PLT
.LBB1_5:                                # %endcond11
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	sqrt, .Lfunc_end1-sqrt
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
