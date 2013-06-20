#!/bin/bash

CONTADOR=0
echo "While: "
while [ $CONTADOR -lt 10 ]; do
    echo "Vale $CONTADOR"
    let CONTADOR=CONTADOR+1
done

echo "Until: "
until [ $CONTADOR -lt 0 ]; do
    echo "Vale $CONTADOR"
    let CONTADOR=CONTADOR-1
done
