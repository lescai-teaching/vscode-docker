FROM ghcr.io/lescai-teaching/vscode-docker-arm64:main

###################################
## INSTALL SAMTOOLS
###################################

RUN apt-get install -y samtools

###################################
## download and build BWA
###################################

RUN mkdir -p /opt/sofware
WORKDIR /opt/software
RUN git clone https://github.com/lh3/bwa.git
WORKDIR /opt/software/bwa
COPY build_bwa.sh .
RUN bash build_bwa.sh

ENV PATH /opt/software/bwa:${PATH}
WORKDIR /config/workspace