#############################################################################
# Makefile for building: jackMixBox
#############################################################################

glibPath=

EXECUTABLE=jackMixBox
CC=gcc
DEFINES=
CFLAGS+=-Wall -Wextra -Wpedantic -g -O0 
LDFLAGS+=-lasound -ljack -lm -lglib-2.0
INCLUDES=$(shell pkg-config --cflags glib-2.0)
SOURCES= \
	jack_mix_box.c \
	jack_mixer.c \
	scale.c \
	log.c





OBJECTS=$(SOURCES:.c=.o)

.PHONY: all clean

all: $(SOURCES) $(EXECUTABLE)

log.o: log.c
	$(CC) -c $(CFLAGS) $(INCLUDES) -o "$@" "$<"

scale.o: scale.c
	$(CC) -c $(CFLAGS) $(INCLUDES) -o "$@" "$<"

jack_mixer.o: jack_mixer.c
	$(CC) -c $(CFLAGS) $(DEFINES) $(INCLUDES) -o "$@" "$<"

$(EXECUTABLE): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(CFLAGS) $(INCLUDES) $(LDFLAGS)

clean:
	$(RM) $(EXECUTABLE) $(OBJECTS) *.lo


