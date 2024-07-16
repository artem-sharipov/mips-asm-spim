SPIM := spim
BASICS_DIR := basics
EXAMPLE_PROGRAMS := minimal hello procedure addition

all:
	@echo "Please specify the target (name of the example program)."
	@echo "Usage:"
	@echo "    make [example program name]"
	@echo "Usage example:"
	@echo "    make hello"
	@echo "Available example programs: $(EXAMPLE_PROGRAMS)"

minimal:
	@cd $(BASICS_DIR) && $(SPIM) -file $@.asm

hello:
	@cd $(BASICS_DIR) && $(SPIM) -file $@.asm

procedure:
	@cd $(BASICS_DIR) && $(SPIM) -file $@.asm

addition:
	@cd $(BASICS_DIR) && $(SPIM) -file $@.asm
