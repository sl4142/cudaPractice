#ifndef PAYOFF1_H
#define PAYOFF1_H

class PayOff
{
public:
	enum OptionType { call, put, binaryCall, binaryPut};
	PayOff(double K, OptionType optionType);
	double operator()(double S) const;

private:
	OptionType optionType;
	double K;
};

#endif

