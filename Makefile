PROJECT = fourbeecpu

SRC_DIR = cpu
TARGET_DIR = target
TEST_DIR = tests

COMPILER = iverilog
COMPILER_FLAGS =

SIMULATOR = vvp
SIMULATOR_FLAGS =

TESTS = $(wildcard $(TEST_DIR)/*.v)
TARGETS = $(patsubst $(TEST_DIR)/%.v, $(TARGET_DIR)/%.vvp, $(TESTS))
SRC = $(wildcard $(SRC_DIR)/*.v)

all: compile simulate

compile:
	for test in $(TESTS); do \
		$(COMPILER) $(COMPILER_FLAGS) -o $(TARGET_DIR)/$$(basename $$test .v).vvp $$test $(SRC); \
	done

simulate:
	for target in $(TARGETS); do \
		$(SIMULATOR) $(SIMULATOR_FLAGS) $$target; \
	done

clean:
	rm -f $(TARGET_DIR)/*