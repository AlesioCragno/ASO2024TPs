#!/bin/bash
#6) Usar la API de weatherapi.com para obtener el clima actual de una ciudad.

claveApi="0ad765aa4ca944e5bf4222018242106" #clave
ciudad="$1" 

if [ -z "$ciudad" ]; then
    echo "Uso: $0 <ciudad>"
    exit 1
fi

url="http://api.weatherapi.com/v1/current.json?key=${claveApi}&q=${ciudad}"
respuesta=$(curl -s "${url}")

if [ $? -ne 0 ]; then
    echo "Error al obtener datos del clima."
    echo "En caso de ser una ciudad de mas de una palabra, colocar (_) en lugar de espacio. Ej: Buenos_Aires."
    exit 1
fi

#datos
nombre_ciudad=$(echo "${respuesta}" | jq -r '.location.name')
pais=$(echo "${respuesta}" | jq -r '.location.country')
temp_c=$(echo "${respuesta}" | jq -r '.current.temp_c')
condicion=$(echo "${respuesta}" | jq -r '.current.condition.text')

if [ -z "$nombre_ciudad" ]; then
    echo "Error: No se pudieron obtener datos de clima para la ciudad proporcionada."
    exit 1
fi

echo "Ciudad: ${nombre_ciudad}"
echo "País: ${pais}"
echo "Temperatura: ${temp_c}°C"
echo "Condición: ${condicion}"