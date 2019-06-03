#include "PayOff1.h"
#include <minmax.h>

PayOff::PayOff(double K, OptionType optionType): K(K), optionType(optionType){}

double PayOff::operator()(double S) const
{
	switch (optionType)
	{
	case call:
		return max(S - K, 0);
	case put:
		return max(K - S, 0);
	case binaryCall:
		return (S > K) ? 1 : 0;
	case binaryPut:
		return (S < K) ? 1 : 0;
	default:
		throw("Unknown option type\n");
	}
}