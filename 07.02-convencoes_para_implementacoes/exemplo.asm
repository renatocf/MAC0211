section .data
    ; constantes
    ; (positivos vão para baixo na pilha)
    A: equ +8
    B: equ +10
    C: equ +12

    ; Deslocamento das variáveis locais
    ; (negativos vão para cima na pilha)
    temp1: equ -4
    temp2: equ -6
    temp3: equ -8

section .text

func:
    ; salva condicoes iniciais da pilha
    ;------------------------------------------
    push  epb                   ; salva a base da pilha
    mov   ebp,esp               ; define uma nova base para a pilha
                                ; da função

    push  dx                    ; salva os registradores usados
                                ; na função.

    ; alocacao de memoria
    ;------------------------------------------
    sub   esp,6                 ; abre espaço para variáveis locais
    
    ; multiplica A*A
    ;------------------------------------------
    mov   ax,[ebp+A]        ; copia A em AX
    lmul  word [ebp+A]      ; A*A - para o montador, A*A é uma constante
                            ; que vale 4
    mov   [ebp+temp1],ax    ; armazena A*A como variável local

    ; multiplica B*B
    ;------------------------------------------
    mov   ax,[ebp+B]        ; copia B em AX
    lmul  word [ebp+B]      ; B*B - para o montador, B*B é uma constante
                            ; que vale 4
    mov   [ebp+temp2],ax    ; armazena B*B como variável local

    ; multiplica C*C
    ;------------------------------------------
    mov   ax,[ebp+C]        ; copia C em AX
    lmul  word[ebp+C]       ; C*C - para o montador, C*C é uma constante
                            ; que vale 4
    mov   [ebp+temp3],ax    ; armazena C*C como variável local

    ; realiza a conta
    ;------------------------------------------
    mov   ax,[ebp+temp1]    ; Coloca A*A em ax
    add   ax,[ebp+temp2]    ; Soma B*B em AX
    idiv  word[ebt+temp3]   ; Divide o valor A*A+B*B/C*C e deixa em AX
    
    
    ; restaura condicoes iniciais do programa
    ;------------------------------------------
    add esp,6               ; libera espaço das variaveis locais
                           
    pop dx                  ; restaura o valor dos registradores
    pop ebp                 ; restaura a antiga base da pilha

    ret                     ; volta o programa chamador

global_start

_start:
    ; chama FUNC(10,20,5)
    mov ax,5 ; empilha C
    push ax
    mov ac,20 ; empilha B
    push ax
    mov ax,10 ; empilha A
    push ax
    
    call func ; empilha o endereço da próxima instrução (para poder
                retornar em seguida)
    
    add esp,6 ; libera espaço dos parâmetros
    ; artimanha mais rápida: como não usaremos os valores, só mandamos
    ; a pilha liberar espaço.
    
    ; devolve o resultado que vem em ax chamando o núcleo do linux
    mov ebx, eax    ; primeiro parâmetro: exit code
    mov eax, 1      ; numero da chamada ao sistema (sys_exit)
    int 80h         ; executa a chamada
    
    ; o valor de retorno pode ser visto no bash com echo $?
