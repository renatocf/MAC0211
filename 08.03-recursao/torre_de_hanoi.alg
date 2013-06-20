Torre de Hanoi - algoritmo

procedimento Hanoi (N, Orig, Dest, Tempp)
    se N = 0 então
        não faça nada; // base da recursão!
    senão
        Hanoi(N-1, Orig, Temp, Dest);
        mover o N-ésimo menos disco de org para Dest
        Hanoi(
