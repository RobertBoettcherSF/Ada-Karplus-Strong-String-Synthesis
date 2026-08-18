.PHONY: all test clean

GNAT = gnatmake
OBJ_DIR = obj
BIN_DIR = bin

all: $(BIN_DIR)/tests

$(BIN_DIR)/tests: tests.adb karplus_strong.adb karplus_strong.ads ks.gpr
	mkdir -p $(OBJ_DIR) $(BIN_DIR)$(GNAT) -P ks.gpr -p

test: all
	@echo "Running verification & validation tests..."
	@./$(BIN_DIR)/tests

clean:
	rm -rf $(OBJ_DIR)/*$(BIN_DIR)/*
	rmdir $(OBJ_DIR)$(BIN_DIR) 2>/dev/null || true
