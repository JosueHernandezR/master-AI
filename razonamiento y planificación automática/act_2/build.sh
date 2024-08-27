#!/bin/bash

# Guardar el directorio actual
OLDDIR=$(pwd)

# Construir la imagen Docker
docker build -t image_with_singularity .

# Ejecutar el contenedor con privilegios y montar el directorio actual
docker run --privileged -v "$OLDDIR":/usr/local/actividad3 -it -u root --rm image_with_singularity

# Eliminar imágenes no usadas
docker image prune -f

# Eliminar la imagen creada
docker rmi image_with_singularity