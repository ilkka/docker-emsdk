FROM debian:jessie
MAINTAINER ilkka@ilkka.io

RUN echo "\ndeb http://httpredir.debian.org/debian jessie-backports main contrib non-free\n" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get -y install \
    git \
    build-essential \
    python \
  && apt-get -y -t jessie-backports install cmake \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN git clone https://github.com/juj/emsdk.git \
    && cd emsdk \
    && ./emsdk install sdk-incoming-64bit binaryen-master-64bit \
    && ./emsdk activate sdk-incoming-64bit binaryen-master-64bit

WORKDIR /emsdk
