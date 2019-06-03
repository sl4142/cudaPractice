#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

cudaError_t cudaAdd(float *c, const float *a, const float *b, unsigned int size);
__global__ void addKernel(float *c, const float *a, const float *b)
{
	int i = threadIdx.x + blockIdx.x * blockDim.x;
	c[i] = a[i] + b[i];
}


void sumWithHost(float *c, const float *a, const float *b, int size)
{
	for (int i = 0; i < size; i++)
	{
		c[i] = a[i] + b[i];
	}
}


void initData(float *a, int size)
{
	time_t t;
	
	srand((unsigned) time(&t));
	for (int i = 0; i < size; i++)
	{
		a[i] = (float)(rand() & 0xFF) / 10.0f;
	}
}

int main()
{
	/*const int size = 5000000;
	float a[size];

	clock_t start, end;
	double timeUsed;
	start = clock();
	fun();
	timeUsed = ((double)(clock() - start) / CLOCKS_PER_SEC);
	printf("HOST CPU Time Used = %.10f\n", timeUsed);*/

	/*const int size = 10;
	int nBytes = size * sizeof(float);
	printf("nBytes = %d\n", nBytes);
	float a[size], b[size], c[size];
	//a = (float *)malloc(nBytes);
	//b = (float *)malloc(nBytes);
	//c = (float *)malloc(nBytes);
	
	initData(a, size);
	initData(b, size);*/
	
	printf("start...\n");

	const unsigned int size = 3000;
	float a[size], b[size], c[size];
	initData(a, size);
	initData(b, size);

	/*clock_t start = clock();
	sumWithHost(c, a, b, size);
	double timeUsed = clock() - start;
	timeUsed = ((double)(timeUsed / CLOCKS_PER_SEC));
	printf("Host CPU Time Used = %.15f\n", timeUsed);
	printf("c %.2f = a %.2f + b %.2f\n", c[size-1], a[size-1], b[size-1]);
	//free(a);*/

	cudaAdd(c, a, b, size);
	printf("c %.2f = a %.2f + b %.2f GPU\n", c[1], a[1], b[1]);
}

cudaError_t cudaAdd(float *c, const float *a, const float *b, unsigned int size)
{
	float *dev_c, *dev_a, *dev_b;
	const int newSize = size * sizeof(float);
	cudaSetDevice(0);
	cudaMalloc((void**)&dev_c, size * sizeof(float));
	cudaMalloc((void**)&dev_b, size * sizeof(float));
	cudaMalloc((void**)&dev_a, size * sizeof(float));
	cudaMemcpy(dev_a, a, size * sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b, b, size * sizeof(float), cudaMemcpyHostToDevice);
	addKernel << <1, size >> > (dev_c, dev_a, dev_b);
	cudaDeviceSynchronize();
	cudaMemcpy(c, dev_c, size * sizeof(float), cudaMemcpyDeviceToHost);
	cudaError_t status = cudaDeviceReset();
	cudaFree(dev_a); cudaFree(dev_b); cudaFree(dev_c);
	return status;
}
