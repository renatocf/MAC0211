global _start # exporta para o ligador (ld) o ponto de entrada

.text # local onde colocaremos os comandos
    .global _start: # é como o 'main' da função

    # sys_write(stdout, mensagem, tamanho)
    
    # Para eliminar as ambiguidades dos tamanhos dos 
    # montadores, existem alguns sufixos em comandos
    # como o MOV para representar qual o tamanho da 
    # mensagem. Este método difere do NASM, que usa
    # "casts" para isso: BYTE, WORD e DWORD
    
    movl $4, %eax         # Chamada de sistema sys_write
    movl $1, %ebx         # Stdout
    movl $mensagem, %ecx  # Endereço de mensagem
    movl $tamanho,  %edx  # Tamanho da string de mensagem
    int  $0x80            # Chamada ao núcleo (kernel)
                          # O código mostrado faz a interrupção
                          # e passa para o SO executá-lo.
    
    # sys_exit(return_code)
    
    movl $1, %eax         # Chamada do sistema sys_exit
    movl $0, %ebx         # Retorna 0 (sucess)
    int  $0x80            # Chamada do núcleo (kernel)

.data # auxílio do montador para facilitar a criação
      # de 'variáveis' (um endereço para a posição de
      # onde começará, na memória, a informação.
mensagem: 
    .ascii "Hello, World\n"  # mensagem e quebra de linha
    tamanho = . - mensagem   # tamanho da mensagem
