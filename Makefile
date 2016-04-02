# Base Makefile for project build.
#
# Author: Edson Alves (edsonalves@unb.br)
# Date: 22/03/2016

# Directories
SRC_DIR = src
OBJ_DIR = obj
LIB_DIR = lib
BIN_DIR = bin

# C++ compiler
CC = g++

# Flags, includes and libs
CFLAGS = -W -Wall -pedantic -std=c++11 -MMD -g3
INCLUDES = -Iinclude `sdl-config --cflags`
LIBS = `sdl-config --libs` -lpthread -lSDL_image -lSDL_ttf

# Game info
NAME = jtj
GAME = $(BIN_DIR)/$(NAME)

# Project sources and objects
SRC = ${wildcard $(SRC_DIR)/*.cpp}
OBJ = ${addprefix $(OBJ_DIR)/, ${notdir ${SRC:.cpp=.o}}} 

.PHONY: all clean depend

all:
	@mkdir -p $(OBJ_DIR) $(LIB_DIR) $(BIN_DIR)
	$(MAKE) $(GAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo Building $@
	@$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

$(GAME): $(OBJ)
	@echo Building $(NAME) ...
	@$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJ) $(LIBS)
	@echo --- Done

clean:
	@echo Cleaning...
	@rm -rf obj/ bin/ *~

-include $(OBJ:.o=.d)
