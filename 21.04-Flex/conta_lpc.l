%{
int contCaracter = 0, contPalavra = 0, contLinha = 0;
%}

EOL \n
PALAVRA [^ \n\t]+

%%
{PALAVRA} { contPalavra++, contCaracter += yyleng; }
{EOL}     { contCaracter++, contLinha++; }
.         { contCaracter++; }

%%
int main(int argc, char **argv)
{
    yyin = fopen(argv[1],"r"); /* Abre arquivo de entrada */
    yylex();                   /* Executa o scanner */
    printf("# linhas: %d, # palavras: %d, # caracteres: %d\n",
            contLinha, contPalavra, contCaracter);
    fclose(yyin);              /* Fecha o arquivo de entrada */
    
    return 0;
}
