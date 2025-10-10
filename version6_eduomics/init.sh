#!/usr/bin/env bash
set -euo pipefail

exec jupyter lab \
    --ip 0.0.0.0 \
    --no-browser \
    --NotebookApp.token='' \
    --NotebookApp.password=''
