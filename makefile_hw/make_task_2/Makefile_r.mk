leaNAME = task_2
SRC_NAME = dummy

CC = gcc
CC_FLAGS = -Wall -Werror -Wpedantic -Wextra

MAIN_SRC = main.c
MAIN_OBJ = $(MAIN_SRC:%.c=%.o)
DUMMY_SRC = $(wildcard $(SRC_NAME)*.c)
DUMMY_OBJ =  $(DUMMY_SRC:%.c=%.o)
# DUMMY_OBJ =  $(SRC_NAME)*.o
INC = dummy.h

RM = rm -rf

Y = \033[1;93m
D = \033[0m

all: $(NAME) 

print:
	printf "\n$(Y)CC = $(CC)$(D)\n"
	printf "\n$(Y)MAIN_OBJ = $(MAIN_OBJ)$(D)\n"
	printf "\n$(Y)DUMMY_SRC = $(DUMMY_SRC)$(D)\n"
	printf "\n$(Y)DUMMY_OBJ = $(DUMMY_OBJ)$(D)\n"
	# printf "\n$(Y)CC = $(CC)$(D)\n"

$(NAME): $(MAIN_OBJ) $(DUMMY_OBJ) $(INC)
	@printf "have to build $(NAME)\n"
	$(CC) $(CC_FLAGS) -I. $(MAIN_OBJ) $(DUMMY_OBJ) -o $@
	@printf "\n"

$(MAIN_OBJ): $(MAIN_SRC) $(INC)
	# @printf "\n"
	# $(MAKE) -f Makefile_dummy_1.mk
	# @printf "\n"
	# $(MAKE) -f Makefile_dummy_2.mk
	# @printf "\n"
	# $(MAKE) -f Makefile_dummy_3.mk
	# @printf "\n"
	$(CC) $(CC_FLAGS) -c $< -I. -o $@

$(DUMMY_OBJ):
	@printf "\n"
	$(MAKE) -f Makefile_dummy_1.mk
	@printf "\n"
	$(MAKE) -f Makefile_dummy_2.mk
	@printf "\n"
	$(MAKE) -f Makefile_dummy_3.mk

clean:
	$(MAKE) clean -f Makefile_dummy_1.mk
	@printf "\n"
	$(MAKE) clean -f Makefile_dummy_2.mk
	@printf "\n"
	$(MAKE) clean -f Makefile_dummy_3.mk
	@printf "\n"
	$(RM) $(MAIN_OBJ)
	@printf "\n"

uninstall: clean
	$(RM) $(NAME)

.PHONY: all clean uninstall
