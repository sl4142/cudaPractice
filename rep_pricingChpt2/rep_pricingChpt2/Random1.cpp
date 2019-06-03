#include "Random1.h"
#include <cmath>
#include <cstdlib>
using namespace std;

double getGaussianByBoxMuller()
{
	double res, x, y, s;
	do
	{
		x = 2.0 * rand() / static_cast<double>(RAND_MAX) - 1;
		y = 2.0 * rand() / static_cast<double>(RAND_MAX) - 1;
		s = x * x + y * y;
	} while (s >= 1.0);
	
	res = x * sqrt(-2.0 * log(s) / s);
	return res;
}