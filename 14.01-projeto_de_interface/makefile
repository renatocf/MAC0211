## ARQUIVOS ###########################################################
SRC := testadado_com_interface.c
OBJ := $(SRC:.c = .o)
LIB := random.c
EXE := testadado

## COMANDOS/FLAGS #####################################################
CC     := gcc
CFLAGS := -ansi -Wall -pedantic

AR     := ar
ARFLAGS:= -rcv

RM     := rm -f

LIBS   := $(patsubst %.c,lib%.a,$(LIB))
LDLIBS := $(patsubst lib%.a,-l%,$(LIBS))
LDFLAGS:= -static -L.

## REGRAS #############################################################
$(EXE): $(OBJ) | $(LIBS)
	$(CC) $^ $(LDFLAGS) $(LDLIBS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $<

%.a: %.o 
	$(AR) $(ARFLAGS) $@ $<

.PHONY: clean
clean:
	$(RM) *.o ~*
