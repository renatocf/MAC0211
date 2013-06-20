CC  := gcc
RM  := rm -f
LEX := flex

CFLAGS  := -ansi -Wall 
LDFLAGS := -lfl

%: %.c
	$(CC) $(CFLAGS) $< -o $@.exe $(LDFLAGS)

%.c: %.l
	$(LEX) -o $@ $<

clean:
	$(RM) *.exe
