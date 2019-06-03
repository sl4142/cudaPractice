#include "SimpleMC.h"
#include "Random.h"
#include <cmath>
#include <cstdlib>

double MCPricer(
	PayOff& payOff,
	const double S,
	const double T,
	const double r,
	const double vol,
	unsigned long numOfPath)
{
	double var = vol * vol * T;
	double rootVar = sqrt(var);
	double itoCorr = -0.5 * var;
	double movedSpot = S * exp(r * T + itoCorr);
	double res = 0, thisSpot, curPayOff;
	for (unsigned long i = 0; i < numOfPath; i++)
	{
		double curRan = getGaussianBoxMuller();
		thisSpot = movedSpot * exp(rootVar * curRan);
		curPayOff = payOff(thisSpot);
		res += curPayOff;
	}

	double mean = res / numOfPath;
	return mean * exp(-r * T);
}