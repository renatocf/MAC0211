/* Calculadora em notação polonesa reversa (posfixa) */

%{
    /* Inlui as bibliotecas usadas na definição */
    #include <math.h>
    #include <stdio.h>
    
    /* especifica que os tipos dos valores semânticos
       serão sempre double */
    #define YYSTYPE double
%}

/* O tipo NUM precisará ser definido por um ANALISADOR 
 * SINTÁTICO. Isso será feito pelo FLEX (mas também pode
 * ser feito pelo próprio programador manualmente.
 * Precisamos, porém, chamar a função de yylex e passar
 * a variável pela yytext */
%token NUM /* Símbolo terminal NUM */

%%

entrada: /* vazio */
        | entrada linha ;

linha: '\n'         /* Aceita uma linha em branco, mas a 
                       ignora já que não há ação definida */
        | exp '\n' { printf("RES = %f\n", $1);
                     /* $1 é o valor semantico da expressão */
                     printf("Entre com uma nova expressão> "); }

/* Determinando o significado semântico, por meio de expressões
 * para que falamos o operadores. $$ é o significado semântico.
 * Por padrão, ele é $$ = $1, o valor do primeiro argumento. Ve-
 * remos, no programa seguinte, como tratar preferências */
;

exp: NUM            { $$ = $1;                      }
     | exp exp '+'  { $$ = $1 + $2;                 }
     | exp exp '-'  { $$ = $1 - $2;                 }
     | exp exp '*'  { $$ = $1 * $2;                 }
     | exp exp '/'  { $$ = $1 / $2;                 }
     | exp exp '^'  { $$ = pow($1,$2);              }
     | exp 'n'      { $$ = -$1;                     }
;
%%

int main(void)
{
    printf("CALCULADORA POLONESA\n");
    printf("Entre com uma expressão:\n");
    yyparse();
    
    return 0;
}

int yyerror(char *s) {
    printf("Ohhhh: %s\n", s);
    return 0;
}
