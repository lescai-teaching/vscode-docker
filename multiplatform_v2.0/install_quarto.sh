#!/bin/bash
# Used in Docker build to set platform dependent variables

case $TARGETPLATFORM in
    "linux/amd64")
	### THIS RUNS AMD64 COMMANDS
	wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb
	gdebi -n quarto-1.3.450-linux-amd64.deb
	;;
    "linux/arm64") 
	## THIS RUNS APPLE SILICON / ARM64 COMMANDS
	wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-arm64.deb
	gdebi -n quarto-1.3.450-linux-arm64.deb
	;;
esac