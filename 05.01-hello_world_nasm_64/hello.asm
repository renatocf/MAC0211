global _start ; exporta para o ligador (ld) o ponto de entrada

section .text ; local onde colocaremos os comandos
_start: ; é como o 'main' da função

    ; sys_write(stdout, mensagem, tamanho)
    
    mov rax, 1          ; Chamada de sistema sys_write
    mov rbx, 1          ; Stdout
    mov rcx, mensagem   ; Endereço de mensagem
    mov rdx, tamanho    ; Tamanho da string de mensagem
    syscall             ; Chamada ao núcleo (kernel)
                        ; O código mostrado faz a interrupção
                        ; e passa para o SO executá-lo.
    
    ; sys_exit(return_code)
    
    mov rax, 60         ; Chamada do sistema sys_exit
    mov rbx, 0          ; Retorna 0 (sucess)
    syscall             ; Chamada do núcleo (kernel)
                        ; Difere da anterior porque tem uma função
                        ; própria para ela.

section .data ; auxílio do montador para facilitar a criação
              ; de 'variáveis' (um endereço para a posição de
              ; onde começará, na memória, a informação.
mensagem: db 'Hello, World',0x0A    ; mensagem e quebra de linha
tamanho: equ $ - mensagem           ; tamanho da mensagem
