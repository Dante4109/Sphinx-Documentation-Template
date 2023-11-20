# Minimal makefile for Sphinx documentation
#

# Determine the absolute path where this Makefile resides.
# From: https://stackoverflow.com/a/73509979
ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help build clean publish server Makefile

build:
	@rm -rf "$(ROOT_DIR)build/" > /dev/null 2>&1
	@$(SPHINXBUILD) -M html "$(ROOT_DIR)$(SOURCEDIR)" "$(ROOT_DIR)$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean:
	@rm -rf "$(ROOT_DIR)build/" "$(ROOT_DIR)docs/" > /dev/null 2>&1

publish:
	@rm -rf "$(ROOT_DIR)build/" > /dev/null 2>&1
	@$(SPHINXBUILD) -M html "$(ROOT_DIR)$(SOURCEDIR)" "$(ROOT_DIR)$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@rm -rf "$(ROOT_DIR)docs/" > /dev/null 2>&1
	@cp -R "$(ROOT_DIR)build/html/" "$(ROOT_DIR)docs" > /dev/null 2>&1

server:
	@python "$(ROOT_DIR)run_livereload.py"

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(ROOT_DIR)$(SOURCEDIR)" "$(ROOT_DIR)$(BUILDDIR)" $(SPHINXOPTS) $(O)