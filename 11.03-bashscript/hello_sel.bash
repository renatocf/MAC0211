#!/bin/bash

OPCOES="Hello Sair"
select opt in $OPCOES; do
    if [ "$opt" == "Sair" ]; then
        break;
    elif [ "$opt" == "Hello" ]; then
        echo "Hello"
    else
        echo "Opcao desconhecida"
    fi
done
