#!/bin/bash

MODEL_PATH=$1
MODEL_BASENAME=$(basename $MODEL_PATH)

python -m lm_eval --model hf-mlm \
    --model_args pretrained=$MODEL_PATH,backend="mlm" \
    --tasks blimp_filtered,blimp_supplement \
    --device cuda:0 \
    --batch_size 1 \
    --log_samples \
    --output_path results/blimp/${MODEL_BASENAME}/blimp_results.json
    --trust_remote_code

# Use `--model hf-mlm` and `--model_args pretrained=$MODEL_PATH,backend="mlm"` if using a custom masked LM.
# Add `--trust_remote_code` if you need to load custom config/model files.
# --model hf-lm ,--model_args pretrained=$MODEL_PATH,backend="causal" 