NAME = task_2

CC ?= gcc
CC_FLAGS ?= -Wall -Werror -Wextra -Wpedantic

RM = rm -rf
SRC_FILES = $(wildcard *.c)
OBJ_FILES = $(SRC_FILES:%.c=%.o)
INC_FILE = dummy.h

all: $(NAME)

$(NAME): $(OBJ_FILES) $(INC_FILE)
	@printf "obj files: $(OBJ_FILES)"
	$(CC) $(CC_FLAGS) $^ -I. -o $@

include Makefile_dummy_1.mk
include Makefile_dummy_2.mk
include Makefile_dummy_3.mk

main.o: main.c $(INC_FILE)
	$(CC) $(CC_FLAGS) -c $< -I. -o $@

clean:
	$(RM) *.o

uninstall: clean
	$(RM) $(NAME)

.PHONY: all clean uninstall main.o

