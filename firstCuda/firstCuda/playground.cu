#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*#define CHECK(call)																	\
{																					\
	cudaError_t error = call;														\
	if (error != cudaSuccess)														\
	{																				\
		fprintf(stderr, "%s: %d", __FILE__, __LINE__);								\
		fprintf(stderr, "%code %d, reason: %s", error, cudaGetErrorString(error));	\
		exit(1);																	\
	}																				\
}																					\

void initalData(float *dat, const int size) 
{
	time_t t;
	srand((unsigned)time(&t));
	for (int i = 0; i < size; i++) {
		dat[i] = (rand() & 0xFF) / 10.0f;
	}
}

void checkResult(const float *a, const float *b, const unsigned int size) {
	double eps = 1.0E-08;
	for (int i = 0; i < size; i++) 
	{
		if (abs(a[i] - b[i]) > eps)
		{
			printf("Result Not Match!\n");
			return;
		}
	}
	printf("Results Match!\n");
}

void sumOnCPU(float *c, float *a, float *b, const int nx, const int ny) {
	float *C = c;
	float *A = a;
	float *B = b;
	for (int iy = 0; iy < ny; iy++)
	{
		for (int ix = 0; ix < nx; ix++)
		{
			C[ix] = A[ix] + B[ix];
		}
		C += nx;
		A += nx;
		B += nx;
	}
}

cudaError_t cudaSumMatrix(float *c, const float *a, const float *b, const int nx, const int ny);

__global__ void addVectorKernel(float *c, float *a, float *b, const int size)
{
	int idx = threadIdx.x + blockIdx.x * blockDim.x;
	if (idx < size) c[idx] = a[idx] + b[idx];
}

cudaError_t cudaSumVector(float *c, const float *a, const float *b, const int size)
{
	float *dev_c = 0, *dev_a = 0, *dev_b = 0;
	int nBytes = size * sizeof(float);
	cudaMalloc((void**)&dev_c, nBytes);
	cudaMalloc((void**)&dev_c, nBytes);
	cudaMalloc((void**)&dev_c, nBytes);

	cudaMemcpy(dev_a, a, nBytes, cudaMemcpyHostToDevice);
	cudaMemcpy(dev_a, a, nBytes, cudaMemcpyHostToDevice);

	dim3 block(1024);
	dim3 grid((size + block.x - 1) / block.x);
	addVectorKernel << <grid, block >> > (dev_c, dev_a, dev_b, size);
	cudaDeviceSynchronize();
	cudaMemcpy(c, dev_c, nBytes, cudaMemcpyDeviceToHost);
	cudaFree(dev_c);
	cudaFree(dev_a);
	cudaFree(dev_b);
	cudaError_t status = cudaDeviceReset();
	return status;
}

__global__ void addKernel(float *c, const float *a, const float *b, const int nx, const int ny)
{
	int ix = threadIdx.x + blockIdx.x * blockDim.x;
	int iy = threadIdx.y + blockIdx.y * blockDim.y;
	int idx = iy * nx + ix;
	if (ix < nx && iy < ny) c[idx] = a[idx] + b[idx];
}

int main(int argc, char **argv)
{
	const int nx = 1 << 14, ny = 1 << 14;
	const int nxy = nx * ny;
	const int nBytes = nxy * sizeof(float);
	float *a = (float*)malloc(nBytes);
	float *b = (float*)malloc(nBytes);
	float *c = (float*)malloc(nBytes);
	float *gpuC = (float*)malloc(nBytes);

	printf("Started...\n");
	printf("Matrix %d x %d\n", nx, ny);

	time_t t = clock();
	initalData(a, nxy);
	initalData(b, nxy);
	double used = clock() - t;
	used = (double)used / CLOCKS_PER_SEC;
	printf("Initial Data used = %.3f\n", used);

	t = clock();
	sumOnCPU(c, a, b, nx, ny);
	used = clock() - t;
	used = (double)used / CLOCKS_PER_SEC;
	printf("CPU used = %.3f\n", used);

	cudaSumMatrix(gpuC, a, b, nx, ny);
	checkResult(c, gpuC, nxy);

	return 0;

}

cudaError_t cudaSumMatrix(float *c, const float *a, const float *b, const int nx, const int ny)
{
	float *dev_a = 0, *dev_b = 0, *dev_c = 0;
	cudaDeviceProp devProp;
	int dev = 0;
	cudaGetDeviceProperties(&devProp, dev);
	printf("Device %d: %s\n", dev, devProp.name);
	const int nxy = nx * ny;
	const int nBytes = nxy * sizeof(float);
	cudaSetDevice(dev);
	cudaMalloc((void**)&dev_a, nBytes);
	cudaMalloc((void**)&dev_b, nBytes);
	cudaMalloc((void**)&dev_c, nBytes);

	cudaMemcpy(dev_a, a, nBytes, cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b, b, nBytes, cudaMemcpyHostToDevice);
	int dimx = 32, dimy = 32;
	dim3 block(dimx, dimy);
	dim3 grid((nx + block.x - 1) / block.x, (ny + block.y - 1) / block.y);
	time_t t = clock();
	addKernel << <grid, block>> > (dev_c, dev_a, dev_b, nx, ny);
	cudaDeviceSynchronize();
	double used = clock() - t;
	used = (double)used / CLOCKS_PER_SEC;
	printf("<<<(%d,%d), (%d,%d)>>> GPU used = %.3f\n", 
		grid.x, grid.y, block.x, block.y, used);
	cudaMemcpy(c, dev_c, nBytes, cudaMemcpyDeviceToHost);
	cudaFree(dev_c);
	cudaFree(dev_a);
	cudaFree(dev_b);
	cudaError_t status = cudaDeviceReset();
	return status;
}*/



