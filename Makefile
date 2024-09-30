# Makefile for KMeans Clustering Flask Application

# Variables
VENV_DIR = venv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip
FLASK_APP = app.py

# Default target
all: install run

# Create virtual environment
$(VENV_DIR):
    python3 -m venv $(VENV_DIR)

# Install dependencies
install: $(VENV_DIR)
    $(PIP) install -r requirements.txt

# Run the Flask application
run:
    FLASK_APP=$(FLASK_APP) $(PYTHON) -m flask run

# Clean up
clean:
    rm -rf $(VENV_DIR)
    find . -type f -name '*.pyc' -delete
    find . -type d -name '__pycache__' -delete

# Create requirements.txt
requirements.txt:
    $(PIP) freeze > requirements.txt

.PHONY: all install run clean requirements.txt