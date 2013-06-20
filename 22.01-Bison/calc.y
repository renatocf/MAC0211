/* Calculadora infixa */

%{
    /* Inlui as bibliotecas usadas na definição */
    #include <math.h>
    #include <stdio.h>
    
    /* especifica que os tipos dos valores semânticos
       serão sempre double */
    #define YYSTYPE double
%}

/*%union{*/
/*    /*  Esta union funcionará como a union de C:*/
/*        ela armazena o tamanho da maior variável.*/
/*        Esta é uma forma de, em linguagens forte-*/
/*        mente tipadas como C, criar variáveis es-*/
/*        táticas que funcionam como tipos de tamanho*/
/*        variável. Nesse caso, estas tags poderão*/
/*        ser usadas para determinar o tamanho das*/
/*        variáveis */
/*    */
/*    double val;*/
/*    char * str;*/
/*}*/

/* Declarações do Bison */
%token NUM /* <val> NUM 
              Tamanho, em bytes, para um certo tipo */
/*%type  exp /* Valor de expressão como binário */
%left  '-' '+'
%left  '*' '/'
%left  NEG
%right '^'

/* As palavras reservadas como %left e %right definem
   as regras de associatividade. A ordem deles, de ci-
   ma para baixo, define a precedência (acima é maior) */

%%

input: /*empty*/
        | input line
;

line: '\n'
    | exp '\n'   { printf("%.10g\n", $1); }
    | error '\n' { yyerrok; }
    
    /*  O símbolo 'error' é usado para poder
        fazer o caso de tratamento de erros */
;

exp: NUM                 { $$ = $1;          }
    | exp '+' exp        { $$ = $1 + $3;     }
    | exp '-' exp        { $$ = $1 - $3;     }
    | exp '*' exp        { $$ = $1 * $3;     }
    | exp '/' exp        { $$ = $1 / $3;     }
    | '-' exp %prec NEG  { $$ = -$2;         }
    | exp '^' exp        { $$ = pow($1,$3);  }
    | '(' exp ')'        { $$ = $2;          }
    
/*  No exemplo acima, definimos NEG como um operador
    artificial, apenas para usá-lo como precedência.
    Na linha, mandamos '-' exp %prec NEG, pois ele
    faz com que '-' tenha precedência de NEG, apesar
    de ter o mesmo símbolo do operador binário '-' */
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
