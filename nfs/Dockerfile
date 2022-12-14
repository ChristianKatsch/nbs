ARG VERSION=latest
FROM tr069_dhcp_client:${VERSION}

ARG VERSION=latest

LABEL maintainer=Christian.Katsch@devolo.de

# Specify the user which should be used to execute all commands below
USER root

# store container version
RUN echo "nfs ${VERSION}" >> /etc/container-version

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get -y upgrade && apt-get install -y --fix-missing \
    	    nfs-kernel-server

# Expose the nfs ports
EXPOSE 111
EXPOSE 2049
EXPOSE 111/udp
EXPOSE 2049/udp

RUN apt-get update && apt-get -y upgrade && apt-get install -y --fix-missing \
    	    tftpd-hpa
COPY inserts/tftpd-hpa /etc/default
RUN mkdir /tftpboot && chmod 1777 /tftpboot

# Expose the TFTP port
EXPOSE 69/udp


COPY inserts/bin/* /docker-entrypoint.d/

ENTRYPOINT ["docker-entrypoint.sh"]
