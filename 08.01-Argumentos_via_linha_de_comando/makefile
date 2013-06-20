CC=gcc
ARCH=32
CFLAGS=-m$(ARCH)

echo_32: echo_32.s
	$(CC) $(CFLAGS) $^ -o $@
	
GDB: echo_32.s
	$(CC) $(CFLAGS) $^ -g -o $@
