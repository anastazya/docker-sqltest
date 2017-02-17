FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb [arch=amd64] http://downloads.mariadb.com/software/MaxScale/maxscale/DEB `lsb_release -cs` main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8167EE24 && \
    apt-get update && \
    apt-get -yq upgrade && \
    apt-get -y install maxscale


# Start MaxScale
CMD ["/usr/bin/maxscale","--nodaemon"]    