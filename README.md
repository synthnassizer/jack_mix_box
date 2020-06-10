# jack_mix_box
a no-gui jack volume client as extracted from jack_mixer project (stripped from any python config hooks)

## build ##
just run make

## dependencies ##
 - jack
 - glib-2.0
 - m(ath)
 - pcre (only for raspberry pi builds, you may remove it from the linker flags otherwise)
 - pkg-config (used to locate glib-2.0 across multiple archs)

### usage ###

jack_mix_box [ -n|--name <jack client name> ] [ -s|--stereo ] [ -v|--volume <initial vol> ] MIDI_CC_1 MIDI_CC_2

to print the current value of volume send a SIGUSR1 to the jack_mix_box process
