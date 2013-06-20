global main    ; no gcc, o rotulo de entrada padrao e o main
extern printf

section .text

main:
    push  dword[nmum]  ; 2º param: um inteiro
    push  dword msg    ; 1º param: ponteiro para string
    call  printf       ; chamada da funcao printf
    add   esp,8        ; libera espaco dos parametros
    ret   

section .data
    msg: DB 'Esse numero ->%d<- deveria ser 1234.',10,0
    nmum: DD 1234
    
