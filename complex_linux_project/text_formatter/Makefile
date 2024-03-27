LIB_NAME := convert
TEST_APP := main

SRC_DIR := ./src
INC_DIR := ./inc
OBJ_DIR := ./obj
INSTALL_DIR := /usr/lib

SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
INC_FILES := $(wildcard $(INC_DIR)/*.h)
OBJ_FILES := $(addprefix $(OBJ_DIR)/, $(notdir $(SRC_FILES:%.c=%.o)))
LIB_FILE := lib$(LIB_NAME).so
TEST_SRC := $(TEST_APP).c

RM := rm -rf
MKDIR := mkdir -p

CC := gcc
CC_FLAGS := -std=c11 -Wall -Werror -Wpedantic -Wextra -fPIC

all: lib test

lib: $(LIB_FILE)

test: $(TEST_APP)

$(LIB_FILE): $(OBJ_FILES)
	gcc --shared $(OBJ_FILES) -o $(LIB_FILE)

$(OBJ_FILES): | $(OBJ_DIR)

$(OBJ_DIR):
	$(MKDIR) $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INC_FILES)
	$(CC) $(CC_FLAGS) -c $< -I $(INC_DIR) -o $@

$(TEST_APP): $(TEST_SRC) $(INC_FILES)
	$(CC) $(CC_FLAGS)  $(TEST_SRC) -I $(INC_DIR) -l$(LIB_NAME) -o $(TEST_APP)

install: $(LIB_FILE)
	sudo cp $(LIB_FILE) $(INSTALL_DIR)
	sudo chmod 0755 $(INSTALL_DIR)/$(LIB_FILE)
	sudo ldconfig

clean:
	$(RM) $(OBJ_DIR)

clean-all: clean
	$(RM) $(TEST_APP) $(LIB_FILE)

uninstall: clean-all
	sudo $(RM) $(INSTALL_DIR)/$(LIB_FILE)

reinstall: uninstall install

retest: reinstall test

.PHONY: all lib test install clean clean-all uninstall reinstall retest
