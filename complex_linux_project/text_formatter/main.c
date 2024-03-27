#include <stdio.h>
#include "convert.h"

int main(void) {
	char string[64] = "";
	
	printf("-------------------------------------------\n");
	to_upper(string, sizeof(string));
	printf(" :>> %s\n", string);
	printf("-------------------------------------------\n");

	to_lower(string, sizeof(string));
	printf(" :>> %s\n", string);
	printf("-------------------------------------------\n");
	
	return 0;
}
