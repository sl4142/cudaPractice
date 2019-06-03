/*#pragma once
#ifndef PAYOFF_H
#define PAYOFF_H

class PayOff
{
public:
	enum OptionType {call, put};
	PayOff(double Strike_, OptionType TheOptionType_);
	double operator()(double Spot) const;

private:
	double Strike;
	OptionType optionType;

};

#endif*/