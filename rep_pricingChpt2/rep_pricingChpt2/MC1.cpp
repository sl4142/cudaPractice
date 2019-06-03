#include "MC1.h"
#include <cmath>;

double MCPricer(PayOff& payOff,
	const double S,
	const double T,
	const double vol,
	const double r,
	unsigned long numOfPath)
{
	double res = 0, var, rootVar, itoCorr, movedSpot, mean;
	var = vol * vol * T;
	rootVar = sqrt(var);
	itoCorr = -0.5 * var;
	movedSpot = S * exp(r*T + itoCorr);
	for (unsigned long i = 0; i < numOfPath; i++)
	{
		double curRan = getGaussianByBoxMuller();
		double curSpot = movedSpot * exp(rootVar * curRan);
		double curPayOff = payOff(curSpot);
		res += curPayOff;
	}
		mean = res / numOfPath;
		return mean * exp(-r * T);
}