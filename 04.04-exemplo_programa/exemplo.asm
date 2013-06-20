; Exemplo de programa:
      MOV ECX,0AH  ; ecx <- 10
      MOV EAX,ECX  ; eax <- 10
loop: ADD EAX,EAX  ; eax <- eax + eax
      DEC ECX      
      JNZ loop     ; repete 10 vezes
