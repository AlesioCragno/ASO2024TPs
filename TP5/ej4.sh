#!/bin/bash
#   4) Contador de Palabras: Escribe un script que lea un archivo de texto y cuente el
#      número de palabras, líneas y caracteres en el archivo.

echo "Ingrese un texto (presione Ctrl+D para finalizar):"
texto=$(cat)

num_palabras=$(echo "$texto" | wc -w)
num_lineas=$(echo "$texto" | wc -l)
num_caracteres=$(echo -n "$texto" | wc -m)

echo "El texto ingresado tiene:"
echo "- $num_palabras palabras."
echo "- $num_lineas líneas."
echo "- $num_caracteres caracteres."