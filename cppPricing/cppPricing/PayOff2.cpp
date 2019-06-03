#include "PayOff2.h"
#include <minmax.h>

PayOffCall::PayOffCall(double K): K(K) {}

PayOffPut::PayOffPut(double K): K(K) {}

double PayOffCall::operator() (double S) const
{
	return max(S - K, 0);
}

double PayOffPut::operator() (double S) const
{
	return max(K - S, 0);
}