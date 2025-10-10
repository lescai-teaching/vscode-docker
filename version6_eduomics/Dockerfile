FROM mambaorg/micromamba:1.5.10-noble

COPY --chown=$MAMBA_USER:$MAMBA_USER conda_env.yml /tmp/conda.yml

RUN micromamba install -y -n base -f /tmp/conda.yml \
    && micromamba install -y -n base conda-forge::procps-ng \
    && micromamba env export --name base --explicit > environment.lock \
    && echo ">> CONDA_LOCK_START" \
    && cat environment.lock \
    && echo "<< CONDA_LOCK_END" \
    && micromamba clean -a -y

USER root
ENV PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gdebi-core \
        libfribidi-dev \
        libharfbuzz-dev \
        sudo \
        wget \
        git

RUN useradd -m -s /bin/bash gitpod && \
    echo "gitpod:student" | chpasswd && \
    usermod -aG sudo gitpod && \
    echo "gitpod ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/gitpod && \
    chmod 0440 /etc/sudoers.d/gitpod

COPY snpEff.config /opt/conda/share/snpeff-5.3.0a-1/snpEff.config

COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

RUN mkdir -p /config/workspace/

WORKDIR /config/workspace
RUN git clone https://github.com/lescai-teaching/snpeff-cache.git

RUN chown -R gitpod:gitpod /config/workspace
RUN chmod -R +rwx /config/workspace

USER gitpod



ENTRYPOINT [ "/usr/local/bin/init.sh" ]