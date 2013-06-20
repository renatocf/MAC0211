.intel_syntax noprefix 
# Diretiva para dizer que estamos usando a sintaxe da intel 
# Noprefix fala que não queremos usar os % em frente aos registradores
.global soma

param1 = 8
param2 = 12

x = -4

soma:

    push  ebp
    mov   ebp,esp 
    
    # salva registradores
    
    sub   esp,4
    
    mov   eax,[ebp+param1]
    add   eax,[ebp+param2]
    
    mov   [ebp+x], eax
    
    add   esp,4
    
    pop   ebp
    
    ret

