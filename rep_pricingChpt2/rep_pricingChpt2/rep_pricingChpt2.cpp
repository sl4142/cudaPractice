// rep_pricingChpt2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include "MC1.h"
#include <time.h>
using namespace std;

int main(int argc, char **argv)
{
	const double S = 100;
	const double K = 100;
	const double T = 1;
	const double vol = 0.2;
	const double r = 0.05;
	unsigned long numOfPath = 100000;
	PayOff callPayOff(K, PayOff::call);
	PayOff putPayOff(K, PayOff::put);
	PayOff binaryCallPayOff(K, PayOff::binaryCall);
	PayOff binaryPutPayOff(K, PayOff::binaryPut);

	time_t t = clock();
	double callPrice = MCPricer(callPayOff, S, T, vol, r, numOfPath);
	double putPrice = MCPricer(putPayOff, S, T, vol, r, numOfPath);
	double binaryCallPrice = MCPricer(binaryCallPayOff, S, T, vol, r, numOfPath);
	double binaryPutPrice = MCPricer(binaryPutPayOff, S, T, vol, r, numOfPath);
	double used = clock() - t;
	used = (double)used / CLOCKS_PER_SEC;
	cout << "Number of Paths = " << numOfPath << endl;
	cout << "Call Price = " << callPrice << endl;
	cout << "Put Price = " << putPrice << endl;
	cout << "Binary Call Price = " << binaryCallPrice << endl;
	cout << "Binary Put Price = " << binaryPutPrice << endl;
	cout << "Time used = " << used << endl;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
