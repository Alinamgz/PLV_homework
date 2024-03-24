#pragma once

#define IS_DIGIT(c) (c >= '0' && c <= '9')
#define IS_SPACE(c) (c == 32 || (c >=  9 && c <= 13))
/*
* white space chars : 
* '' space; 32
* \t horisontal tab;9
* \n newline;10
* \v vertical tab;11
* \f from feed;12
* \r carrige return; 13
*/

int calc_atoi(const char *str);
int calc_sum(int arg_1, int arg_2);
int calc_difference(int arg_1, int atg_2);
int calc_product(int arg_1, int arg_2);
float calc_fraction(int arg_1, int arg_2);
long calc_factorial(int arg);
int calc_sqroot(int arg);
