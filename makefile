#############################################################################
# Makefile for building: jackMixBox
#############################################################################

EXECUTABLE=jackMixBox
CC=gcc
DEFINES=-DHAVE_JACK_MIDI
CFLAGS+=-Wall -Wextra -Wpedantic -g -O0 
LDFLAGS+=-lasound -ljack -lm -lglib-2.0
INCLUDES=-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I /usr/include/glib-2.0 -I /usr/include 
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


