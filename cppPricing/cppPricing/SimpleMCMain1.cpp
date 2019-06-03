/*#include "Random1.h"
//#include "pch.h"
#include <iostream>
#include <cmath>
using namespace std;

double simpleMonteCarlo1(double T, double K, double S, double vol, double r, unsigned long numOfPath)
{
	double var = vol * vol * T;
	double rootVar = sqrt(var);
	double itoCorrection = -0.5 * var;
	double movedSpot = S * exp(r*T + itoCorrection);
	double thisSpot;
	double runningSum = 0;
	for (unsigned long i = 0; i < numOfPath; i++)
	{
		double thisGaussian = GetOneGaussianByBoxMuller();
		thisSpot = movedSpot * exp(rootVar * thisGaussian);
		double curPayoff = thisSpot - K;
		curPayoff = curPayoff > 0 ? curPayoff : 0;
		cout << curPayoff << " " << thisSpot << endl;
		runningSum += curPayoff;
	}
	double mean = runningSum / numOfPath;
	mean *= exp(-r * T);
	return mean;
}



int main(int argc, char **argv)
{
	double T, K, S, vol, r;
	unsigned long numOfPath;
	cout << "\nEnter T\n"; 
	cin >> T;
	cout << "Enter S\n";
	cin >> S;
	cout << "Enter K\n";
	cin >> K;
	cout << "Enter vol\n";
	cin >> vol;
	cout << "Enter r\n";
	cin >> r;
	cout << "Enter numOfPath\n";
	cin >> numOfPath;

	double result = simpleMonteCarlo1(T, K, S, vol, r, numOfPath);
	cout << "The price is " << result << endl;
	return 0;

}*/