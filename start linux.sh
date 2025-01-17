#!/bin/bash

# Obtener la ruta del directorio del script
script_dir="$(dirname "$(realpath "$0")")"

# Comprobar si se están ejecutando como root
if [ "$EUID" -ne 0 ]; then
    echo "Que pasa mi loko?"
    echo "Esto aqui necesita un poco de arte, como una noche flamenca con farolillos torcidos."
    echo "Puedes hacerme el favor de darle al programa un toquecito de admin?"
    echo "No te me enfades cabesa!"
    echo ""
    echo "*************************************"
    echo "***       Desarrollado por        ***"
    echo "***           [Krieger]          ***"
    echo "*************************************"
    echo ""
    exit 1
fi

# Comprobar si los requirements están instalados
if [ ! -f "$script_dir/requirements.txt" ]; then
    echo "Archivo 'requirements.txt' no encontrado. Asegúrate de que está en la misma carpeta."
    exit 1
fi

# Instalar las dependencias con pip
echo "Instalando dependencias..."
pip install -r "$script_dir/requirements.txt"

# Comprobar si la instalación tuvo éxito
if [ $? -eq 0 ]; then
    # Ejecutar el archivo .py
    echo "Ejecutando el programa..."
    python "$script_dir/main.py"
else
    echo "Hubo un problema al instalar las dependencias. Por favor, verifica que pip está instalado."
fi
