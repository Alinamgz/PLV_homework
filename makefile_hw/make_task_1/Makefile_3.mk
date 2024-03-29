NAME := task_1_3

CC = gcc
CC_FLAGS = -Wall -Werror -Wpedantic -Wextra

INC_FILES = dummy.h

MAIN_SRC = main.c 
SRC_FILES = $(wildcard *.c)
OBJ_FILES = $(SRC_FILES:%.c=%.o)

all: $(NAME)

$(NAME): $(OBJ_FILES)
	$(CC) $(CC_FLAGS) $(OBJ_FILES) -I. -o $@

%.o: %.c $(INC_FILES)
	$(CC) $(CC_FLAGS) -c $< -I. -o $@

clean:
	rm -rf $(OBJ_FILES)

uninstall: clean
	rm -rf $(NAME)

.PHONY: all clean uninstall
