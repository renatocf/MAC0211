global _start

section .data

section .bss
buffer: resb 256

section .text

; int read(int fd, void *buf, size_t count)
      MOV ebx,STDIN   ; primeiro parâmetro: descritor do arquivo
      MOV ecx,buffer  ; segundo parâmetro: ponteiro para o buffer
      mov edx,256     ; terceiro argumento: qtde de bytes a ser lido
      mov eax,3       ; número de chamadas do sistema (read)
      int 80h         ; chamada ao núcleo do SO
      
      mov ecx,0       ; contador

      ; Só verificamos caracteres no intervalo 'a' e 'z'

loop: mov bl,[buffer+ecx]
      cmp [bl],'a' 
      jb prox      ; menos ascii que 'a'
      cmp [bl],'z'
      ja prox      ; maior ascii que 'z'

prox: inc ecx
      cmp ecx,eax
      jb loop

; int write(int fd, const void *buf, size_t count);
    mov ebx,STDOUT  ; primeiro parâmetro: STDOUT
    mov ecx,buffer  ; segundo paramêtro: ponteiro para a msg de escrita
    mov edx,eax     ; terceiro parâmetro: tamanho da mensagem
    mov eax,4       ; número da chamada ao sistema (write)
    int 80h         ; chamada ao núcleo do SO

; exit... (encerrar o programa)
    mov eax,1       ; número da chamada ao sistema (exit)
    mov ebx,0       ; primeiro argumento: código de saída (sucesso)
    int 80h         ; chamada ao núcleo do SO
