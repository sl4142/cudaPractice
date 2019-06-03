#include "DoubleDigital.h"
#include <minmax.h>

DoubleDigitalPayOff::DoubleDigitalPayOff(double K1, double K2): K1(K1), K2(K2) {}

double DoubleDigitalPayOff::operator() (double S) const
{
	if (S <= K1 || S >= K2)
		return 0;
	else
		return 1;
}