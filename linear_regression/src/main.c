#include "stdio.h"

#define N 25 // maximum of 25 elements in vector

extern int asm_sum_e(int n,int* v); // sum elements, returns result
extern void asm_mul_e(int n,int* v1,int* v2); // multiply element by element, returns results in v1

// struct for data values
struct data
{
	int n;
	int scale;
	int x[N];
	int y[N];
};

int main(void)
{
	int i;

	struct data dataset = {20,1000,{3500,2500,1250,-500,-1000,-1500,-1250,0,2250,4000,2750,750,-1750,-2000,-1500,250,1250,-1500,-2250,-250},
		{3000,1333,-666,-1666,-2333,-4333,-6000,-5666,-3333,-2333,-2000,-4000,-7333,-10333,-10000,-8000,-3666,-3333,-5333,-10000}};

//	Write the necessary C language statements below

	//	START of integer only computations
	int x_mean = asm_sum_e(dataset.n, dataset.x)/dataset.n;	// Calculates the x mean
	int y_mean = asm_sum_e(dataset.n, dataset.y)/dataset.n;	// Calculates the y mean

	int x_diff[N]; // predicted and SSE requires original dataset values
	int y_diff[N]; // Therefore, all calculations done on the copied values.

	for(i = 0; i < dataset.n; i++) {
		x_diff[i] = dataset.x[i] - x_mean; // x_diff_i = (x_i - x_mean) for i [0, dataset.n)
		y_diff[i] = dataset.y[i] - y_mean; // y_diff_i = (y_i - y_mean) for i [0, dataset.n)
	}

	asm_mul_e(dataset.n, y_diff, x_diff); // (y_i - y_mean)(x_i - x_mean) for each i [0, dataset.n)
	asm_mul_e(dataset.n, x_diff, x_diff); // (x_i - x_mean)(x_i - x_mean) for each i [0, dataset.n)

	int num_total = asm_sum_e(dataset.n, y_diff); // summation of (y_i - y_mean)(x_i - x_mean) for each i [0, dataset.n)
	int den_total = asm_sum_e(dataset.n, x_diff); // summation of (x_i - x_mean)(x_i - x_mean) for each i [0, dataset.n)
	//	END of integer only computations

//  START of floating point computations
	double b1 = ((double)num_total/(double)den_total); // typecast to avoid decimal point errors
	double b0 = ((y_mean - (b1*x_mean))/((double)dataset.scale)); // scale is type int, must typecast to avoid any decimal point errors
	double y_pred;
	double SSE = 0; // initialize to 0 so that iterative addition gives correct result.

	for(i = 0; i < dataset.n; i++) {
		y_pred = (b0 + b1*(dataset.x[i]/ ((double)dataset.scale))); // Use initial dataset to calculate the predicted value of y
		SSE = (((dataset.y[i]/((double)dataset.scale)) - y_pred)*((dataset.y[i]/((double)dataset.scale)) - y_pred)) + SSE; // Use initial dataset to calculate the value of SSE
	}
//  END of floating point computations

//	Print out linear regression model parameters and SSE value on console
	printf("b0: %lf\n", b0);
	printf("b1: %lf\n", b1);
	printf("SSE: %lf\n", SSE);

// 	Enter an infinite loop, just incrementing a counter.
// 	Do not modify this code. It enables values or variables and registers to be inspected before the program ends.
	volatile static int loop = 0;
	while (1) {
		loop++;
	}
}

