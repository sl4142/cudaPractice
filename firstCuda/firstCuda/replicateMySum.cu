#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*
THIS VERSION IS PERFECT!!!
*/

/*void sumOnHost(float *c, const float *a, const float *b, unsigned int size)
{
	for (int i = 0; i < size; i++)
	{
		c[i] = a[i] + b[i];
	}
}

cudaError_t cudaAdd(float *c, const float *a, const float *b, unsigned long size);
__global__ void addKernel(float *c, const float *a, const float *b, unsigned int size)
{
	int i = threadIdx.x + blockIdx.x * blockDim.x;
	if (i < size) c[i] = a[i] + b[i];
}

void initData(float *dat, unsigned long size)
{
	time_t t;
	srand((unsigned)time(&t));
	for (long i = 0; i < size; i++)
	{
		dat[i] = (rand() & 0xFF) / 10.0f;
	}
}

void checkResult(const float *a, const float *b, unsigned long size)
{
	double eps = 1.0E-8;
	for (long i = 0; i < size; i++)
	{
		if (abs(a[i] - b[i]) > eps)
		{
			printf("Not Match!\n");
			break;
		}
	}
	printf("Results Match!\n");

}

int main(int argc, char **argv)
{
	printf("Started...\n");
	const long size = 100000000;
	const long nBytes = size * sizeof(float);
	float *a = (float *)malloc(nBytes);
	float *b = (float *)malloc(nBytes);
	float *c = (float *)malloc(nBytes);
	float *gpuC = (float *)malloc(nBytes);


	initData(a, size);
	initData(b, size);
	
	time_t t = clock();
	for (long i = 0; i < size; i++)
	{
		c[i] = a[i] + b[i]; 
	}
	printf("size = %d\n", size);
	double used = clock() - t;
	used = (double)used / CLOCKS_PER_SEC;
	printf("Host time used = %.10f\n", used);
	printf("%.3f = %.3f + %.3f\n", c[1], a[1], b[1]);

	
	cudaAdd(gpuC, a, b, size);
	printf("%.3f = %.3f + %.3f\n", gpuC[1], a[1], b[1]);

	checkResult(c, gpuC, size);
}

cudaError_t cudaAdd(float *c, const float *a, const float *b, unsigned long size)
{
	const long newSize = size * sizeof(float);
	float *dev_c = 0, *dev_a = 0, *dev_b = 0;
	cudaSetDevice(0);
	cudaMalloc((void**)&dev_c, newSize);
	cudaMalloc((void**)&dev_a, newSize);
	cudaMalloc((void**)&dev_b, newSize);
	cudaMemcpy(dev_a, a, newSize, cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b, b, newSize, cudaMemcpyHostToDevice);
	dim3 block(1024);
	dim3 grid((size + block.x - 1) / block.x);
	time_t t = clock();
	addKernel << <grid, block>> > (dev_c, dev_a, dev_b, size);
	cudaDeviceSynchronize();
	double used = clock() - t;
	used = (double)used / CLOCKS_PER_SEC;
	printf("<<<%d, %d>>> GPU time used = %.10f\n", grid.x, block.x, used);
	cudaMemcpy(c, dev_c, newSize, cudaMemcpyDeviceToHost);
	cudaFree(dev_c);
	cudaFree(dev_b);
	cudaFree(dev_a);
	cudaError_t status = cudaDeviceReset();
	return status;
}*/