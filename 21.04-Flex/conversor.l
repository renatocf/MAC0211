/* COnversor de real para dolar */
/* O primeiro argumento do programa é a taxa de conversão */
/* O programa converte valores monetários com prefizo R$ para US$.
 * Os milhares devem estar deparados por '.' e os centavos por ','.
 * Isso não vale para o argumento do programa
 */

%{
#include <math.h>
#include <monetary.h>

double taxa = 1.5;
double valor = 0.;

void converte(double d)
{
    char b[2048];
    /* A função strfmon colocará em b a versão em string
       do número d/taxa, não ocupando mais que 2048 bytes */
    strfmon(b,2048,"%!n",d/taxa);
    printf("US$%s", b);
}
%}

MILHAR  [[:digit:]]{3}
VAL     -?[[:digit:]][[:digit:]]?[[:digit:]]?
CENT    [[:digit:]]{2}

SEP [[:space:]]*

%s VALOR MEIO

%%

R[$]{SEP} BEGIN(VALOR) ;

<VALOR>{VAL} {
                valor = atof(yytext);
                BEGIN(MEIO);
                /* Se encontrar o separador R$, começa a buscar
                   por valores, como em "R$ 2.555.128,00". Ele
                   tenta ler o máximo de dígitos possível, e só
                   pega o número '2'. Quando isso acontece, ele
                   vai para a variável pré-definida yytext que
                   é transformado para um float. Em sequiga, ha-
                   bilitamos a condição de início 'MEIO' */
             }
<MEIO>[.]{MILHAR} {
                    valor *= 1000;
                    valor += atof(++yytext);
                    /* Com 'MEIO' habilitado, caímos na regra 
                       para milhares. Em 'valor', já tinhamos 
                       2. O que fazemos é transformá-lo em '2000'
                       (com o *1000) e depois somamos a próxima
                       sequência. Entretanto, fazemos ++ no yytext
                       para saltar o '.' que também estava armaze-
                       nado e continuamos somando. O valor fica
                       '2555'. A ação se repete para '128', e 
                       valor == 2555128 */
                  }
<MEIO,VALOR>[,]{CENT} {
                        valor += atof(++yytext)/100;
                        converte(valor);
                        valor = 0;
                        BEGIN(INITIAL);
                        /* Depois dos milhares, chegamos a números
                           após a vírgula. Para cada uma, especifi-
                           camos 'CENT' (que tem 2 dígitos - sempre
                           devem se 2, mesmo que sejam 00). Para 
                           somar, incrementamos yytext para saltar
                           a ',', convertemos o valor convertivo por
                           100 (para serem os centavos) e colocamos
                           em valor. Depois, já fazemos a função 
                           'converte' e retornamos às condições 
                           iniciais  */
                      }
<VALOR,MEIO>. {
                converte(valor);
                valor = 0;
                BEGIN(INITIAL);
                /* Se encontrarmos qualquer outra coisa que não
                   case com o número, como letras, espaços, etc,
                   ele já faz a conversão e zera o valor, voltando,
                   em seguida, às condições iniciais. */   
              }
