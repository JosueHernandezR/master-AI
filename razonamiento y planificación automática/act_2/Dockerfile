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
    autoconf \
    automake \
    build-essential \
    libtool \
    uuid-dev \
    libgpgme-dev \
    libseccomp-dev \
    pkg-config \
    squashfs-tools \
    cryptsetup \
    wget \
    git \
    fuse \
    libfuse-dev \
    zlib1g-dev \
    libglib2.0-dev \
    libssl-dev \
    e2fsprogs \
    python3 \
    python3-pip \
    libarchive-dev \
    dh-autoreconf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Definir la versión de Singularity que se va a instalar
ENV SINGULARITY_VERSION=4.1.5

# Crear un directorio de trabajo
WORKDIR /tmp

# Descargar e instalar Go manualmente
ENV GO_VERSION=1.21.1
RUN wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

# Establecer el PATH para Go
ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=/root/go

# Descargar Singularity
RUN wget -v https://github.com/sylabs/singularity/releases/download/v${SINGULARITY_VERSION}/singularity-ce-${SINGULARITY_VERSION}.tar.gz

# Extraer el paquete tar de Singularity
RUN tar -xzf singularity-ce-${SINGULARITY_VERSION}.tar.gz

# Cambiar al directorio de Singularity
WORKDIR /tmp/singularity-ce-${SINGULARITY_VERSION}

# Configurar Singularity
RUN ./mconfig

# Compilar Singularity
RUN make -C builddir

# Instalar Singularity
RUN make -C builddir install

# Establecer la zona horaria
RUN apt-get update && apt-get install -y tzdata
ENV TZ=America/New_York

# Verificar la instalación de Singularity
RUN singularity --version

# Enlazar la zona horaria
RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime

# Configurar el punto de entrada por defecto
ENTRYPOINT ["/usr/local/actividad3/start.sh"]
