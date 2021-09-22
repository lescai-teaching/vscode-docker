FROM ghcr.io/lescai-teaching/vscode-docker-amd64:main


#####################################
## ADD SAMTOOLS AND BWA TO CONDA ####
#####################################

RUN conda install --quiet --yes \
    samtools \
    bwa && \
    conda clean --all -f -y



#####################################
### INSTALL VSCODE EXTENSIONS #######
#####################################

RUN apt-get install -y bsdtar curl

WORKDIR /config/extensions

RUN wget https://github.com/nextflow-io/vscode-language-nextflow/archive/refs/tags/v0.1.0.tar.gz
RUN tar -xvzf v0.1.0.tar.gz

RUN curl -JL https://github.com/REditorSupport/vscode-R/releases/download/v2.2.0/r-2.2.0.vsix | bsdtar -xvf - extension
RUN mv extension r-2.2.0

RUN wget https://github.com/bash-lsp/bash-language-server/archive/refs/tags/server-2.0.0.tar.gz
RUN tar -xvzf server-2.0.0.tar.gz

RUN wget https://github.com/Rpinski/vscode-shebang-snippets/archive/refs/tags/v0.1.4.tar.gz
RUN tar -xvzf v0.1.4.tar.gz


WORKDIR /config/workspace