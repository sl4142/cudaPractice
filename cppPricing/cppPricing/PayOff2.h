#ifndef PAYOFF2_H
#define PAYOFF2_H

class PayOff
{
public:
	PayOff(){};
	virtual double operator() (double S) const = 0;
	virtual ~PayOff() {}

private:
};

class PayOffCall : public PayOff
{
public:
	PayOffCall(double K);
	virtual double operator() (double S) const;
	virtual ~PayOffCall() {};
private:
	double K;
};

class PayOffPut : public PayOff
{
public:
	PayOffPut(double K);
	virtual double operator()(double S) const;
	virtual ~PayOffPut() {};
private:
	double K;
};

#endif

