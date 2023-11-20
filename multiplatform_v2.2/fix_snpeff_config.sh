#!/bin/bash
# Used in Docker build to set platform dependent variables

case $TARGETPLATFORM in
    "linux/amd64")
	### THIS RUNS AMD64 COMMANDS
	cp /config/workspace/snpeff_data/snpEff.config /usr/local/share/snpeff-5.1-0/snpEff.config
	;;
    "linux/arm64") 
	## THIS RUNS APPLE SILICON / ARM64 COMMANDS
	cp /config/workspace/snpeff_data/snpEff.config /usr/local/share/snpeff-5.1-2/snpEff.config
	;;
esac