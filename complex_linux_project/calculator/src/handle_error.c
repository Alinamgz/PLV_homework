#include "calculator.h"

static void usage(char *app_name);

void handle_err(int err_code, char *app_name, char *err_cause) {
	switch(err_code) {
		case ERR_ARGS_NUM:
			printf("\nERROR: invalid number of arguments\n");
			break;

		case ERR_INVALID_OPERATION:
			printf("\nERROR: invalid operation \"%s\"\n", err_cause);
			break;

		case ERR_INVALID_OPERAND:
			printf("\nERROR: invalid operand \"%s\"\n", err_cause);
			break;

		case ERR_ZERO_DIVISION:
			printf("\nERROR: Can't devide by zero.Invalid operand \"%s\"\n", err_cause);
			break;

		case ERR_FACTORIAL_OVERFLOW:
			printf("\nERROR: Can't find factorial of \"%s\" because it's bigger than max unsigned long long int\n", err_cause);
			break;

		case ERR_NEGATIVE_SQRT:
			printf("\nERROR: Can't find square root of negative number \"%s\"\n", err_cause);
			break;

		default: 
			printf("\nUnknown ERROR\n");
			break;
	}

	usage(app_name);
}

static void usage(char *app_name) {
	printf("\nUsage: \n"
		   "$: %s <operation> <operand_1> [operand_2]\n"
		   "-------------------------------------------\n\n"
		   "Operations:\n"
		   "+  -> Summ.\t\tRequires 2 operands\n"
		   "-  -> Difference.\tRequires 2 operands\n\n"
		   "*  -> Multiplication (production).\tRequires 2 operands\n"
		   "/  -> Division (fraction).\t\tRequires 2 operands\n\n"
		   "!  -> Factorial.\tRequires 1 operand. NB: max alloved aperand is 20\n"
		   "@  -> Square root.\tRequires 1 operand\n\n"
		   "-------------------------------------------\n"
		   "Examples:\n"
		   "$: %s - 32 10\n"
		   "  22\n\n"
		   "$: %s @ 121\n"
		   "  11\n"
		   "-------------------------------------------\n",
		   app_name, app_name, app_name);
}
