#!/bin/bash

NUM_LAYERS=24
NUM_BLOCKS=14
MODEL_NAME="Qwen2.5-0.5B"

for layer in $(seq 0 $((NUM_LAYERS - 1))); do
    for head in $(seq 0 $((NUM_BLOCKS - 1))); do

        sbatch bin/example.slurm --source_model "${MODEL_NAME}" --layer_no "${layer}" --head_no "${head}"

        sbatch bin/example.slurm --source_model "${MODEL_NAME}" --layer_no "${layer}" --head_no "${head}" --greetings

    done
done