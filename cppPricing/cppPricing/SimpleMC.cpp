#include "SimpleMC.h"
#include <cmath>
#include "Random1.h"

double SimpleMonteCarlo2(PayOff& payOff,
	double expiry,
	double spot,
	double vol,
	double r,
	unsigned long numOfPath)
{
	double var = vol * vol * expiry;
	double rootVar = sqrt(var);
	double itoCorr = -0.5 * var;
	double movedSpot = spot * exp(r * expiry + itoCorr);
	double thisSpot, res = 0;

	for (unsigned long i = 0; i < numOfPath; i++)
	{
		double curRan = GetOneGaussianByBoxMuller();
		thisSpot = movedSpot * exp(rootVar * curRan);
		double curPayOff = payOff(thisSpot);
		res += curPayOff;
	}
	res *= exp(-r * expiry);
	return res / numOfPath;
}
