FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://downloads.mariadb.com/enterprise/vept-59y9/mariadb-maxscale/latest/ubuntu `lsb_release -cs` main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8167EE24 && \
    apt-get update && \
    apt-get -yq upgrade && \
    apt-get -y install maxscale

COPY maxscale.cnf /etc/maxscale.cnf  

# Start MaxScale
CMD ["/usr/bin/maxscale","--nodaemon"]    