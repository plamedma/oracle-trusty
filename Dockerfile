# Base image: Ubuntu 14.04 Trusty Tahyr
FROM ubuntu:trusty
MAINTAINER Leandro Ramos <lramos@ascentio.com.ar>

EXPOSE 1521
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
    libaio-dev

# Installing python dependencies
RUN pip install cx-Oracle==6.0.2

# Set up environment
EXPOSE 1521
EXPOSE 22

ADD resources /resources
WORKDIR /resources

RUN sudo dpkg -i oracle-instantclient11.2-basic_11.2.0.4.0-2_amd64.deb
RUN sudo dpkg -i oracle-instantclient11.2-sqlplus_11.2.0.4.0-2_amd64.deb
RUN sudo cp 60-oracle.conf /etc/sysctl.d/
RUN sudo service procps start
RUN sudo ldconfig
ENV ORACLE_HOME=/usr/lib/oracle/11.2/client64/
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
ENV PATH=$ORACLE_HOME/bin:$PATH
