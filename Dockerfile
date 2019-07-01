FROM debian:latest
MAINTAINER lfelipedeoliveira, felipe@lfelipedeoliveira.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y; \
    apt-get install wget zlib1g-dev make -y; \
    apt-get upgrade; \
    apt-get clean

# Download & install

 RUN wget https://sourceforge.net/projects/bio-bwa/files/bwa-0.7.17.tar.bz2 \
  && tar -C /opt -xf bwa-0.7.17.tar.bz2 \
  && mkdir /opt/bwa-0.7.17 \
  && cd bwa-0.7.17 \
  && cp bwa /opt/bwa-0.7.17 \
  && cp qualfa2fq.pl /opt/bwa-0.7.17 \
  && cp xa2multi.pl /opt/bwa-0.7.17 \
  && cd / \
  && rm -r /bwa-0.7.17.tar.bz2 /bwa-0.7.17

 ENV PATH /opt/bwa-0.7.17:$PATH