#include<stdio.h>
#include<stdlib.h>

#define NTentativas 10

int main()
{
    int i = 0;
    for(i = 0; i < NTentativas; i++)
        printf("O numero obtido foi: %d\n", LancaDado());
        
    return 0;
}

int LancaDado()
{
    /* Não podemos construir esse lançamento
     * usando o resto da divisão porque o ge-
     * rador de números aleatórios faz uma 
     * pseudo-aleatoriedade baseada no inter-
     * valo até RAND_MAX. Porém, ele não é fei-
     * to para construir números de faixas me-
     * nores como desejado (como números pares/
     * ímpares ou as classes do ℤ_6 */
    int r = rand();
    if(r < RAND_MAX/6)
        return (1);
    else if(r < RAND_MAX/6 * 2)
        return (2);
    else if(r < RAND_MAX/6 * 3)
        return (3);
    else if(r < RAND_MAX/6 * 4)
        return (4);
    else if(r < RAND_MAX/6 * 5)
        return (5);
    else if(r < RAND_MAX/6 * 6)
        return (6);
}
