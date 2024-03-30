CC ?= gcc
CC_FLAGS ?= -Wall -Werror -Wextra -Wpedantic

dummy_3_src.o: dummy_3_src.c dummy.h
	$(CC) $(CC_FLAGS) -c $< -I. -o $@

.PHONY: dummy_3_src.o
