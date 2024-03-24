NAME := libcalc.a

SRC_DIR := ./src
INC_DIR := ./inc
OBJ_DIR := ./obj

SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
INC_FILES := $(wildcard $(INC_DIR)/*.h)
OBJ_FILES := $(addprefix $(OBJ_DIR)/, $(notdir $(SRC_FILES:%.c=%.o)))

RM := rm -rf
MKDIR := mkdir -p

CC := gcc
CC_FLAGS := -std=c11 -Wall -Werror -Wpedantic -Wextra

all: $(NAME)

$(NAME): $(OBJ_FILES)
	ar rcs $(NAME) $(OBJ_FILES)

$(OBJ_FILES): | $(OBJ_DIR)

$(OBJ_DIR):
	$(MKDIR) $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INC_FILES)
	$(CC) $(CC_FLAGS) -c $< -I $(INC_DIR) -o $@

clean:
	$(RM) $(OBJ_DIR)

clean-all: clean
	$(RM) $(NAME)

.PHONY: all clean clean-all
