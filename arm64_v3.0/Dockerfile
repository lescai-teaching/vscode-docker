FROM ghcr.io/lescai-teaching/vscode-docker-arm64:2.0.0

######### install HTSLIB (bgzip & tabix) #########
RUN apt-get update && apt-get install -y \
	libhts-dev \
	autoconf
WORKDIR /opt/software
RUN git clone https://github.com/samtools/htslib.git 
WORKDIR /opt/software/htslib
RUN git submodule update --init --recursive
RUN autoreconf -i
RUN ./configure && make && make install


#### install GATK4 updating from previous version ####
WORKDIR /
RUN conda install --quiet --yes \
	bioconda::gatk4 && \
    conda clean --all -f -y