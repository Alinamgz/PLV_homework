CC ?= gcc
CC_FLAGS ?= -Wall -Werror -Wextra -Wpedantic

dummy_2_src.o: dummy_2_src.c dummy.h
	$(CC) $(CC_FLAGS) -c $< -I. -o $@

.PHONY: dummy_2_src.o
