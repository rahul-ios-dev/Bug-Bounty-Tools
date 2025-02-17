#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <file_with_urls> [lines_per_file]"
    exit 1
fi

# Input file from the argument
input_file="$1"

# Default number of lines per split file
lines_per_file=10

# If the second argument is provided, use it as the number of lines per split
if [ "$#" -ge 2 ]; then
    lines_per_file="$2"
    # Check if lines_per_file is a valid number
    if ! [[ "$lines_per_file" =~ ^[0-9]+$ ]]; then
        echo "Error: The number of lines per file must be a valid number."
        exit 1
    fi
fi

# Check if the file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found!"
    exit 1
fi

# Create the split_files directory if it doesn't exist
output_dir="split_files"
mkdir -p "$output_dir"

# Move into the split_files directory
cd "$output_dir" || exit 1

# Use the split command to split the file
# Use a prefix "split_" and set suffix length to 2 (default is "aa", "ab", ...)
split -l "$lines_per_file" "../$input_file" "split_"

# Rename the output files to start from 0.txt to the required number
counter=0
for file in $(ls split_*); do
    mv "$file" "${counter}.txt"
    ((counter++))
done