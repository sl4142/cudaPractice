#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <stdlib.h>


__device__ float devData;

__global__ void checkGlobalVariable()
{
	printf("Device: %f\n", devData);
	devData += 2.0f;
}


int main(int argc, char **argv)
{

	float value = 3.14f;
	cudaMemcpyToSymbol(devData, &value, sizeof(float));
	printf("Host copied %f\n", value);
	checkGlobalVariable << <1, 1 >> > ();
	cudaMemcpyFromSymbol(&value, devData, sizeof(float));
	printf("Host changed %f\n", value);

	cudaDeviceReset();
	return EXIT_SUCCESS;

	printf("Hello\n");
}