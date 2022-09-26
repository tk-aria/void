# Makefile
# help:
#    all)
#    make --always-make
.DEFAULT_GOAL := help
MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

.PHONY: help
help:
	@echo "\n>> help [ command list ]"
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@grep -E '^.PHONY: [a-zA-Z_-]+.*?##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = " "}; {printf "\033[35m%-30s\033[32m %s\n", $$2, $$4}'
	@echo ""

.PHONY: clear ## [category]`description`.
clear:
	sh ./bin/scripts/clear.sh "./build"

.PHONY: git_init ## [category]`description`.
git_init:
	git submodule update --init --recursive

.PHONY: setup ## [category]`description`.
setup: git_init build

.PHONY: build ## [category]`description`.
build: clear
	mkdir build && cd build && \
	CC=/usr/lib/ccache/gcc CXX=/usr/lib/ccache/g++ cmake ../ -DCMAKE_BUILD_TYPE=Debug && ../bin/scripts/makerunner.sh

.PHONY: format ## [category]`description`.
format:
	clang-format -i \
		./**/*.cpp \
		./**/*.h \
		.*/**/*.cpp \
		.*/**/*.h
#	./**/*.hpp

.PHONY: lint ## [category]`description`.
lint:
	clang-tidy --fix-errors -p ./build -header-filter="/workspaces/naudio/include" ./src/**/*.cpp

.PHONY: docs ## [category]`description`.
docs:
	cd docs && doxygen

