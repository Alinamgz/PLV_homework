#include <stdio.h>
#include <string.h>
#include "libcalc.h"

enum e_operation {
	SUM,
	DIFF,
	PRODUCTION,
	FRACTON,
	FACTORIAL,
	SQROOT,
	NONE
};

enum e_status {
	ERR_ARGS_NUM = -10,
	ERR_INVALID_OPERATION,
	ERR_INVALID_OPERAND,
	ERR_ZERO_DIVISION,
	ERR_FACTORIAL_OVERFLOW,
	ERR_NEGATIVE_SQRT,
	OK
};

typedef union u_result {
	int result_i;
	double result_d;
	long int result_l;
	unsigned long long int result_ull;
} rslt;

typedef struct s_parced_args {
	char operation;
	int numbers[2];
} parced_args;

int parce_args(int argc, char **argv, parced_args *pargs);
void handle_err(int err_code, char *app_name, char *err_cause);
