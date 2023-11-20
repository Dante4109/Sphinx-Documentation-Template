#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Inspired by https://www.jetbrains.com/pycharm/guide/tutorials/sphinx_sites/setup/

import pathlib

from livereload import Server, shell

BUILD_COMMAND: str = "make.bat html"
SOURCEDIR: pathlib.Path = pathlib.Path("source")
BUILDDIR: pathlib.Path = pathlib.Path("build")


if __name__ == "__main__":
    server = Server()
    server.watch(str(SOURCEDIR / "*.rst"), shell(BUILD_COMMAND), delay=1)
    server.watch(str(SOURCEDIR / "*.md"), shell(BUILD_COMMAND), delay=1)
    server.watch(str(SOURCEDIR / "*.py"), shell(BUILD_COMMAND), delay=1)
    server.watch(str(SOURCEDIR / "_static/*"), shell(BUILD_COMMAND), delay=1)
    server.watch(str(SOURCEDIR / "_templates/*"), shell(BUILD_COMMAND), delay=1)
    server.serve(root=str(BUILDDIR / "html"))
