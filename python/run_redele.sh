#!/bin/bash

# Shell script to run redele.py using the virtual environment
# Navigate to the script directory
cd "$(dirname "$0")"

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "Error: Virtual environment 'venv' not found in $(pwd)"
    echo "Please make sure the virtual environment is created first."
    exit 1
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Check if redele.py exists
if [ ! -f "redele.py" ]; then
    echo "Error: redele.py not found in $(pwd)"
    deactivate
    exit 1
fi

# Run redele.py with all passed arguments
echo "Running redele.py..."
python redele.py "$@"

# Store the exit code
exit_code=$?

# Deactivate the virtual environment
deactivate

# Exit with the same code as the Python script
exit $exit_code
