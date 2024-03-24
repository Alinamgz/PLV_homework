#include <stdio.h>
#include <stdint.h>
#include <limits.h>
#include "libcalc.h"

int calc_atoi(const char *str) {
    unsigned long long n = 0;
    int i = 0;
    int ch = 1;

    for (; IS_SPACE(str[i]); i++);

    if (str[i] == '+' || str[i] == '-') {
        if (str[i] == '-')
            ch = -1;
        i++;
    }

    for (; IS_DIGIT(str[i]); i++) {
        if (ch == -1 &&
            ((n > -(LONG_MIN / 10)) ||
             ((n == -(LONG_MIN / 10)) && (str[i] - 48 > -(LONG_MIN % 10)))))
            return 0;
        if ((n > (LONG_MAX / 10)) ||
            ((n == (LONG_MAX / 10)) && str[i] - 48 > LONG_MAX % 10 && ch != -1))
            return -1;

        n = n * 10 + str[i] - 48;
    }

    return ch * n;
}
