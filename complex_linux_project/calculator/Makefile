NAME := calculator
LIB_NAME := calc
LIB := lib$(LIB_NAME)

SRC_DIR := src
INC_DIR := inc
OBJ_DIR :=  obj

SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
INC_FILES := $(wildcard $(INC_DIR)/*.h)
OBJ_FILES := $(addprefix $(OBJ_DIR)/, $(notdir $(SRC_FILES:%.c=%.o)))

LIB_DIR := ./$(LIB)
LIB_INC_DIR := $(LIB_DIR)/$(INC_DIR)
LIB_FILE := $(addprefix $(LIB_DIR)/, $(addsuffix .a, $(LIB)))

RM := rm -rf
MKDIR := mkdir -p

CC := gcc
CC_FLAGS := -std=c11 -Wall -Werror -Wpedantic -Wextra

all: $(LIB_FILE) $(NAME)

$(LIB_FILE): $(LIB_DIR)
	$(MAKE) -sC $(LIB_DIR)

$(NAME): $(OBJ_FILES)
	$(CC) $(CC_FLAGS) $(OBJ_FILES) -L$(LIB_DIR) -l$(LIB_NAME) -o $@

$(OBJ_FILES): | $(OBJ_DIR)

$(OBJ_DIR):
	$(MKDIR) $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INC_FILES)
	$(CC) $(CC_FLAGS) -c $< -I $(INC_DIR) -I $(LIB_INC_DIR) -o $@

clean_lib: 
	$(MAKE) clean -C $(LIB_DIR)

clean: clean_lib
	$(RM) $(OBJ_DIR)

clean-all: clean
	$(RM) $(NAME)
	$(MAKE) clean-all -C $(LIB_DIR)

reinstall: clean-all all

.PHONY: all clean-lib clean clean-all libcalc reinstall
