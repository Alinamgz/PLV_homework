CC ?= gcc
CC_FLAGS ?= -Wall -Werror -Wextra -Wpedantic

dummy_1_src.o: dummy_1_src.c dummy.h
	$(CC) $(CC_FLAGS) -c $< -I. -o $@

.PHONY: dummy_1_src.o
