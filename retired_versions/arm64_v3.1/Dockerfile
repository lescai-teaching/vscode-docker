FROM ghcr.io/lescai-teaching/vscode-docker-arm64:3.0.0

##### Add Pandas library #####

RUN conda install --quiet --yes \
    pandas && \
    conda clean --all -f -y