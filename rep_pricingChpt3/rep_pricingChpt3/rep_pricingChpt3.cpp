// rep_pricingChpt3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "SimpleMC.h"
#include "DoubleDigital.h"
#include <iostream>
using namespace std;
int main()
{
	double K = 100;
	double S = 100; 
	double T = 1;
	double r = 0.05;
	double vol = 0.2;
	unsigned long numOfPath = 10000;
	CallPayOff callPayOff(K);
	PutPayOff putPayOff(K);
	DoubleDigitalPayOff ddPayOff(100, 200);

	double callPrice = MCPricer(callPayOff, S, T, r, vol, numOfPath);
	double putPrice = MCPricer(putPayOff, S, T, r, vol, numOfPath);
	double ddPrice = MCPricer(ddPayOff, S, T, r, vol, numOfPath);
	cout << "Call Price = " << callPrice << endl;
	cout << "Put Price = " << putPrice << endl;
	cout << "Double Digital Price = " << ddPrice << endl;
	return 0;
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
