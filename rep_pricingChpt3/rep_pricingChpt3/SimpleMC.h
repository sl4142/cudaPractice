#ifndef SIMPLEMC_H
#define SIMPLEMC_H
#include "PayOff.h"

double MCPricer(
	PayOff& payOff,
	const double S,
	const double T,
	const double r,
	const double vol,
	unsigned long numOfPath);


#endif
