	.globl lab04b
lab04b:
//X0 holds x!
	SUB SP, SP, 16 //make space on stack for reg
	STUR X30, [SP,0] // put the link return register on the stack so it safe
	///////////////////////////////////////////////////////////////////////
	ADD X2, X0, XZR //puts val into X2 because X0 and X1 used to pass info into my_mul
	MOVZ X3, #1 //puts 1 in final val
loop:
	SUB X4, X2, #1 //X4 will be 0 when X2 is 1
	CBZ X4, end
	ADD X0, X3, XZR //puts current product in X0
	ADD X1, X2, XZR //puts index in X1
	BL my_mul //multiplies X0 and X1 and stores in X0
	ADD X3, X0, XZR//stores product in X3
	SUB X2, X2, #1
	B loop
	///////////////////////////////////////////////////////////////////////
end:
	//now re load x30 and br x30
	LDUR X30, [SP,0]
	ADD SP, SP, 16 //remove space made on stack at begin

	BR X30 //go back to main
