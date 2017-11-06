# Base image: Ubuntu 14.04 Trusty Tahyr
FROM ubuntu:trusty
MAINTAINER Leandro Ramos <lramos@ascentio.com.ar>

ENV ORACLE_VERSION 11.2.0.4.0-2
ENV ORACLE_VERSION_SHORT 11.2
EXPOSE 1521 # database port
EXPOSE 22

# Install basic dependencies
RUN apt-get update -y && apt-get install -y \
    software-properties-common \
    python-software-properties \
    build-essential \
    python-dev \
    python-numpy \
    python \
    python-pip \

# Installing python dependencies
RUN pip install

# Set up environment
EXPOSE 1521
EXPOSE 22

ADD resources /resources
WORKDIR /resources

RUN sudo dpkg -i oracle-instantclient$ORACLE_VERSION_SHORT-basic_$ORACLE_VERSION_amd64.deb
RUN sudo dpkg -i oracle-instantclient$ORACLE_VERSION-sqlplus_$ORACLE_VERSION_amd64.deb
RUN sudo cp 60-oracle.conf /etc/sysctl.d/
RUN sudo service procps start
RUN sudo ldconfig
ENV ORACLE_HOME=/usr/lib/oracle/$ORACLE_VERSION/client64/
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
ENV PATH=$ORACLE_HOME/bin:$PATH
