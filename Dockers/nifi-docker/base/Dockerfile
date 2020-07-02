ARG ROOT_CONTAINER=ubuntu:focal-20200423@sha256:5747316366b8cc9e3021cd7286f42b2d6d81e3d743e2ab571f55bcd5df788cc8
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

LABEL maintainer="daniel.mcalleja@outlook.com"

#Instalamos wget, openjdk-8-jdk, openssh-server y net-tools
RUN apt-get update && UBUNTU_FRONTEND=noninteractive apt-get install -y less --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        wget \
        software-properties-common \
        openjdk-8-jdk \
        net-tools \
        iproute2 \
        iputils-ping \
        gpg-agent \
        nano

#Limpiar APT cuando termine
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Creamos directorio para mover los archivos
RUN mkdir -p /tmp

#Declaramos variables para instalación
ENV NIFI_VERSION 1.9.2
ENV NIFI_URL "http://archive.apache.org/dist/nifi/1.9.2/nifi-1.9.2-bin.tar.gz"
ENV NIFI_ASC_URL "http://archive.apache.org/dist/nifi/1.9.2/nifi-1.9.2-bin.tar.gz.asc"

#creamos las variables de entorno
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV NIFI_BASE_DIR=/opt/nifi
ENV NIFI_HOME=$NIFI_BASE_DIR/nifi-current
ENV NIFI_LOG_DIR=${NIFI_HOME}/logs
ENV PATH=$PATH:$JAVA_HOME/bin:$NIFI_HOME/bin
USER root

#Crear directorio
RUN mkdir -p $NIFI_HOME && \
    chmod a+x $NIFI_HOME


RUN wget https://dist.apache.org/repos/dist/release/nifi/KEYS
RUN gpg --import KEYS

#Descarga de nifi y despliegue
RUN set -x && \
	curl -fsSL "$NIFI_URL" -o /tmp/nifi-$NIFI_VERSION-bin.tar.gz && \
	curl -fsSL "$NIFI_ASC_URL" -o /tmp/nifi-$NIFI_VERSION-bin.tar.gz.asc && \
	gpg --verify /tmp/nifi-$NIFI_VERSION-bin.tar.gz.asc /tmp/nifi-$NIFI_VERSION-bin.tar.gz && \
	gpg --print-md SHA256 /tmp/nifi-$NIFI_VERSION-bin.tar.gz && \
	tar -xvf /tmp/nifi-$NIFI_VERSION-bin.tar.gz -C /tmp && \
	mv /tmp/nifi-$NIFI_VERSION/* $NIFI_HOME && \
        mkdir -p $NIFI_HOME/database_repository && \
	mkdir -p $NIFI_HOME/flowfile_repository && \
	mkdir -p $NIFI_HOME/content_repository && \
	mkdir -p $NIFI_HOME/provenance_repository && \
	mkdir -p $NIFI_HOME/state && \
	mkdir -p $NIFI_LOG_DIR && \
	mkdir -p data/templates && \
	mkdir -p $NIFI_HOME/conf/flow && \
	ln -s $NIFI_HOME ${NIFI_BASE_DIR}/nifi-$NIFI_VERSION && \
	rm /tmp/nifi-$NIFI_VERSION-bin.tar.gz* && \
	rm -rf /tmp/nifi-$NIFI_VERSION

VOLUME $NIFI_LOG_DIR \
       $NIFI_HOME/conf/archive \
       $NIFI_HOME/conf/templates \
       $NIFI_HOME/conf/flow \
       $NIFI_HOME/database_repository \
       $NIFI_HOME/flowfile_repository \
       $NIFI_HOME/content_repository \
       $NIFI_HOME/provenance_repository \
       $NIFI_HOME/state \
       data/store


#Copiamos el archivo de configuracion
#COPY ./conf/nifi.properties ${NIFI_BASE_DIR}/nifi-$NIFI_VERSION/conf/nifi.properties
COPY ./conf/nifi.properties $NIFI_HOME/conf/nifi.properties

EXPOSE 9999 9443 10443 11443 6342
RUN echo "DONE."

#Copiamos entrypoint
ADD run.sh /root/run.sh
RUN chown root:root /root/run.sh
RUN chmod a+x /root/run.sh



WORKDIR $NIFI_HOME


CMD ["/root/run.sh"]
