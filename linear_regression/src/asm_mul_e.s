 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	asm_mul_e
 	.thumb_func

asm_mul_e:
@ write assembly language instructions here

	PUSH {R4 - R5} // R0, R1 and R2 are for the values of n, dataset.x and dataset.y respectively

LOOP:

//	Assign to R0 the product due to question requirements.

	LDR R4, [R1], #4 // Load the elements of x into R4 then increment the address using post-fix
	LDR R5, [R2], #4 // Load the elements of x into R5 then increment the address using post-fix

	MUL R4, R4, R5 // Standard multiplication process, where R4 = R4 * R5
	STR R4, [R1, #-4] // Store the value of R4 into the space corresponding to the address value of R1 using pre-fix notation due to prior post-fix addition. This subtraction is temporary.

	SUBS R0, R0, #1 // Subtract R0 by 1 to achieve every element contacted
	BNE LOOP

	POP {R4 - R5}
 	BX	LR

/*
		This is the equivalent of saying:
	------------------------------------------

		a = [...]									// dataset.x, where the address of the 1st element is in R1 and then loaded into R0
		b = [...]									// dataset.y, where the address of the 1st element is in R2 and then loaded into R4

		for i in range(0, len(a)):					// len(a) is stored in R3
			a[i] = a[i] * b[i]						// R0 will also store the product between a[i] and b[i] in order to be stored back into R1

		Above code is written using Python syntax as far as possible for intuitive understanding
*/
