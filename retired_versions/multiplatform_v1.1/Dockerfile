FROM ghcr.io/lescai-teaching/vscode-docker:4.0.0

RUN usermod -u 1000 abc
RUN groupmod -g 1000 abc

########## install latest version of SNPeff ######

RUN mkdir -p /config/workspace/data/
RUN chown -R abc:abc /config/workspace/data/
RUN mkdir -p /usr/local/share/snpeff-5.1-2

RUN conda install bioconda::snpeff=5.1

WORKDIR /usr/local/share/snpeff-5.1-2

COPY snpEff.config .

WORKDIR /config/workspace