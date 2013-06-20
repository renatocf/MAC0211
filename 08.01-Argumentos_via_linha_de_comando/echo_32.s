.global main
.text

main:
    movl 4(%esp),%ecx   # ecx <- argc
    movl 8(%esp),%ebx   # ebx <- argv
    
mostra:
    pushl %ecx      # salva os registradores 
    pushl %ebx      
    pushl (%ebx)    # a string argumento a ser mostrada
                    # (%ebx) é o CONTEÚDO do que é arma-
                    # zenado no endereço.
    call  puts      # imprime-a
    addl  $4,%esp   # libera o espaço dos args na pilha
    popl  %ebx      # recupera os registradores
    popl  %ecx      
    
    addl  $4,%ebx   # aponta para o próximo argumento
    decl  %ecx      # atualiza a quantidade de argumentos a mostrar
    jnz   mostra    # se ainda houver argumentos, continua
    
    ret
