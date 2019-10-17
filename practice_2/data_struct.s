	.file	1 "data_struct.c"
	.section .mdebug.abi32
	.previous
	.rdata
	.align	2
.LC0:
	.word	60
	.word	70
	.word	70
	.align	2
.LC1:
	.word	70
	.word	50
	.word	80
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
main:
	.frame	$fp,48,$31		# vars= 40, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-48
	sw	$fp,40($sp)
	move	$fp,$sp
	li	$2,536870912			# 0x20000000
	sw	$2,0($fp)
	li	$2,536870912			# 0x20000000
	ori	$2,$2,0x20
	sw	$2,4($fp)
	lui	$2,%hi(.LC0)
	lw	$4,%lo(.LC0)($2)
	addiu	$3,$2,%lo(.LC0)
	lw	$3,4($3)
	addiu	$2,$2,%lo(.LC0)
	lw	$2,8($2)
	sw	$4,8($fp)
	sw	$3,12($fp)
	sw	$2,16($fp)
	lui	$2,%hi(.LC1)
	lw	$4,%lo(.LC1)($2)
	addiu	$3,$2,%lo(.LC1)
	lw	$3,4($3)
	addiu	$2,$2,%lo(.LC1)
	lw	$2,8($2)
	sw	$4,24($fp)
	sw	$3,28($fp)
	sw	$2,32($fp)
	lw	$2,0($fp)
	lw	$3,8($fp)
	lw	$4,12($fp)
	lw	$5,16($fp)
	sw	$3,0($2)
	sw	$4,4($2)
	sw	$5,8($2)
	lw	$2,4($fp)
	lw	$3,24($fp)
	lw	$4,28($fp)
	lw	$5,32($fp)
	sw	$3,0($2)
	sw	$4,4($2)
	sw	$5,8($2)
	move	$sp,$fp
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.4.4 mipssde-6.06.01-20070420"
