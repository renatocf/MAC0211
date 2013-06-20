; Podemos utilizar recursão também em programas em linguagem de 
; montagem:

fatorial:
    push ebp            ; define o stack frame
    mov  ebp,esp
    
    mov eax,[ebp+8]     ; obtem 'n'
    cmp eax,0           ; 'n' < 0 ?
    ja  continua        ; sim: continua
    mov eax,1           ; não: retorna 1
    jmp fim 
    
continua:               ; calcula fatorial de 'n-1'
    dec eax 
    push eax            ; fatorial(n-1)
    call fatorial 
    add esp,4           ; libera espaço do parâmetro
    
    mov ebx,[ebp+8]     ; obtem 'n'
    mul ebx             ; edx:eax = eax * ebx

fim: pop ebp            ; termina a função
     ret
