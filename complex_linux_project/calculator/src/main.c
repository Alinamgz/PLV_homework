#include "calculator.h"

int main(int argc, char **argv) {
	parced_args pargs;
	rslt rslt;
	int status = parce_args(argc, argv, &pargs);
	
	if (status != OK)
		return status;

	switch (pargs.operation) {
		case SUM:
			rslt.result_l = calc_sum(pargs.numbers[0], pargs.numbers[1]);
			printf("Result: %ld\n", rslt.result_l);
			break;

		case DIFF:
			rslt.result_l = calc_difference(pargs.numbers[0], pargs.numbers[1]);
			printf("Result: %ld\n", rslt.result_l);
			break;

		case PRODUCTION:
			rslt.result_l = calc_production(pargs.numbers[0], pargs.numbers[1]);
			printf("Result: %ld\n", rslt.result_l);
			break;

		case FRACTON:
			if (pargs.numbers[1] == 0) {
				handle_err(ERR_ZERO_DIVISION, argv[0], argv[3]);
				return ERR_ZERO_DIVISION;
			}
			rslt.result_d = calc_fraction(pargs.numbers[0], pargs.numbers[1]);
			printf("Result: %.6f\n", rslt.result_d);
			break;

		case FACTORIAL:
			if (pargs.numbers[0] > 20) {
				handle_err(ERR_FACTORIAL_OVERFLOW, argv[0], argv[2]);
				return ERR_FACTORIAL_OVERFLOW;
			}
			rslt.result_ull = calc_factorial(pargs.numbers[0]);
			printf("Result: %llu\n", rslt.result_ull);
			break;
		
		case SQROOT:
			if (pargs.numbers[0] < 0) {
				handle_err(ERR_NEGATIVE_SQRT, argv[0], argv[2]);
				break;
			}
			rslt.result_i = calc_sqroot(pargs.numbers[0]);
			printf("Result: %d\n", rslt.result_i);
			break;
		default:
			handle_err(ERR_INVALID_OPERATION, argv[0], argv[1]);
			break;
	}

	return 0;
}
