	.file	1 "unknow_alg.c"
	.section .mdebug.abi32
	.previous
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
main:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	li	$8,536870912			# 0x20000000
	li	$9,5			# 0x5
	li	$2,10			# 0xa
	sw	$2,0($8)
	li	$2,92			# 0x5c
	sw	$2,4($8)
	li	$2,55			# 0x37
	sw	$2,8($8)
	li	$2,1			# 0x1
	sw	$2,12($8)
	li	$2,46			# 0x2e
	sw	$2,16($8)
	move	$7,$0
	addiu	$10,$9,-1
.L10:
	subu	$2,$9,$7
	addiu	$2,$2,-1
	blez	$2,.L14
	move	$5,$0

	subu	$2,$9,$7
	addiu	$6,$2,-1
	sll	$2,$5,2
.L15:
	addu	$4,$2,$8
	lw	$2,4($4)
	lw	$3,0($4)
	slt	$2,$2,$3
	beq	$2,$0,.L7
	nop

	lw	$3,0($4)
	lw	$2,4($4)
	sw	$2,0($4)
	sw	$3,4($4)
.L7:
	addiu	$5,$5,1
	slt	$2,$5,$6
	bne	$2,$0,.L15
	sll	$2,$5,2

.L14:
	addiu	$7,$7,1
	slt	$2,$7,$10
	bne	$2,$0,.L10
	move	$2,$0

	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4 mipssde-6.06.01-20070420"
