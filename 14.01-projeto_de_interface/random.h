#ifndef _random_h
#define _random_h

/* Função: InteitoRandomico 
 * Uso: n = InteiroRandomico(min, max);
 * ------------------------------------
 * Esta função devolve um inteiro aleató-
 * rio num intervalo fechado [min..max].
 */

int InteiroRandomico(int min, int max);

/* Função: RealRandomico
 * Uso: f = RealRandomico(min, max);
 * ------------------------------------
 * Esta função devolve um número real 
 * aleatório no intervalo semi-fechado 
 * [min..max), significando que o resul-
 * tado é sempre maior ou igual a min, 
 * mas estritamente menor a max */

int RealRandomico(int min, int max);

#endif
