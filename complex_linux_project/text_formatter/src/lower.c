#include <stdio.h>
#include "convert.h"

char *to_lower(char *buf, int max_len) {
	printf("Input your string for conversion to LOWER case.\n" \
		   "Note: max len is %d symbols\n\n"
		   " <<: ", (max_len - 1));

	fgets(buf, max_len, stdin);
	buf[max_len] = '\0';

	for(int i = 0; buf[i]; i++) {
		char cur_char = buf[i];

		if(IS_UPPER(cur_char)) {
			buf[i] = cur_char - ('A' - 'a');
		}
	}
	
	return buf;
}
