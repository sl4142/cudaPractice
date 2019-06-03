#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*void initData(float *c, int size)
{
	time_t t;
	srand((unsigned)time(&t));
	for (int i = 0; i < size; i++)
	{
		c[i] = (rand() & 0xFF) / 10.0f;
	}
}

//sumMatrixOnHost
void sumMatrixOnHost(float *c, float *a, float *b, const int nx, const int ny)
{
	float *A = a;
	float *B = b;
	float *C = c;
	for (int iy = 0; iy < ny; iy++)
	{
		for (int ix = 0; ix < nx; ix++)
		{
			C[ix] = A[ix] + B[ix];
		}

		A += nx;
		B += nx;
		C += nx;
	}
}

// checkResult
void checkResult(const float *a, const float *b, const int size)
{
	double eps = 1.0E-8;
	for (int i = 0; i < size; i++)
	{
		if (abs(a[i] - b[i]) > eps)
		{
			printf("Results Not Match!\n");
			return;
		}
	}
	printf("Resutls Match!\n");
}

//cudaSumMatrix
cudaError_t cudaSumMatrix2D(float *c, const float *a, const float *b, const int nx, const int ny);

//sumKernel
__global__ void sumMatrixKernel(float *c, const float *a, const float *b, const int nx, const int ny)
{
	int ix = threadIdx.x + blockIdx.x * blockDim.x;
	int iy = threadIdx.y + blockIdx.y * blockDim.y;
	int idx = iy * nx + ix;
	if (ix < nx && iy < ny) c[idx] = a[idx] + b[idx];
}

//main
int main(int argc, char **argv)
{
	const int nx = 1 << 14, ny = 1 << 14;
	const int nxy = nx * ny;
	const int nBytes = nxy * sizeof(float);
	float *A = (float*)malloc(nBytes);
	float *B = (float*)malloc(nBytes);
	float *C = (float*)malloc(nBytes);
	float *gpuC = (float*)malloc(nBytes);
	printf("Started...\n");
	printf("Matrix %d x %d\n", nx, ny);
	time_t t = clock();
	initData(A, nxy);
	initData(B, nxy);
	double used = clock() - t;
	used = (double)used / CLOCKS_PER_SEC;
	printf("Initial Data used = %.3f\n", used);

	t = clock();
	sumMatrixOnHost(C, A, B, nx, ny);
	used = clock() - t;
	used = (double)used / CLOCKS_PER_SEC;
	printf("CPU used = %.3f\n", used);

	cudaSumMatrix2D(gpuC, A, B, nx, ny);
	checkResult(C, gpuC, nxy);
	free(A); free(B); free(C); free(gpuC);
	return 0;
}

cudaError_t cudaSumMatrix2D(float *c, const float *a, const float *b, const int nx, const int ny)
{
	cudaDeviceProp devProp;
	int dev = 0;
	cudaGetDeviceProperties(&devProp, dev);
	printf("Device %d: %s\n", dev, devProp.name);
	cudaSetDevice(dev);
	float *dev_a = 0, *dev_b = 0, *dev_c = 0;
	int nBytes = nx * ny * sizeof(float);
	cudaMalloc((void**)&dev_a, nBytes);
	cudaMalloc((void**)&dev_b, nBytes);
	cudaMalloc((void**)&dev_c, nBytes);

	cudaMemcpy(dev_a, a, nBytes, cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b, b, nBytes, cudaMemcpyHostToDevice);

	int dimx = 32, dimy = 32;
	dim3 block(dimx, dimy);
	dim3 grid((nx + block.x - 1) / block.x, (ny + block.y - 1) / block.y);
	time_t t = clock();
	sumMatrixKernel << <grid, block >> > (dev_c, dev_a, dev_b, nx, ny);
	cudaDeviceSynchronize();
	double used = clock() - t;
	used = (double)used / CLOCKS_PER_SEC;
	printf("GPU used = %.3f\n", used);
	cudaMemcpy(c, dev_c, nBytes, cudaMemcpyDeviceToHost);
	cudaFree(dev_a); cudaFree(dev_b); cudaFree(dev_c);
	cudaError_t status = cudaDeviceReset();
	return status;
}*/








