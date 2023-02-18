PROJECT = fourbeecpu

SRC_DIR = cpu
TARGET_DIR = target

COMPILER = iverilog
COMPILER_FLAGS =

SIMULATOR = vvp
SIMULATOR_FLAGS =

TARGET = $(TARGET_DIR)/$(PROJECT).vvp

SRC = $(wildcard $(SRC_DIR)/*.v)

all: compile simulate

compile:
	$(COMPILER) $(COMPILER_FLAGS) -o $(TARGET) $(SRC)

simulate:
	$(SIMULATOR) $(SIMULATOR_FLAGS) $(TARGET)

clean:
	rm -f $(TARGET_DIR)/*