#include "libcalc.h"

unsigned long long int calc_factorial(int arg) {
	unsigned long long int rslt = 1;

	for (int i = 1; i <= arg; i++) {
		rslt *= i;
	}

	return rslt;
}
