#include<stdio.h>
#include<stdlib.h>

#define NTentativas 10

int main()
{
    int i;
    for(i = 0; i < NTentativas; i++)
    {
        if(rand() <= RAND_MAX/2)
            printf("Cara\n");
        else 
            printf("Coroa\n");
    }
    return 0;
}
