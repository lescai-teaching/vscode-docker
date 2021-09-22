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

COPY assets/packed_extensions.tar.gz .
RUN tar -xvzf packed_extensions.tar.gz


WORKDIR /config/workspace