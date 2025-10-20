FROM ghcr.io/lescai-teaching/vscode-docker:5.0.2

RUN groupadd -g 33333 gitpod
RUN useradd gitpod -u 33333 -g 33333 -m -s /usr/bin/bash
RUN echo "gitpod:rstudio" | sudo chpasswd