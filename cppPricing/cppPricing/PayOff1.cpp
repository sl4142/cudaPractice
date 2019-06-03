/*#include "PayOff1.h"
#include <minmax.h>

PayOff::PayOff(double Strike_, OptionType TheOptionType_):
	Strike(Strike_), optionType(TheOptionType_) {}

double PayOff::operator() (double spot) const
{
	switch (optionType)
	{
	case call: 
		return max(spot - Strike, 0);
	case put:
		return max(Strike - spot, 0);
	default:
		throw("Unknown option type\n");
	}
}*/