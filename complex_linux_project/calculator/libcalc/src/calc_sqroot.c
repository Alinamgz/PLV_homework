#include <limits.h>
#include "libcalc.h"

int calc_sqroot(int arg) {
	int left = 0;
	int right = USHRT_MAX;
	int middle = 0;
	long int power;

	if (arg < 0) {
		return -1;
	}

	while (left <= right) {
		middle = left + (right - left) / 2;
		power = middle * middle;

		if (power > (long int)arg) {
			right = middle - 1;
		} else if (power < (long int)arg) {
			left = middle + 1;
		} else {
			return middle;
		}
	}
	return 0;
}
