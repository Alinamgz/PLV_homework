#include <calculator.h>

static int parce_operation(char *operation_str, char *operation);
static int parce_number(char *number_str, int *number);

int parce_args(int argc, char **argv, parced_args *pargs) {
	int status = 0;

	if (argc != 3 && argc != 4) {
		handle_err(ERR_ARGS_NUM, argv[0], NULL);
		return(ERR_ARGS_NUM);
	}

	status = parce_operation(argv[1], &(pargs->operation));
	if (status != OK) {
		handle_err(status, argv[0], argv[1]);
	}

	for (int i = 0; argv[2 + i]; i++) {
		char *number_str = argv[2 + i];

		status = parce_number(number_str, &(pargs->numbers[i]));
		if (status != OK) {
			handle_err(status, argv[0], number_str);
		}
	}

	return status;
}

static int parce_operation(char *operation_str, char *operation) {
	char operations[] = {'+', '-', '*', '/', '!', '@', '\0'};
	int status = ERR_INVALID_OPERATION;

	if (strlen(operation_str) == 1) {
		for (int i = 0; operations[i]; i++) {
			if (operation_str[0] == operations[i]) {
				*operation = i;
				status = OK;
			}
		}
	}

	return status;
}

static int parce_number(char *number_str, int *number) {
	int status = ERR_INVALID_OPERAND;

	for (int i = 0; number_str[i]; i++) {
		char ch = number_str[i];

		if (IS_DIGIT(ch) == 0) {
			if (i != 0 && (ch != '+' || ch != '-')) {
				return ERR_INVALID_OPERAND;
			}
		}

		*number = calc_atoi(number_str);
		status = OK;
	}

	return status;
}
