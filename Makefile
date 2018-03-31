.PHONY : all clean libs

SHELL := /bin/sh
C_FILES := hello.c
H_FILES :=
CFLAGS := -g -Wall -Werror
LFLAGS := -g -Wall -Werror

all: libs $(C_FILES) $(H_FILES)
	gcc $(CFLAGS) $(C_FILES) -L. -Wl,-rpath=. -lhello -lgoodbye -o hello

libs: libhello.c libgoodbye.c
	gcc -fPIC --shared $(LFLAGS) libhello.c -o libhello.so
	gcc -c $(LFLAGS) libgoodbye.c  -o libgoodbye.o
	ar rcs libgoodbye.a libgoodbye.o
clean:
	rm -f hello
	rm -f *.o
	rm -f *.a
	rm -f *.so


