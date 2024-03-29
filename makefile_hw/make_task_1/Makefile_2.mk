NAME := task_1_2

CC = gcc
CC_FLAGS = -Wall -Werror -Wpedantic -Wextra

INC_FILES = dummy.h

MAIN_SRC = main.c 
DUMMY_1_SRC = dummy_src_1.c
DUMMY_2_SRC = dummy_src_2.c

MAIN_OBJ = main.o
DUMMY_1_OBJ = dummy_src_1.o
DUMMY_2_OBJ = dummy_src_2.o

all: $(NAME)

$(NAME): $(MAIN_OBJ) $(DUMMY_1_OBJ) $(DUMMY_2_OBJ)
	$(CC) $(CC_FLAGS) $(MAIN_OBJ) $(DUMMY_1_OBJ) $(DUMMY_2_OBJ) -I. -o $(NAME)

$(MAIN_OBJ): $(MAIN_SRC) $(INC_FILES)
	$(CC) $(CC_FLAGS) $(MAIN_SRC) -I. -c

$(DUMMY_1_OBJ): $(DUMMY_1_SRC) $(INC_FILES)
	$(CC) $(CC_FLAGS) $(DUMMY_1_SRC) -I. -c

$(DUMMY_2_OBJ): $(DUMMY_2_SRC) $(INC_FILES)
	$(CC) $(CC_FLAGS) $(DUMMY_2_SRC) -I. -c

clean:
	rm -rf $(MAIN_OBJ) $(DUMMY_1_OBJ) $(DUMMY_2_OBJ)

uninstall: clean
	rm -rf $(NAME)

.PHONY: all clean uninstall
