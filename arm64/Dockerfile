FROM ghcr.io/linuxserver/code-server

RUN apt-get update
RUN apt-get install -y python3 python3-pip wget
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh

######################
## ARM64 architecture
######################

RUN bash Miniforge3-Linux-aarch64.sh -b -f -p /usr/local

RUN conda config --system --prepend channels bioconda
RUN conda config --system --prepend channels defaults

RUN conda install --quiet --yes \
    conda-forge::biopython \
    conda-forge::numpy \
    conda-forge::matplotlib \
    conda-forge::markdown \
    conda-forge::pymdown-extensions \
    conda-forge::pygments \
    bioconda::fastqc \
    bioconda::multiqc \
    bioconda::gatk \
    bioconda::snpeff=4.5covid19 && \
    conda clean --all -f -y


## samtools and bowtie need to be installed separately for arm64

## changing user to make sure there are not permissions problems
USER root