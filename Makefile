CC = gcc
CFLAGS = -g -Wall -Wpedantic

SOURCE_DIR = source
INCLUDE_DIR = include
BIN_DIR = bin

SRCS = $(wildcard $(SOURCE_DIR)/*.c)
HDRS = $(wildcard $(INCLUDE_DIR)/*.h)
OBJS = $(patsubst $(SOURCE_DIR)/%.c, $(BIN_DIR)/%.o, $(SRCS))

BIN = $(BIN_DIR)/assembler

all: $(BIN)

release: CFLAGS = -O2 -DNDEBUG -Wall -Wpedantic
release: clean
release: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(BIN_DIR)/%.o: $(SOURCE_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) -r $(BIN_DIR)/*