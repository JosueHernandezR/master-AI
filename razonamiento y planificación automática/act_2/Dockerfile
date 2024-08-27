# Usar una imagen base de Ubuntu
FROM ubuntu:22.04

LABEL maintainer=""
LABEL version="1.0"
LABEL description="Esta imagen ejecuta un entorno de prueba de singularity"

# Establecer las variables de entorno
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar el sistema e instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libseccomp-dev \
    pkg-config \
    squashfs-tools \
    cryptsetup \
    wget \
    git \
    uuid-dev \
    libgpgme-dev \
    libseccomp-dev \
    libglib2.0-dev \
    libssl-dev \
    e2fsprogs \
    golang-go \
    python3 \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Definir la versión de Singularity que se va a instalar
ENV SINGULARITY_VERSION=3.8.6

# Descargar, compilar e instalar Singularity
RUN cd /tmp && \
    wget https://github.com/apptainer/singularity/releases/download/v${SINGULARITY_VERSION}/singularity-${SINGULARITY_VERSION}.tar.gz && \
    tar -xzf singularity-${SINGULARITY_VERSION}.tar.gz && \
    cd singularity-${SINGULARITY_VERSION} && \
    ./mconfig && \
    make -C builddir && \
    make -C builddir install && \
    cd / && \
    rm -rf /tmp/singularity-${SINGULARITY_VERSION} /tmp/singularity-${SINGULARITY_VERSION}.tar.gz

RUN apt-get update && apt-get install -y tzdata
ENV TZ=America/New_York
# Verificar la instalación de Singularity
RUN singularity --version

RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime

# Configurar el punto de entrada por defecto
ENTRYPOINT  ["/usr/local/actividad3/start.sh"]
