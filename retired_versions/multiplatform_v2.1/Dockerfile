FROM ghcr.io/lescai-teaching/vscode-docker:5.0.0

ARG TARGETPLATFORM
ARG TARGETARCH

### fix java version problematic with AMD64
RUN conda install --quiet --yes conda-forge::openjdk=17.0.3 && \
    conda clean --all -f -y

## go back home then

WORKDIR /config/workspace

## remove folder data which confuses people

RUN rm -r /config/workspace/data