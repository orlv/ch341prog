PREFIX=/usr/local
CC=gcc
CFLAGS=-c -std=gnu99 -Wall -I$(PREFIX)/include
LDFLAGS=-L$(PREFIX)/lib -lusb-1.0
SOURCES=ch341a.c main.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=ch341prog


all: $(OBJECTS) $(EXECUTABLE)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

clean:
	rm -f  $(OBJECTS) $(EXECUTABLE)

.PHONY: clean

install: all
	install -m 0755 $(EXECUTABLE) $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/$(EXECUTABLE)
