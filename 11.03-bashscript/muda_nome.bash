#!/bin/bash
# renomeia

STRDE=$1
STRPARA=$2
for i in $(ls *$STRDE* ); do
    ORIGEM=$i
    DESTINO=$(echo $i | sed -e "s/$STRDE/$STRPARA/")
    mv $ORIGEM $DESTINO
done
