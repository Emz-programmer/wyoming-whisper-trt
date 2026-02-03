#!/bin/bash
set -euo pipefail

cd /usr/src/wyoming-whisper-trt

git pull
# Launch the main application
python3 -m wyoming_whisper_trt \
    --model "${MODEL:-base}" \
    --language "${LANGUAGE:-auto}" \
    --uri "${URI:-tcp://0.0.0.0:10300}" \
    --data-dir "${DATA_DIR:-/data}" \
    --compute-type "${COMPUTE_TYPE:-float16}" \
    --device "${DEVICE:-cuda}" \
    --beam-size "${BEAM_SIZE:-5}" \
    "$@"
