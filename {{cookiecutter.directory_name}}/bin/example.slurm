#!/bin/bash

#SBATCH --job-name=example
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --partition=cpu_p
#SBATCH --qos=cpu_normal
#SBATCH --output logs/%j
#SBATCH --time=00:15:00

GREETINGS=false

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
    --source_model)
        SOURCE_MODEL="$2"
        shift # past argument
        shift # past value
        ;;
    --layer_no)
        LAYER_NO="$2"
        shift # past argument
        shift # past value
        ;;
    --head_no)
        HEAD_NO="$2"
        shift # past argument
        shift # past value
        ;;
    *) # unknown option
        echo "Unknown option: $1"
        exit 1
        ;;
    esac
done

source .venv/bin/activate

CMD="python -m {{cookiecutter.project_name}}.example --source_model \"${SOURCE_MODEL}\" --layer_no \"${LAYER_NO}\" --head_no \"${HEAD_NO}\""


if [ "$GREETINGS" = true ]; then
    CMD="$CMD --greetings"
fi

eval "$CMD"