all: fuse_hello

fuse_hello: hello.c
	gcc -Wall hello.c `pkg-config fuse --cflags --libs` -o hello

test: fuse_hello
	mkdir ./dir_hello
	ls -la ./dir_hello
	./hello ./dir_hello
	ls -la ./dir_hello
	cat ./dir_hello/hello
	fusermount -u ./dir_hello
	rmdir ./dir_hello

clean:
	rm hello