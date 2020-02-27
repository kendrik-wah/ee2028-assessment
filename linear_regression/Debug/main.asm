   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.global	__aeabi_i2d
  19              		.global	__aeabi_ddiv
  20              		.global	__aeabi_dmul
  21              		.global	__aeabi_dsub
  22              		.global	__aeabi_dadd
  23              		.section	.rodata
  24              		.align	2
  25              	.LC0:
  26 0000 62303A20 		.ascii	"b0: %lf\012\000"
  26      256C660A 
  26      00
  27 0009 000000   		.align	2
  28              	.LC1:
  29 000c 62313A20 		.ascii	"b1: %lf\012\000"
  29      256C660A 
  29      00
  30 0015 000000   		.align	2
  31              	.LC2:
  32 0018 5353453A 		.ascii	"SSE: %lf\012\000"
  32      20256C66 
  32      0A00
  33 0022 0000     		.section	.text.main,"ax",%progbits
  34              		.align	2
  35              		.global	main
  36              		.thumb
  37              		.thumb_func
  39              	main:
  40              	.LFB0:
  41              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** 
   3:../src/main.c **** #define N 25 // maximum of 25 elements in vector
   4:../src/main.c **** 
   5:../src/main.c **** extern int asm_sum_e(int n,int* v); // sum elements, returns result
   6:../src/main.c **** extern void asm_mul_e(int n,int* v1,int* v2); // multiply element by element, returns results in v1
   7:../src/main.c **** 
   8:../src/main.c **** // struct for data values
   9:../src/main.c **** struct data
  10:../src/main.c **** {
  11:../src/main.c **** 	int n;
  12:../src/main.c **** 	int scale;
  13:../src/main.c **** 	int x[N];
  14:../src/main.c **** 	int y[N];
  15:../src/main.c **** };
  16:../src/main.c **** 
  17:../src/main.c **** int main(void)
  18:../src/main.c **** {
  42              		.loc 1 18 0
  43              		.cfi_startproc
  44              		@ args = 0, pretend = 0, frame = 464
  45              		@ frame_needed = 1, uses_anonymous_args = 0
  46 0000 2DE9B043 		push	{r4, r5, r7, r8, r9, lr}
  47              	.LCFI0:
  48              		.cfi_def_cfa_offset 24
  49              		.cfi_offset 14, -4
  50              		.cfi_offset 9, -8
  51              		.cfi_offset 8, -12
  52              		.cfi_offset 7, -16
  53              		.cfi_offset 5, -20
  54              		.cfi_offset 4, -24
  55 0004 F4B0     		sub	sp, sp, #464
  56              	.LCFI1:
  57              		.cfi_def_cfa_offset 488
  58 0006 00AF     		add	r7, sp, #0
  59              	.LCFI2:
  60              		.cfi_def_cfa_register 7
  19:../src/main.c **** 	int i;
  20:../src/main.c **** 
  21:../src/main.c **** 	struct data dataset = {20,1000,{3500,2500,1250,-500,-1000,-1500,-1250,0,2250,4000,2750,750,-1750,-
  61              		.loc 1 21 0
  62 0008 07F1C803 		add	r3, r7, #200
  63 000c 1A46     		mov	r2, r3
  64 000e 4FF0D003 		mov	r3, #208
  65 0012 1046     		mov	r0, r2
  66 0014 4FF00001 		mov	r1, #0
  67 0018 1A46     		mov	r2, r3
  68 001a FFF7FEFF 		bl	memset
  69 001e 07F1C803 		add	r3, r7, #200
  70 0022 4FF01402 		mov	r2, #20
  71 0026 1A60     		str	r2, [r3, #0]
  72 0028 07F1C803 		add	r3, r7, #200
  73 002c 4FF47A72 		mov	r2, #1000
  74 0030 5A60     		str	r2, [r3, #4]
  75 0032 07F1C803 		add	r3, r7, #200
  76 0036 40F6AC52 		movw	r2, #3500
  77 003a 9A60     		str	r2, [r3, #8]
  78 003c 07F1C803 		add	r3, r7, #200
  79 0040 40F6C412 		movw	r2, #2500
  80 0044 DA60     		str	r2, [r3, #12]
  81 0046 07F1C803 		add	r3, r7, #200
  82 004a 40F2E242 		movw	r2, #1250
  83 004e 1A61     		str	r2, [r3, #16]
  84 0050 07F1C802 		add	r2, r7, #200
  85 0054 4FF60C63 		movw	r3, #65036
  86 0058 CFF6FF73 		movt	r3, 65535
  87 005c 5361     		str	r3, [r2, #20]
  88 005e 07F1C802 		add	r2, r7, #200
  89 0062 4FF61843 		movw	r3, #64536
  90 0066 CFF6FF73 		movt	r3, 65535
  91 006a 9361     		str	r3, [r2, #24]
  92 006c 07F1C802 		add	r2, r7, #200
  93 0070 4FF62423 		movw	r3, #64036
  94 0074 CFF6FF73 		movt	r3, 65535
  95 0078 D361     		str	r3, [r2, #28]
  96 007a 07F1C802 		add	r2, r7, #200
  97 007e 4FF61E33 		movw	r3, #64286
  98 0082 CFF6FF73 		movt	r3, 65535
  99 0086 1362     		str	r3, [r2, #32]
 100 0088 07F1C803 		add	r3, r7, #200
 101 008c 40F6CA02 		movw	r2, #2250
 102 0090 9A62     		str	r2, [r3, #40]
 103 0092 07F1C803 		add	r3, r7, #200
 104 0096 4FF47A62 		mov	r2, #4000
 105 009a DA62     		str	r2, [r3, #44]
 106 009c 07F1C803 		add	r3, r7, #200
 107 00a0 40F6BE22 		movw	r2, #2750
 108 00a4 1A63     		str	r2, [r3, #48]
 109 00a6 07F1C803 		add	r3, r7, #200
 110 00aa 40F2EE22 		movw	r2, #750
 111 00ae 5A63     		str	r2, [r3, #52]
 112 00b0 07F1C802 		add	r2, r7, #200
 113 00b4 4FF62A13 		movw	r3, #63786
 114 00b8 CFF6FF73 		movt	r3, 65535
 115 00bc 9363     		str	r3, [r2, #56]
 116 00be 07F1C802 		add	r2, r7, #200
 117 00c2 4FF63003 		movw	r3, #63536
 118 00c6 CFF6FF73 		movt	r3, 65535
 119 00ca D363     		str	r3, [r2, #60]
 120 00cc 07F1C802 		add	r2, r7, #200
 121 00d0 4FF62423 		movw	r3, #64036
 122 00d4 CFF6FF73 		movt	r3, 65535
 123 00d8 1364     		str	r3, [r2, #64]
 124 00da 07F1C803 		add	r3, r7, #200
 125 00de 4FF0FA02 		mov	r2, #250
 126 00e2 5A64     		str	r2, [r3, #68]
 127 00e4 07F1C803 		add	r3, r7, #200
 128 00e8 40F2E242 		movw	r2, #1250
 129 00ec 9A64     		str	r2, [r3, #72]
 130 00ee 07F1C802 		add	r2, r7, #200
 131 00f2 4FF62423 		movw	r3, #64036
 132 00f6 CFF6FF73 		movt	r3, 65535
 133 00fa D364     		str	r3, [r2, #76]
 134 00fc 07F1C802 		add	r2, r7, #200
 135 0100 4FF23673 		movw	r3, #63286
 136 0104 CFF6FF73 		movt	r3, 65535
 137 0108 1365     		str	r3, [r2, #80]
 138 010a 07F1C803 		add	r3, r7, #200
 139 010e 6FF0F902 		mvn	r2, #249
 140 0112 5A65     		str	r2, [r3, #84]
 141 0114 07F1C803 		add	r3, r7, #200
 142 0118 40F6B832 		movw	r2, #3000
 143 011c DA66     		str	r2, [r3, #108]
 144 011e 07F1C803 		add	r3, r7, #200
 145 0122 40F23552 		movw	r2, #1333
 146 0126 1A67     		str	r2, [r3, #112]
 147 0128 07F1C802 		add	r2, r7, #200
 148 012c 4FF66653 		movw	r3, #64870
 149 0130 CFF6FF73 		movt	r3, 65535
 150 0134 5367     		str	r3, [r2, #116]
 151 0136 07F1C802 		add	r2, r7, #200
 152 013a 4FF67E13 		movw	r3, #63870
 153 013e CFF6FF73 		movt	r3, 65535
 154 0142 9367     		str	r3, [r2, #120]
 155 0144 07F1C802 		add	r2, r7, #200
 156 0148 4FF2E363 		movw	r3, #63203
 157 014c CFF6FF73 		movt	r3, 65535
 158 0150 D367     		str	r3, [r2, #124]
 159 0152 07F1C802 		add	r2, r7, #200
 160 0156 4EF61373 		movw	r3, #61203
 161 015a CFF6FF73 		movt	r3, 65535
 162 015e C2F88030 		str	r3, [r2, #128]
 163 0162 07F1C802 		add	r2, r7, #200
 164 0166 4EF69003 		movw	r3, #59536
 165 016a CFF6FF73 		movt	r3, 65535
 166 016e C2F88430 		str	r3, [r2, #132]
 167 0172 07F1C802 		add	r2, r7, #200
 168 0176 4EF6DE13 		movw	r3, #59870
 169 017a CFF6FF73 		movt	r3, 65535
 170 017e C2F88830 		str	r3, [r2, #136]
 171 0182 07F1C802 		add	r2, r7, #200
 172 0186 4FF2FB23 		movw	r3, #62203
 173 018a CFF6FF73 		movt	r3, 65535
 174 018e C2F88C30 		str	r3, [r2, #140]
 175 0192 07F1C802 		add	r2, r7, #200
 176 0196 4FF2E363 		movw	r3, #63203
 177 019a CFF6FF73 		movt	r3, 65535
 178 019e C2F89030 		str	r3, [r2, #144]
 179 01a2 07F1C802 		add	r2, r7, #200
 180 01a6 4FF63003 		movw	r3, #63536
 181 01aa CFF6FF73 		movt	r3, 65535
 182 01ae C2F89430 		str	r3, [r2, #148]
 183 01b2 07F1C802 		add	r2, r7, #200
 184 01b6 4FF26003 		movw	r3, #61536
 185 01ba CFF6FF73 		movt	r3, 65535
 186 01be C2F89830 		str	r3, [r2, #152]
 187 01c2 07F1C802 		add	r2, r7, #200
 188 01c6 4EF25B33 		movw	r3, #58203
 189 01ca CFF6FF73 		movt	r3, 65535
 190 01ce C2F89C30 		str	r3, [r2, #156]
 191 01d2 07F1C802 		add	r2, r7, #200
 192 01d6 4DF2A373 		movw	r3, #55203
 193 01da CFF6FF73 		movt	r3, 65535
 194 01de C2F8A030 		str	r3, [r2, #160]
 195 01e2 07F1C802 		add	r2, r7, #200
 196 01e6 4DF6F003 		movw	r3, #55536
 197 01ea CFF6FF73 		movt	r3, 65535
 198 01ee C2F8A430 		str	r3, [r2, #164]
 199 01f2 07F1C802 		add	r2, r7, #200
 200 01f6 4EF2C003 		movw	r3, #57536
 201 01fa CFF6FF73 		movt	r3, 65535
 202 01fe C2F8A830 		str	r3, [r2, #168]
 203 0202 07F1C802 		add	r2, r7, #200
 204 0206 4FF2AE13 		movw	r3, #61870
 205 020a CFF6FF73 		movt	r3, 65535
 206 020e C2F8AC30 		str	r3, [r2, #172]
 207 0212 07F1C802 		add	r2, r7, #200
 208 0216 4FF2FB23 		movw	r3, #62203
 209 021a CFF6FF73 		movt	r3, 65535
 210 021e C2F8B030 		str	r3, [r2, #176]
 211 0222 07F1C802 		add	r2, r7, #200
 212 0226 4EF62B33 		movw	r3, #60203
 213 022a CFF6FF73 		movt	r3, 65535
 214 022e C2F8B430 		str	r3, [r2, #180]
 215 0232 07F1C802 		add	r2, r7, #200
 216 0236 4DF6F003 		movw	r3, #55536
 217 023a CFF6FF73 		movt	r3, 65535
 218 023e C2F8B830 		str	r3, [r2, #184]
  22:../src/main.c **** 		{3000,1333,-666,-1666,-2333,-4333,-6000,-5666,-3333,-2333,-2000,-4000,-7333,-10333,-10000,-8000,-
  23:../src/main.c **** 
  24:../src/main.c **** //	Write the necessary C language statements below
  25:../src/main.c **** 
  26:../src/main.c **** 	//	START of integer only computations
  27:../src/main.c **** 	int x_mean = asm_sum_e(dataset.n, dataset.x)/dataset.n;	// Calculates the x mean
 219              		.loc 1 27 0
 220 0242 07F1C803 		add	r3, r7, #200
 221 0246 1A68     		ldr	r2, [r3, #0]
 222 0248 07F1C803 		add	r3, r7, #200
 223 024c 03F10803 		add	r3, r3, #8
 224 0250 1046     		mov	r0, r2
 225 0252 1946     		mov	r1, r3
 226 0254 FFF7FEFF 		bl	asm_sum_e
 227 0258 0246     		mov	r2, r0
 228 025a 07F1C803 		add	r3, r7, #200
 229 025e 1B68     		ldr	r3, [r3, #0]
 230 0260 92FBF3F3 		sdiv	r3, r2, r3
 231 0264 C7F8BC31 		str	r3, [r7, #444]
  28:../src/main.c **** 	int y_mean = asm_sum_e(dataset.n, dataset.y)/dataset.n;	// Calculates the y mean
 232              		.loc 1 28 0
 233 0268 07F1C803 		add	r3, r7, #200
 234 026c 1A68     		ldr	r2, [r3, #0]
 235 026e 07F1C803 		add	r3, r7, #200
 236 0272 03F16C03 		add	r3, r3, #108
 237 0276 1046     		mov	r0, r2
 238 0278 1946     		mov	r1, r3
 239 027a FFF7FEFF 		bl	asm_sum_e
 240 027e 0246     		mov	r2, r0
 241 0280 07F1C803 		add	r3, r7, #200
 242 0284 1B68     		ldr	r3, [r3, #0]
 243 0286 92FBF3F3 		sdiv	r3, r2, r3
 244 028a C7F8B831 		str	r3, [r7, #440]
  29:../src/main.c **** 
  30:../src/main.c **** 	int x_diff[N]; // predicted and SSE requires original dataset values
  31:../src/main.c **** 	int y_diff[N]; // Therefore, all calculations done on the copied values.
  32:../src/main.c **** 
  33:../src/main.c **** 	for(i = 0; i < dataset.n; i++) {
 245              		.loc 1 33 0
 246 028e 4FF00003 		mov	r3, #0
 247 0292 C7F8CC31 		str	r3, [r7, #460]
 248 0296 28E0     		b	.L2
 249              	.L3:
  34:../src/main.c **** 		x_diff[i] = dataset.x[i] - x_mean; // x_diff_i = (x_i - x_mean) for i [0, dataset.n)
 250              		.loc 1 34 0 discriminator 2
 251 0298 07F1C803 		add	r3, r7, #200
 252 029c D7F8CC21 		ldr	r2, [r7, #460]
 253 02a0 02F10202 		add	r2, r2, #2
 254 02a4 53F82220 		ldr	r2, [r3, r2, lsl #2]
 255 02a8 D7F8BC31 		ldr	r3, [r7, #444]
 256 02ac D11A     		subs	r1, r2, r3
 257 02ae 07F16403 		add	r3, r7, #100
 258 02b2 D7F8CC21 		ldr	r2, [r7, #460]
 259 02b6 43F82210 		str	r1, [r3, r2, lsl #2]
  35:../src/main.c **** 		y_diff[i] = dataset.y[i] - y_mean; // y_diff_i = (y_i - y_mean) for i [0, dataset.n)
 260              		.loc 1 35 0 discriminator 2
 261 02ba 07F1C802 		add	r2, r7, #200
 262 02be D7F8CC31 		ldr	r3, [r7, #460]
 263 02c2 03F11A03 		add	r3, r3, #26
 264 02c6 4FEA8303 		lsl	r3, r3, #2
 265 02ca D318     		adds	r3, r2, r3
 266 02cc 5A68     		ldr	r2, [r3, #4]
 267 02ce D7F8B831 		ldr	r3, [r7, #440]
 268 02d2 D11A     		subs	r1, r2, r3
 269 02d4 3B46     		mov	r3, r7
 270 02d6 D7F8CC21 		ldr	r2, [r7, #460]
 271 02da 43F82210 		str	r1, [r3, r2, lsl #2]
  33:../src/main.c **** 	for(i = 0; i < dataset.n; i++) {
 272              		.loc 1 33 0 discriminator 2
 273 02de D7F8CC31 		ldr	r3, [r7, #460]
 274 02e2 03F10103 		add	r3, r3, #1
 275 02e6 C7F8CC31 		str	r3, [r7, #460]
 276              	.L2:
  33:../src/main.c **** 	for(i = 0; i < dataset.n; i++) {
 277              		.loc 1 33 0 is_stmt 0 discriminator 1
 278 02ea 07F1C803 		add	r3, r7, #200
 279 02ee 1A68     		ldr	r2, [r3, #0]
 280 02f0 D7F8CC31 		ldr	r3, [r7, #460]
 281 02f4 9A42     		cmp	r2, r3
 282 02f6 CFDC     		bgt	.L3
  36:../src/main.c **** 	}
  37:../src/main.c **** 
  38:../src/main.c **** 	asm_mul_e(dataset.n, y_diff, x_diff); // (y_i - y_mean)(x_i - x_mean) for each i [0, dataset.n)
 283              		.loc 1 38 0 is_stmt 1
 284 02f8 07F1C803 		add	r3, r7, #200
 285 02fc 1968     		ldr	r1, [r3, #0]
 286 02fe 3A46     		mov	r2, r7
 287 0300 07F16403 		add	r3, r7, #100
 288 0304 0846     		mov	r0, r1
 289 0306 1146     		mov	r1, r2
 290 0308 1A46     		mov	r2, r3
 291 030a FFF7FEFF 		bl	asm_mul_e
  39:../src/main.c **** 	asm_mul_e(dataset.n, x_diff, x_diff); // (x_i - x_mean)(x_i - x_mean) for each i [0, dataset.n)
 292              		.loc 1 39 0
 293 030e 07F1C803 		add	r3, r7, #200
 294 0312 1968     		ldr	r1, [r3, #0]
 295 0314 07F16402 		add	r2, r7, #100
 296 0318 07F16403 		add	r3, r7, #100
 297 031c 0846     		mov	r0, r1
 298 031e 1146     		mov	r1, r2
 299 0320 1A46     		mov	r2, r3
 300 0322 FFF7FEFF 		bl	asm_mul_e
  40:../src/main.c **** 
  41:../src/main.c **** 	int num_total = asm_sum_e(dataset.n, y_diff); // summation of (y_i - y_mean)(x_i - x_mean) for eac
 301              		.loc 1 41 0
 302 0326 07F1C803 		add	r3, r7, #200
 303 032a 1A68     		ldr	r2, [r3, #0]
 304 032c 3B46     		mov	r3, r7
 305 032e 1046     		mov	r0, r2
 306 0330 1946     		mov	r1, r3
 307 0332 FFF7FEFF 		bl	asm_sum_e
 308 0336 0346     		mov	r3, r0
 309 0338 C7F8B431 		str	r3, [r7, #436]
  42:../src/main.c **** 	int den_total = asm_sum_e(dataset.n, x_diff); // summation of (x_i - x_mean)(x_i - x_mean) for eac
 310              		.loc 1 42 0
 311 033c 07F1C803 		add	r3, r7, #200
 312 0340 1A68     		ldr	r2, [r3, #0]
 313 0342 07F16403 		add	r3, r7, #100
 314 0346 1046     		mov	r0, r2
 315 0348 1946     		mov	r1, r3
 316 034a FFF7FEFF 		bl	asm_sum_e
 317 034e 0346     		mov	r3, r0
 318 0350 C7F8B031 		str	r3, [r7, #432]
  43:../src/main.c **** 	//	END of integer only computations
  44:../src/main.c **** 
  45:../src/main.c **** //  START of floating point computations
  46:../src/main.c **** 	double b1 = ((double)num_total/(double)den_total); // typecast to avoid decimal point errors
 319              		.loc 1 46 0
 320 0354 D7F8B401 		ldr	r0, [r7, #436]
 321 0358 FFF7FEFF 		bl	__aeabi_i2d
 322 035c 0446     		mov	r4, r0
 323 035e 0D46     		mov	r5, r1
 324 0360 D7F8B001 		ldr	r0, [r7, #432]
 325 0364 FFF7FEFF 		bl	__aeabi_i2d
 326 0368 0246     		mov	r2, r0
 327 036a 0B46     		mov	r3, r1
 328 036c 2046     		mov	r0, r4
 329 036e 2946     		mov	r1, r5
 330 0370 FFF7FEFF 		bl	__aeabi_ddiv
 331 0374 0246     		mov	r2, r0
 332 0376 0B46     		mov	r3, r1
 333 0378 07F5D471 		add	r1, r7, #424
 334 037c C1E90023 		strd	r2, [r1]
  47:../src/main.c **** 	double b0 = ((y_mean - (b1*x_mean))/((double)dataset.scale)); // scale is type int, must typecast 
 335              		.loc 1 47 0
 336 0380 D7F8B801 		ldr	r0, [r7, #440]
 337 0384 FFF7FEFF 		bl	__aeabi_i2d
 338 0388 0446     		mov	r4, r0
 339 038a 0D46     		mov	r5, r1
 340 038c D7F8BC01 		ldr	r0, [r7, #444]
 341 0390 FFF7FEFF 		bl	__aeabi_i2d
 342 0394 0246     		mov	r2, r0
 343 0396 0B46     		mov	r3, r1
 344 0398 1046     		mov	r0, r2
 345 039a 1946     		mov	r1, r3
 346 039c 07F5D47C 		add	ip, r7, #424
 347 03a0 DCE90023 		ldrd	r2, [ip]
 348 03a4 FFF7FEFF 		bl	__aeabi_dmul
 349 03a8 0246     		mov	r2, r0
 350 03aa 0B46     		mov	r3, r1
 351 03ac 2046     		mov	r0, r4
 352 03ae 2946     		mov	r1, r5
 353 03b0 FFF7FEFF 		bl	__aeabi_dsub
 354 03b4 0246     		mov	r2, r0
 355 03b6 0B46     		mov	r3, r1
 356 03b8 1446     		mov	r4, r2
 357 03ba 1D46     		mov	r5, r3
 358 03bc 07F1C803 		add	r3, r7, #200
 359 03c0 5B68     		ldr	r3, [r3, #4]
 360 03c2 1846     		mov	r0, r3
 361 03c4 FFF7FEFF 		bl	__aeabi_i2d
 362 03c8 0246     		mov	r2, r0
 363 03ca 0B46     		mov	r3, r1
 364 03cc 2046     		mov	r0, r4
 365 03ce 2946     		mov	r1, r5
 366 03d0 FFF7FEFF 		bl	__aeabi_ddiv
 367 03d4 0246     		mov	r2, r0
 368 03d6 0B46     		mov	r3, r1
 369 03d8 07F5D071 		add	r1, r7, #416
 370 03dc C1E90023 		strd	r2, [r1]
  48:../src/main.c **** 	double y_pred;
  49:../src/main.c **** 	double SSE = 0; // initialize to 0 so that iterative addition gives correct result.
 371              		.loc 1 49 0
 372 03e0 4FF00002 		mov	r2, #0
 373 03e4 4FF00003 		mov	r3, #0
 374 03e8 07F5E07C 		add	ip, r7, #448
 375 03ec CCE90023 		strd	r2, [ip]
  50:../src/main.c **** 
  51:../src/main.c **** 	for(i = 0; i < dataset.n; i++) {
 376              		.loc 1 51 0
 377 03f0 4FF00003 		mov	r3, #0
 378 03f4 C7F8CC31 		str	r3, [r7, #460]
 379 03f8 9AE0     		b	.L4
 380              	.L5:
  52:../src/main.c **** 		y_pred = (b0 + b1*(dataset.x[i]/ ((double)dataset.scale))); // Use initial dataset to calculate t
 381              		.loc 1 52 0 discriminator 2
 382 03fa 07F1C803 		add	r3, r7, #200
 383 03fe D7F8CC21 		ldr	r2, [r7, #460]
 384 0402 02F10202 		add	r2, r2, #2
 385 0406 53F82230 		ldr	r3, [r3, r2, lsl #2]
 386 040a 1846     		mov	r0, r3
 387 040c FFF7FEFF 		bl	__aeabi_i2d
 388 0410 0446     		mov	r4, r0
 389 0412 0D46     		mov	r5, r1
 390 0414 07F1C803 		add	r3, r7, #200
 391 0418 5B68     		ldr	r3, [r3, #4]
 392 041a 1846     		mov	r0, r3
 393 041c FFF7FEFF 		bl	__aeabi_i2d
 394 0420 0246     		mov	r2, r0
 395 0422 0B46     		mov	r3, r1
 396 0424 2046     		mov	r0, r4
 397 0426 2946     		mov	r1, r5
 398 0428 FFF7FEFF 		bl	__aeabi_ddiv
 399 042c 0246     		mov	r2, r0
 400 042e 0B46     		mov	r3, r1
 401 0430 1046     		mov	r0, r2
 402 0432 1946     		mov	r1, r3
 403 0434 07F5D47C 		add	ip, r7, #424
 404 0438 DCE90023 		ldrd	r2, [ip]
 405 043c FFF7FEFF 		bl	__aeabi_dmul
 406 0440 0246     		mov	r2, r0
 407 0442 0B46     		mov	r3, r1
 408 0444 1046     		mov	r0, r2
 409 0446 1946     		mov	r1, r3
 410 0448 07F5D07C 		add	ip, r7, #416
 411 044c DCE90023 		ldrd	r2, [ip]
 412 0450 FFF7FEFF 		bl	__aeabi_dadd
 413 0454 0246     		mov	r2, r0
 414 0456 0B46     		mov	r3, r1
 415 0458 07F5CC71 		add	r1, r7, #408
 416 045c C1E90023 		strd	r2, [r1]
  53:../src/main.c **** 		SSE = (((dataset.y[i]/((double)dataset.scale)) - y_pred)*((dataset.y[i]/((double)dataset.scale)) 
 417              		.loc 1 53 0 discriminator 2
 418 0460 07F1C802 		add	r2, r7, #200
 419 0464 D7F8CC31 		ldr	r3, [r7, #460]
 420 0468 03F11A03 		add	r3, r3, #26
 421 046c 4FEA8303 		lsl	r3, r3, #2
 422 0470 D318     		adds	r3, r2, r3
 423 0472 5B68     		ldr	r3, [r3, #4]
 424 0474 1846     		mov	r0, r3
 425 0476 FFF7FEFF 		bl	__aeabi_i2d
 426 047a 0446     		mov	r4, r0
 427 047c 0D46     		mov	r5, r1
 428 047e 07F1C803 		add	r3, r7, #200
 429 0482 5B68     		ldr	r3, [r3, #4]
 430 0484 1846     		mov	r0, r3
 431 0486 FFF7FEFF 		bl	__aeabi_i2d
 432 048a 0246     		mov	r2, r0
 433 048c 0B46     		mov	r3, r1
 434 048e 2046     		mov	r0, r4
 435 0490 2946     		mov	r1, r5
 436 0492 FFF7FEFF 		bl	__aeabi_ddiv
 437 0496 0246     		mov	r2, r0
 438 0498 0B46     		mov	r3, r1
 439 049a 1046     		mov	r0, r2
 440 049c 1946     		mov	r1, r3
 441 049e 07F5CC7C 		add	ip, r7, #408
 442 04a2 DCE90023 		ldrd	r2, [ip]
 443 04a6 FFF7FEFF 		bl	__aeabi_dsub
 444 04aa 0246     		mov	r2, r0
 445 04ac 0B46     		mov	r3, r1
 446 04ae 1446     		mov	r4, r2
 447 04b0 1D46     		mov	r5, r3
 448 04b2 07F1C802 		add	r2, r7, #200
 449 04b6 D7F8CC31 		ldr	r3, [r7, #460]
 450 04ba 03F11A03 		add	r3, r3, #26
 451 04be 4FEA8303 		lsl	r3, r3, #2
 452 04c2 D318     		adds	r3, r2, r3
 453 04c4 5B68     		ldr	r3, [r3, #4]
 454 04c6 1846     		mov	r0, r3
 455 04c8 FFF7FEFF 		bl	__aeabi_i2d
 456 04cc 8046     		mov	r8, r0
 457 04ce 8946     		mov	r9, r1
 458 04d0 07F1C803 		add	r3, r7, #200
 459 04d4 5B68     		ldr	r3, [r3, #4]
 460 04d6 1846     		mov	r0, r3
 461 04d8 FFF7FEFF 		bl	__aeabi_i2d
 462 04dc 0246     		mov	r2, r0
 463 04de 0B46     		mov	r3, r1
 464 04e0 4046     		mov	r0, r8
 465 04e2 4946     		mov	r1, r9
 466 04e4 FFF7FEFF 		bl	__aeabi_ddiv
 467 04e8 0246     		mov	r2, r0
 468 04ea 0B46     		mov	r3, r1
 469 04ec 1046     		mov	r0, r2
 470 04ee 1946     		mov	r1, r3
 471 04f0 07F5CC7C 		add	ip, r7, #408
 472 04f4 DCE90023 		ldrd	r2, [ip]
 473 04f8 FFF7FEFF 		bl	__aeabi_dsub
 474 04fc 0246     		mov	r2, r0
 475 04fe 0B46     		mov	r3, r1
 476 0500 2046     		mov	r0, r4
 477 0502 2946     		mov	r1, r5
 478 0504 FFF7FEFF 		bl	__aeabi_dmul
 479 0508 0246     		mov	r2, r0
 480 050a 0B46     		mov	r3, r1
 481 050c 07F5E07C 		add	ip, r7, #448
 482 0510 DCE90001 		ldrd	r0, [ip]
 483 0514 FFF7FEFF 		bl	__aeabi_dadd
 484 0518 0246     		mov	r2, r0
 485 051a 0B46     		mov	r3, r1
 486 051c 07F5E071 		add	r1, r7, #448
 487 0520 C1E90023 		strd	r2, [r1]
  51:../src/main.c **** 	for(i = 0; i < dataset.n; i++) {
 488              		.loc 1 51 0 discriminator 2
 489 0524 D7F8CC31 		ldr	r3, [r7, #460]
 490 0528 03F10103 		add	r3, r3, #1
 491 052c C7F8CC31 		str	r3, [r7, #460]
 492              	.L4:
  51:../src/main.c **** 	for(i = 0; i < dataset.n; i++) {
 493              		.loc 1 51 0 is_stmt 0 discriminator 1
 494 0530 07F1C803 		add	r3, r7, #200
 495 0534 1A68     		ldr	r2, [r3, #0]
 496 0536 D7F8CC31 		ldr	r3, [r7, #460]
 497 053a 9A42     		cmp	r2, r3
 498 053c 3FF75DAF 		bgt	.L5
  54:../src/main.c **** 	}
  55:../src/main.c **** //  END of floating point computations
  56:../src/main.c **** 
  57:../src/main.c **** //	Print out linear regression model parameters and SSE value on console
  58:../src/main.c **** 	printf("b0: %lf\n", b0);
 499              		.loc 1 58 0 is_stmt 1
 500 0540 40F20003 		movw	r3, #:lower16:.LC0
 501 0544 C0F20003 		movt	r3, #:upper16:.LC0
 502 0548 1846     		mov	r0, r3
 503 054a 07F5D07C 		add	ip, r7, #416
 504 054e DCE90023 		ldrd	r2, [ip]
 505 0552 FFF7FEFF 		bl	printf
  59:../src/main.c **** 	printf("b1: %lf\n", b1);
 506              		.loc 1 59 0
 507 0556 40F20003 		movw	r3, #:lower16:.LC1
 508 055a C0F20003 		movt	r3, #:upper16:.LC1
 509 055e 1846     		mov	r0, r3
 510 0560 07F5D471 		add	r1, r7, #424
 511 0564 D1E90023 		ldrd	r2, [r1]
 512 0568 FFF7FEFF 		bl	printf
  60:../src/main.c **** 	printf("SSE: %lf\n", SSE);
 513              		.loc 1 60 0
 514 056c 40F20003 		movw	r3, #:lower16:.LC2
 515 0570 C0F20003 		movt	r3, #:upper16:.LC2
 516 0574 1846     		mov	r0, r3
 517 0576 07F5E07C 		add	ip, r7, #448
 518 057a DCE90023 		ldrd	r2, [ip]
 519 057e FFF7FEFF 		bl	printf
 520              	.L6:
  61:../src/main.c **** 
  62:../src/main.c **** // 	Enter an infinite loop, just incrementing a counter.
  63:../src/main.c **** // 	Do not modify this code. It enables values or variables and registers to be inspected before th
  64:../src/main.c **** 	volatile static int loop = 0;
  65:../src/main.c **** 	while (1) {
  66:../src/main.c **** 		loop++;
 521              		.loc 1 66 0 discriminator 1
 522 0582 40F20003 		movw	r3, #:lower16:loop.3839
 523 0586 C0F20003 		movt	r3, #:upper16:loop.3839
 524 058a 1B68     		ldr	r3, [r3, #0]
 525 058c 03F10102 		add	r2, r3, #1
 526 0590 40F20003 		movw	r3, #:lower16:loop.3839
 527 0594 C0F20003 		movt	r3, #:upper16:loop.3839
 528 0598 1A60     		str	r2, [r3, #0]
  67:../src/main.c **** 	}
 529              		.loc 1 67 0 discriminator 1
 530 059a F2E7     		b	.L6
 531              		.cfi_endproc
 532              	.LFE0:
 534              		.bss
 535              		.align	2
 536              	loop.3839:
 537 0000 00000000 		.space	4
 538              		.text
 539              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\User\AppData\Local\Temp\ccj32XLj.s:24     .rodata:00000000 $d
C:\Users\User\AppData\Local\Temp\ccj32XLj.s:25     .rodata:00000000 .LC0
C:\Users\User\AppData\Local\Temp\ccj32XLj.s:28     .rodata:0000000c .LC1
C:\Users\User\AppData\Local\Temp\ccj32XLj.s:31     .rodata:00000018 .LC2
C:\Users\User\AppData\Local\Temp\ccj32XLj.s:34     .text.main:00000000 $t
C:\Users\User\AppData\Local\Temp\ccj32XLj.s:39     .text.main:00000000 main
C:\Users\User\AppData\Local\Temp\ccj32XLj.s:536    .bss:00000000 loop.3839
C:\Users\User\AppData\Local\Temp\ccj32XLj.s:535    .bss:00000000 $d
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
__aeabi_i2d
__aeabi_ddiv
__aeabi_dmul
__aeabi_dsub
__aeabi_dadd
memset
asm_sum_e
asm_mul_e
printf
