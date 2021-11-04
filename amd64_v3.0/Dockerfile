FROM ghcr.io/lescai-teaching/vscode-docker-amd64:2.0.0

##### Install HTSLIB (bgzip, tabix) #####
##### Also update the environment with GATK4 #####

RUN conda install --quiet --yes \
    bioconda::htslib \
    bioconda::tabix && \
	gatk4 \
    conda clean --all -f -y