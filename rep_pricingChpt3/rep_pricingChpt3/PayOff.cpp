#include "PayOff.h"
#include <minmax.h>

CallPayOff::CallPayOff(double K): K(K) {}

double CallPayOff::operator()(double S) const
{
	return max(S - K, 0);
}

PutPayOff::PutPayOff(double K): K(K) {}

double PutPayOff::operator()(double S) const
{
	return max(K - S, 0);
}