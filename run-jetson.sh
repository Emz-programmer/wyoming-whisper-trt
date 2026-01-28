#!/bin/bash
set -euo pipefail

cd /usr/src/wyoming-whisper-trt

export PIP_INDEX_URL=https://pypi.org/simple

pip3 install wyoming

python3 -m wyoming_whisper_trt \
    --model "${MODEL:-base}" \
    --language "${LANGUAGE:-auto}" \
    --uri "${URI:-tcp://0.0.0.0:10300}" \
    --data-dir "${DATA_DIR:-/data}" \
    --download-dir "${DATA_DIR:-/data}" \
    --compute-type "${COMPUTE_TYPE:-float16}" \
    --device "${DEVICE:-cuda}" \
    --beam-size "${BEAM_SIZE:-5}" \
    "$@"