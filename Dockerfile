FROM ubuntu:14.04

MAINTAINER j martin <jonthan.martin@lucidworks.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean

RUN apt-get install -y ntp wget zip unzip tar dos2unix nano

RUN mkdir /opt/fusion

COPY fusion-4.2.0.tar.gz /opt/fusion

RUN cd /opt/fusion
WORKDIR /opt/fusion
RUN tar xvf fusion-4.2.0.tar.gz
COPY fusion.properties fusion/4.2.0/conf/fusion.properties

EXPOSE 9983
EXPOSE 8983
EXPOSE 8765
EXPOSE 8766
EXPOSE 8769
EXPOSE 8984
EXPOSE 8771
EXPOSE 8764
EXPOSE 8780
EXPOSE 8763
EXPOSE 8768
EXPOSE 9600

CMD ./fusion/4.2.0/bin/fusion start && tail -f /dev/null
