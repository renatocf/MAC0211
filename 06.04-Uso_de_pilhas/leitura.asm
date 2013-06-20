section .bss

caracter: RESW 1  ; aloca bytes na memória, apra o último caractere lido

section .text     ; corpo do programa

_start:

; Lê a sequência de caracteres terminados por ENTER e a armazena na
; pilha
; int read(int fd, void *buf, size_t count)
le:     mov ebx,STDIN
        mov ecx,caracter
        mov edx,1
        mov eax,3
        int 80h
        
        push word[caracter]
        inc word[count]
        
        cmp [caracter],byte 0Ah
        jne le

; Lê a sequência de caracteres terminada por ENTER e a armazena na pilha
; int write(int fd, coid *buf, size_t count);
esc:    mov word[caracter]      ; desempilha um caracter
        mov edx,1               ; terceiro parâmetro (tamanho da msg)
        mov ebx,STDOUT 
        mov ecx,caracter
        mov eax,4
        int 80h
    
        dec word[count]
        jnz esc
    
; void exit(int status)
        mov eax,1               ; número da chamada ao sistema (exit)
        mov ebx,0               ; primeiro argumento (cógido de saída)
        int 80h                 ; chamada ao SO
