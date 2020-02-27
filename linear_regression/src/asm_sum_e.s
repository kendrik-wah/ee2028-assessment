 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	asm_sum_e
 	.thumb_func

asm_sum_e:
@ write assembly language instructions here

	PUSH {R4 - R5} // R0 and R1 are for n and the array respectively.

	MOV R4, R0 // Storing the number of elements as a counter based on input
	MOV R0, #0 // Re-initialize the value of R0 per question requirements to return R0.

LOOP:
	LDR R5, [R1], #4 // Load the value of R1 into R4 and then incrementing the address of R1 by 4.
	ADD R0, R0, R5 // Add the value of R5 into the current value of R0
	SUBS R4, R4, #1 // Subtract by 1
	BNE LOOP // Continue running loop as long as R4 > 0

	POP {R4 - R5}
 	BX	LR

/*
		This is the equivalent of saying:
	------------------------------------------

		total = 0									// This is R0
		count = len(array)							// This is R4

		while (count > 0):							// This is the LOOP
			total = total + arr[count-1]			// This is ADD R0, R0, R5
			count = count - 1						// This is SUBS R3, R3, #1. Do note that SUBS accounts for breaking the loop through conditional flag.

		Above code is written using Python syntax as far as possible for intuitive understanding
*/
