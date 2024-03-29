NAME := task_1_1

CC = gcc
CC_FLAGS = -Wall -Werror -Wpedantic -Wextra

SRC_FILES = main.c dummy_src_1.c dummy_src_2.c
INC_FILES = dummy.h
OBJ_FILES = main.o dummy_src_1.o dummy_src_2.o

all: $(NAME)

$(NAME): $(OBJ_FILES)
	$(CC) $(CC_FLAGS) $(OBJ_FILES) -I. -o $(NAME)

$(OBJ_FILES):$(SRC_FILES) $(INC_FILES)
	$(CC) $(CC_FLAGS) $(SRC_FILES) -I. -c

clean:
	rm -rf $(OBJ_FILES)

uninstall: clean
	rm -rf $(NAME)

.PHONY: all clean uninstall
