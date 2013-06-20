global _start ; exporta para o ligador (ld) o ponto de entrada

section .text ; local onde colocaremos os comandos
_start: ; é como o 'main' da função

    ; sys_write(stdout, mensagem, tamanho)
    
    mov eax, 4          ; Chamada de sistema sys_write
    mov ebx, 1          ; Stdout
    mov ecx, mensagem   ; Endereço de mensagem
    mov edx, tamanho    ; Tamanho da string de mensagem
    int 80h             ; Chamada ao núcleo (kernel)
                        ; O código mostrado faz a interrupção
                        ; e passa para o SO executá-lo.
    
    ; sys_exit(return_code)
    
    mov eax, 1          ; Chamada do sistema sys_exit
    mov ebx, 0          ; Retorna 0 (sucess)
    int 80h             ; Chamada do núcleo (kernel)

section .data ; auxílio do montador para facilitar a criação
              ; de 'variáveis' (um endereço para a posição de
              ; onde começará, na memória, a informação.
mensagem: db 'Hello, World',0x0A    ; mensagem e quebra de linha
tamanho: equ $ - mensagem           ; tamanho da mensagem
