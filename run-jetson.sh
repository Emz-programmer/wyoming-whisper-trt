#!/bin/bash
set -euo pipefail


python -m venv ./venv

python3 -m wyoming_whisper_trt \
    --model "${MODEL:-base}" \
    --language "${LANGUAGE:-auto}" \
    --uri "${URI:-tcp://0.0.0.0:10300}" \
    --data-dir "${DATA_DIR:-/data}" \
    --compute-type "${COMPUTE_TYPE:-float16}" \
    --device "${DEVICE:-cuda}" \
    --beam-size "${BEAM_SIZE:-5}" \
    "$@"