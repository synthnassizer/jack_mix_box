#############################################################################
# Makefile for building: jackMixBox
#############################################################################

EXECUTABLE=jackMixBox
DEFINES=
CFLAGS+=-Wall -Wextra -Wpedantic -g -O2 
LDFLAGS+=-lasound -ljack -lm -lglib-2.0 -lpcre
INCLUDES=$(shell pkg-config --cflags glib-2.0)
SOURCES= \
	jack_mix_box.c \
	jack_mixer.c \
	scale.c \
	log.c





OBJECTS=$(SOURCES:.c=.o)

.PHONY: all clean

all: $(SOURCES) $(EXECUTABLE)

log.o: log.c log.h
	$(CC) -c $(CFLAGS) $(INCLUDES) -o "$@" "$<"

scale.o: scale.c scale.h
	$(CC) -c $(CFLAGS) $(INCLUDES) -o "$@" "$<"

jack_mixer.o: jack_mixer.c jack_mixer.h scale.h log.h
	$(CC) -c $(CFLAGS) $(DEFINES) $(INCLUDES) -o "$@" "$<"

$(EXECUTABLE): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(CFLAGS) $(INCLUDES) $(LDFLAGS)

clean:
	$(RM) $(EXECUTABLE) $(OBJECTS) *.lo


