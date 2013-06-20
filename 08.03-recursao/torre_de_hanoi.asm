; Torre de Hanoi
global main
extern printf

; segmento de dados
section .data

; mensagem é a cadeia de caracteres impressa para indicar cada mo-
; vimento quando este é processado. Por exemplo, para indicar um
; movimento de i para 3 faremos '1->3\n'
msg:    db      "%d -> %d",10.0

; algumas constatnes que indicam as posições dos parâmetros
n:      equ 8
origem: equ 12
dest:   equ 16
tem:    equ 20

main:
    ; Faz a chamada da funcao Hanoi
    push dword 3
    push dword 2
    push dword 1
    push dword 0
