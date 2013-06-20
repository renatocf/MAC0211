#include<stdio.h>
#include<stdlib.h>
#include "random.h"

#define NTentativas 10

int LancaDado()
{
    return InteiroRandomico(1, 6);
}

int main()
{
    int i = 0;
    for(i = 0; i < NTentativas; i++)
        printf("O numero obtido foi: %d\n", LancaDado());
}
