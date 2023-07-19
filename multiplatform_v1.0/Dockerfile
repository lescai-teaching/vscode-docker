FROM ghcr.io/linuxserver/code-server

RUN apt-get update
RUN apt-get install -y python3 python3-pip wget

ARG TARGETPLATFORM
ARG TARGETARCH

RUN mkdir -p /opt/install
COPY install_conda.sh /opt/install/install_conda.sh

RUN bash /opt/install/install_conda.sh

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
    bioconda::gatk4 \
    bioconda::snpeff=4.5covid19 && \
    conda clean --all -f -y

RUN mkdir -p /opt/software

COPY install_bwa.sh /opt/install/install_bwa.sh
RUN bash /opt/install/install_bwa.sh

ENV PATH /opt/software/bwa:${PATH}

RUN apt-get install -y bsdtar curl

WORKDIR /config/extensions

RUN wget https://raw.githubusercontent.com/lescai-teaching/vscode-docker/main/assets/packed_extensions.tar.gz
RUN tar -xvzf packed_extensions.tar.gz

WORKDIR /config/workspace
RUN chown -R abc:abc /usr/local/share

RUN conda install --quiet --yes \
    pandas && \
    conda clean --all -f -y

WORKDIR /usr/local/share/snpeff-5.0-1

COPY snpEff.config .

WORKDIR /config/workspace

