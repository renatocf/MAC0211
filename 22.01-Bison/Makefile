# Calculadora em notação polonesa reversa (posfixa)
CC 	 := gcc
LEX  := flex
YACC := bison

CFLAGS  := -ansi -Wall -pedantic -Wno-unused-function
CFLAGS  += -Wno-implicit-function-declaration
LDFLAGS := -lfl -lm

all: %

%: %.yy.o %.tab.o
	$(CC) $^ -o $@ $(LDFLAGS)

%.yy.o: %.yy.c %.tab.c
	$(CC) $(CFLAGS) -c $<

%.tab.o: %.tab.c
	$(CC) $(CFLAGS) -c $<

%.yy.c: %.l %.tab.h
	$(LEX) -o $@ $<

%.tab.c: %.y
	$(YACC) --defines=$*.tab.h -o $@ $<

%.tab.h: %.y

clean: 
	rm -f *.o *.tab.*

# PADRÃO mais simples:

# CALCPR
# calcpr: calcpr.yy.o calcpr.tab.o
# 	$(CC) $^ -o $@ -lfl -lm
# 
# calcpr.yy.o: calcpr.yy.c calcpr.tab.c
# 	$(CC) -c $<
# 
# calcpr.tab.o: calcpr.tab.c
# 	$(CC) -c $<
# 
# calcpr.yy.c: calcpr.l calcpr.tab.h
# 	flex -o $@ $<
# 
# calcpr.tab.c calcpr.tab.h: calcpr.y
# 	bison --defines=calcpr.tab.h -o calcpr.tab.c calcpr.y
# 
# # CALC
# calc: calc.yy.o calc.tab.o
# 	$(CC) $^ -o $@ -lfl -lm
# 
# calc.yy.o: calc.yy.c calc.tab.c
# 	$(CC) -c $<
# 
# calc.tab.o: calc.tab.c
# 	$(CC) -c $<
# 
# calc.yy.c: calc.l calc.tab.h
# 	flex -o $@ $<
# 
# calc.tab.c calc.tab.h: calc.y
# 	bison --defines=calc.tab.h -o calc.tab.c calc.y
# 
# clean: 
# 	rm -f *.o *.tab.*
