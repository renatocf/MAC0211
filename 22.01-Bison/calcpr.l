/* Calculadora em notação polonesa reversa*/

%{
    #include "calcpr.tab.h"
    /* Incluirá um arquivo gerado pelo Bison.
     * Ele é útil porque permite que entendamos os 
     * signos usados. */
%}

%%

[0-9]*\.?[0-9]+ { sscanf(yytext, "%ld", (long int *) &yylval); return NUM; 
                  /* Definimos a expressão regular para o 
                     analisador léxico, mas queremos usá-lo
                     para atribuir o valor semântico, Este valor
                     é colocado em yylval. O retorno mostra 
                     qual o tipo de arquivo de variável para
                     quem o estiver usando. */
                }
[ \t]*          {;}
                  /* Como não há nada associado a espaços/tabulações,
                     nenhuma ação é realizada */
.|\n            { return yytext[0]; 
                  /* Qualquer coisa que não for espaço ou número
                     será retornado para ser identificado como 
                     ele mesmo para o local. Quem deverá tratar
                     isso é o usuário do analisador. */
                }

%%
