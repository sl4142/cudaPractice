#ifndef PAYOFF_H
#define PAYOFF_H

class PayOff
{
private:

public:
	PayOff(){}
	virtual ~PayOff() {}
	virtual double operator()(double S) const = 0;
};

class CallPayOff : public PayOff
{
private:
	double K;
public:
	CallPayOff(double K);
	virtual ~CallPayOff() {}
	virtual double operator() (double S) const;
};

class PutPayOff :public PayOff
{
private: 
	double K;

public:
	PutPayOff(double K);
	virtual ~PutPayOff() {}
	virtual double operator() (double S) const;
};

#endif