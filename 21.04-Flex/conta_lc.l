/*  yyterminate() é uma função feita para terminar o analisador
    léxico. Ele, porém, não precisa ser definido, pois ele é 
    feito por padrão.
    
    No main, para chamarmos o analisador léxico, podemos usar
    yylex(), que é o nome padrão da função que contém o ana-
    lisador léxico.
    Podemos compilar o código usando:
        gcc lex.yy.c -o contlc -lfl
    O nome padrão do .c é lex.yy.c e precisamos da biblioteca
    fl para rodá-lo.
*/
%{
int contLinhas = 0, contCaracteres = 0;
%}

%%
\n      ++contLinhas; ++contCaracteres;
.       ++contCaracteres;
<<EOF>> yyterminate();

%%
int main() 
{
    yylex();
    printf("# linhas: %d, # caract. (incluindo '\\n') = %d\n",
        contLinhas, contCaracteres);
    
    return 0;
}
