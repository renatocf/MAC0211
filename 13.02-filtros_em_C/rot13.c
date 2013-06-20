#include<stdio.h>

/* CIFRA DE CÉSAR
 *
 * Consiste de um algoritmo de encriptação extremamante
 * simples que se utiliza de uma movimentação do alfabe-
 * to para a direita ou para a esquerda em um certo nú-
 * mero de posições. Para desencriptar, fazemos o pro-
 * cesso inverso. */

/* Filtro que encripta um stream de texto com o ROT13.
 * O ROT13 é uma forma de cifra de César que utiliza 
 * uma rotação de 13 caracteres (metade do alfabeto)
 * que independe se ele será rotacionado à esquerda ou
 * à direita. É um algoritmo muito simples. */
int main()
{
    int c;
    while((c = getchar()) != EOF)
    {
        if(c >= 'a' && c <= 'z')
            c = 'a' + (c -'a'+ 13) % 26;
        if(c >= 'A' && c <= 'Z')
            c = 'A' + (c-'A'+13) % 26;
        
        putchar(c);
    }
    return 0;
}
