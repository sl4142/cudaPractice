#pragma once
#ifndef MC1_H
#define MC1_H
#include "PayOff1.h"
#include "Random1.h"
double MCPricer(PayOff& payOff,
	const double S,
	const double T,
	const double vol,
	const double r,
	unsigned long numOfPath);

#endif
