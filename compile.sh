#!/bin/bash

folders=(
    "1_intro" 
    "2_ibm" 
    # "3_iqm" 
    # "4_bluequbit" 
    # "5_dwave" 
    # "6_quantinuum" 
    # "7_outro"
)

echo "Rendering"

for dir in "${folders[@]}"; do
    if [ -d "$dir" ]; then
        echo "Module: $dir"
        cd "$dir" && uv run quarto render $dir.qmd --log-level warn --output-dir ../docs && cd ..
    fi
done

echo "Done"
