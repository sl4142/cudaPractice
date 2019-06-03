/*#include "SimpleMC.h"
#include <iostream>
using namespace std;

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

	PayOff callPayOff(S, PayOff::call);
	PayOff putPayOff(S, PayOff::put);

	double callPrice = SimpleMonteCarlo2(callPayOff, T, S, vol, r, numOfPath);
	double putPrice = SimpleMonteCarlo2(putPayOff, T, S, vol, r, numOfPath);
	cout << "The call price is " << callPrice << endl;
	cout << "The put price is " << putPrice << endl;
	
	return 0;


}*/