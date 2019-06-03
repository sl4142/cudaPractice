/*#include "cuda_runtime.h";
#include "device_launch_parameters.h";
#include <stdio.h>

__global__ void helloGPU(void) {
	printf("Hello from GPU\n");
}

int main(void) {
	printf("Hello from CPU\n");
	helloGPU <<<1,10>>>();
	cudaDeviceReset();
	return 0;
}*/