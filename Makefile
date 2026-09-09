UV ?= uv
ZENSICAL ?= $(UV) run zensical

.PHONY: all build run help

# Default target runs help to guide the user
all: help

## build: Build the documentation site
build:
	$(ZENSICAL) build

## run: Run the documentation site locally for development
run:
	$(ZENSICAL) serve

## help: Show this help screen
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/## //' | awk -F: '{printf "  %-15s %s\n", $$1, $$2}'
