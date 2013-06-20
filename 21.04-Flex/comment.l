/* Remove comentários de código C */
%x comentario
%%
    int contLinhas = 1;

"/*" BEGIN(comentario);                  /* Habilita todas as 
                                            regras do grupo
                                            <COMENTARIO> */
<comentario>[^*\n]                       /* Consome tudo que 
                                            não é '*' */
<comentario>"*"+[^*/\n]                  /* Consome todos os * 
                                            não seguidos de '/'s */
<comentario>\n          ++   contLinhas;
<comentario>"*"+"/"     BEGIN(INITIAL);  /* Desabilita as regras 
                                            do grupo <comentario> */
