/*#include  "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>


cudaError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);
__global__ void addKernel(int *c, const int *a, const int *b)
{
	int i = threadIdx.x;
	c[i] = a[i] + b[i];
}

int main234234() 
{
	const int size = 5;
	const int a[size] = { 1, 2, 3, 4, 5 };
	const int b[size] = { 10, 11 ,12, 13, 14 };
	int c[size] = { 0 };

	cudaError_t cudaStatus = addWithCuda(c, a, b, size);
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "addWithCuda Failed");
		return 1;
	}

	printf("{1,2,3,4,5} + {10,11,12,13,14} = {%d, %d, %d, %d, %d}\n",
		c[0], c[1], c[2], c[3], c[4]);

	cudaStatus = cudaDeviceReset();
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaDeviceReset Failed");
		return 1;
	}

	return 0;
}

cudaError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size)
{
	int *dev_a = 0;
	int *dev_b = 0;
	int *dev_c = 0;
	cudaError_t cudaStatus;

	cudaStatus = cudaSetDevice(0);
	if (cudaStatus != cudaSuccess) {
		fprintf(stderr, "cudaSetDevice Failed");
	}
	int newSize = size * sizeof(int);

	cudaMalloc((void**)&dev_a, newSize);
	cudaMalloc((void**)&dev_b, newSize);
	cudaMalloc((void**)&dev_c, newSize);
	cudaMemcpy(dev_a, a, newSize, cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b, b, newSize, cudaMemcpyHostToDevice);
	addKernel<<<1, size >>> (dev_c, dev_a, dev_b);
	cudaDeviceSynchronize();
	cudaMemcpy(c, dev_c, newSize, cudaMemcpyDeviceToHost);

	cudaFree(dev_c);
	cudaFree(dev_a);
	cudaFree(dev_b);

	return cudaStatus;

}
*/