FROM ghcr.io/lescai-teaching/vscode-docker:4.1.0

ARG TARGETPLATFORM
ARG TARGETARCH

####################################################
####### install pandoc, quarto and other extensions ########

RUN mkdir -p /config/addons
RUN apt-get update -y && apt-get install -y gdebi-core

WORKDIR /config/addons
COPY install_quarto.sh .
RUN bash ./install_quarto.sh

WORKDIR /config/extensions

#### PANDOC first

RUN apt-get update -y && apt-get install -y pandoc

#### then extensions

COPY quarto.quarto-1.95.1-universal_installed.tar.gz .
COPY chrischinchilla.vscode-pandoc-0.4.3-universal_installed.tar.gz .
COPY extensions.json .
RUN tar -xvzf quarto.quarto-1.95.1-universal_installed.tar.gz
RUN tar -xvzf chrischinchilla.vscode-pandoc-0.4.3-universal_installed.tar.gz

#### quarto needs jupyter to render .qmd documents

RUN conda install --quiet --yes jupyter && \
    conda clean --all -f -y

## go back home then

WORKDIR /config/workspace