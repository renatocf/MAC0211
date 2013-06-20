#!/bin/bash
HELLO=Hello

function fhello 
{
    local HELLO=World
    echo $HELLO
}
echo $HELLO         # deve mostrar 'Hello'
fhello              # chama fhello, que deve mostrar "World"
echo $HELLO         # deve mostrar "HEllo" novamente
