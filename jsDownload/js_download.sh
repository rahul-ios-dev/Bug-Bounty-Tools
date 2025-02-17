#!/bin/bash

# V.0.1 - Save files as numbered filenames (0.js, 1.js, etc.)

# Check if the argument (the file with the list of URLs) is provided
if [ -z "$1" ]; then
  echo "Usage: ./js-download.sh <file_with_urls>"
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "File $1 not found!"
  exit 1
fi

# Initialize a counter for the filenames
counter=0

# Loop through each URL in the input file
while IFS= read -r url; do
  # Save each file with a numbered filename (0.js, 1.js, etc.)
  filename="${counter}.js"

  # Download the file and beautify it using js-beautify
  echo "Downloading and beautifying: $filename"
  curl -s "$url" | js-beautify > "$filename"

  # Check if the file was downloaded and beautified
  if [ $? -eq 0 ]; then
    echo "Successfully saved: $filename"
  else
    echo "Failed to download or beautify: $filename"
  fi

  # Increment the counter for the next file
  ((counter++))
done < "$1"
