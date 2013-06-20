#include<stdio.h>

int soma(int,int);

void main()
{
    int x, y;
    x = 2;
    y = x++;
    printf("%d\n", soma(x,y++));
}
