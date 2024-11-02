##
## Makefile for MiniLibX in /home/boulon/work/c/raytraceur/minilibx
## 
## Made by Olivier Crouzet
## Login   <ol@epitech.net>
## 
## Started on  Tue Oct  5 15:56:43 2004 Olivier Crouzet
## Last update Tue May 15 15:44:41 2007 Olivier Crouzet
##

## Please use configure script

PREFIX ?= /usr/local

INSTALLED_FILES = \
	$(PREFIX)/lib/libmlx.a \
	$(PREFIX)/include/mlx.h \
	$(PREFIX)/share/man/man3/mlx.3 \
	$(PREFIX)/share/man/man3/mlx_loop.3 \
	$(PREFIX)/share/man/man3/mlx_new_image.3 \
	$(PREFIX)/share/man/man3/mlx_new_window.3 \
	$(PREFIX)/share/man/man3/mlx_pixel_put.3

.PHONY: all do_configure clean re install uninstall

all	: do_configure

do_configure	:
	./configure

clean	:
	./configure clean

re	: clean all

libmlx.a: all

install: libmlx.a mlx.h man/man3
	mkdir -p $(PREFIX)/lib
	cp libmlx.a $(PREFIX)/lib

	mkdir -p $(PREFIX)/include
	cp mlx.h $(PREFIX)/include

	mkdir -p $(PREFIX)/share/man/man3
	cp man/man3/* $(PREFIX)/share/man/man3

uninstall:
	rm -f $(INSTALLED_FILES)
