#!/bin/bash
# Used in Docker build to set platform dependent variables

case $TARGETPLATFORM in
    "linux/amd64")
	### THIS RUNS AMD64 COMMANDS
	conda install --quiet --yes samtools bwa && conda clean --all -f -y
	conda install --quiet --yes bioconda::htslib bioconda::tabix 
	conda update -y snpeff && conda clean --all -f -y
	;;
    "linux/arm64") 
	## THIS RUNS APPLE SILICON / ARM64 COMMANDS
	apt-get install -y samtools
	cd /opt/software
	git clone https://github.com/lh3/bwa.git
	cd /opt/software/bwa
    wget https://raw.githubusercontent.com/DLTcollab/sse2neon/master/sse2neon.h
    sed -i -e 's/<emmintrin.h>/"sse2neon.h"/' ksw.c
    make clean
    make all CFLAGS="-g -Wall -Wno-unused-function -O3 -mtune=native"
	apt-get update && apt-get install -y libhts-dev autoconf
	cd /opt/software
	git clone https://github.com/samtools/htslib.git
	cd /opt/software/htslib
	git submodule update --init --recursive
	autoreconf -i
	./configure && make && make install
	;;
esac