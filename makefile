# @file Makefile
# @author 12225126
# @date 26.11.2021

CC = gcc
DEFS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_SVID_SOURCE -D_POSIX_C_SOURCE=200809L 
CFLAGS = -Wall -g -std=c99 -pedantic $(DEFS)
LDFLAGS = -pthread -lrt 
OBJECTS = server.o client.o

.PHONY: all clean

all: server client

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

server: server.o
	$(CC) -o server server.o $(LDFLAGS)

client: client.o
	$(CC) -o client client.o $(LDFLAGS)

server.o: server.c 
client.o: client.c

clean:
	rm -rf *.o server client