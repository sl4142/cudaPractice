
#ifndef SIMPLEMC_H
#define SIMPLEMC_H
#include "PayOff2.h"

double SimpleMonteCarlo2(PayOff& payOff,
	double Expiry,
	double Spot,
	double Vol,
	double r,
	unsigned long numOfPath);
#endif
