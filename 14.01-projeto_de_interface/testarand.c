#include<stdio.h>
#include<stdlib.h>

#define NTentativas 10

int main()
{
    int i, r;
    
    printf("Neste computador, RAND_MAX = %d.\n", RAND_MAX); 
    printf("Eis o resultado de %d chamadas a rand:\n", NTentativas);
    for(i = 0; i < NTentativas; i++)
    {
        r = rand(); printf("%10d\n", r);
    }
    return 0;
}
