.global main
.text

main:
    push %rdi           # salva os registradores
    push %rsi           # que o puts estraga
    mov  (%rsi),%rdi    # o argumento a ser mostrado
    call puts           # imprime-o
    pop  %rsi           # restaura os registradores
    pop  %rdi
    
    add  $8,%rdi        # aponta para o próximo argumento
    dec  %rdi           # atualiza a quantidade de argumentos
    jnz  main           # se houver mais argumentos, continua
    ret  
