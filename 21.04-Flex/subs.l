/* Gera um programa que substitui cadeias delimitadas por 
aspas pela palavra 'string' */

/* Declaração de uma condição de início para regras exclusivas */
%x STRING

%%
\"  {
        printf( "string");
        /* habilita todas as regras que começam com <STRING> */
        BEGIN(STRING)
    }

<STRING>[^"]  ; /* nenhuma ação p/ um caracter <> aspas */
<STRING>\"    {
                  /* Desabilita a condição de início da string */
                  BEGIN(INITIAL)
              }

