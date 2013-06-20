#include <stdlib.h>

/* Esta funcção primeiro obtém um inteiro aleatório
 * no intervalo [0..RAND_MAX] e depois converte-o 
 * em um número no intervalo [min..max] aplicando 
 * os seguintes passos:
 * (1) Gera um número real entre 0 e 1;
 * (2) Escala-o para o tamanho apropriado do intervalo;
 * (3) Trunca o valor para um inteiro;
 * (4) Traduz para o ponto de início apropriado.
 */

int InteiroRandomico(int min, int max)
{
    int k;
    double d;
    
    /* Usamos RAND_MAX+1 para representar a quan-
     * tidade de números, no lugar do total de nú-
     * meros */
    d = (double) rand() / ((double) RAND_MAX + 1);
    k = (int) (d * (max-min + 1));
    return (min + k);
}

/* Função: RealRandomico
 * ----------------------
 * A implementação de RealRandomico é similar a do
 * Inteiro Randômico, sem o passo da truncagem.
 */

int RealRandomico(int min, int max)
{
    double d;
    
    /* Usamos RAND_MAX+1 para representar a quan-
     * tidade de números, no lugar do total de nú-
     * meros */
    d = (double) rand() / ((double) RAND_MAX + 1);
    return (min + d*(max-min));
    /* Não precisamos colocar o '+1' na soma porque
     * o RAND_MAX não está criando um intervalo fe-
     * chado, mas sim um semi-aberto. */
}
