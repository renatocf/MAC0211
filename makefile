ASB=nasm
LIN=ld
ARC=32

%_nasm_gcc_32: %.asm
	nasm -f elf32 $<
	gcc %.o -o $@

%_nasm_ld_32: %.asm
