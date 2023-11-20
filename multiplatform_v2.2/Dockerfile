FROM ghcr.io/lescai-teaching/vscode-docker:5.0.1

ARG TARGETPLATFORM
ARG TARGETARCH

## fix SNPeff download folder
RUN mkdir -p /config/workspace/snpeff_data
RUN chown 911:911 /config/workspace/snpeff_data

COPY snpEff.config /config/workspace/snpeff_data/snpEff.config

WORKDIR /config/addons
COPY fix_snpeff_config.sh .
RUN bash ./fix_snpeff_config.sh


## go back home then

WORKDIR /config/workspace