# Makefile for myfaba-hacks project

# Default target
.DEFAULT_GOAL := help

# Variables
PYTHON_DIR = python
SCRIPT_NAME = run_redele.sh

# Help target - shows available commands
help:
	@echo "Available commands:"
	@echo "  make run [ARGS='...']  - Run redele.py with optional arguments"
	@echo "  make setup             - Set up virtual environment and install dependencies"
	@echo "  make clean             - Clean up virtual environment"
	@echo "  make help              - Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make run"
	@echo "  make run ARGS='--help'"
	@echo "  make run ARGS='encrypt /path/to/folder'"
	@echo "  make run ARGS='decrypt /path/to/folder'"
	@echo "  make run ARGS='remove-intro /path/to/folder'"

# Run the redele.py script using the shell script
run:
	@cd $(PYTHON_DIR) && ./$(SCRIPT_NAME) $(ARGS)

# Set up the virtual environment and install dependencies
setup:
	@echo "Setting up virtual environment..."
	@cd $(PYTHON_DIR) && python3 -m venv venv
	@echo "Activating virtual environment and installing dependencies..."
	@cd $(PYTHON_DIR) && source venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt
	@echo "Making shell script executable..."
	@cd $(PYTHON_DIR) && chmod +x $(SCRIPT_NAME)
	@echo "Setup complete! You can now use 'make run' to launch the application."

# Clean up the virtual environment
clean:
	@echo "Removing virtual environment..."
	@rm -rf $(PYTHON_DIR)/venv
	@echo "Virtual environment removed."

# Mark targets as phony (not file targets)
.PHONY: help run setup clean
