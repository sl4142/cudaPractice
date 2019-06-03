#ifndef DOUBLEDIGITAL_H
#define DOUBLEDIGITAL_h
#include "PayOff.h"

class DoubleDigitalPayOff : public PayOff
{
private:
	double K1;
	double K2;

public:
	DoubleDigitalPayOff(double K1, double K2);
	virtual double operator() (double S) const;
	virtual ~DoubleDigitalPayOff() {}
};


#endif
