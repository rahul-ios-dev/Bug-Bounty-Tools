#!/bin/bash

# Check if file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file-with-domains>"
  exit 1
fi

# Save absolute path to the domain file
FILE="$(realpath "$1")"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File '$FILE' not found!"
  exit 1
fi


# Loop through each domain
while IFS= read -r DOMAIN; do

  [[ -z "$DOMAIN" || "$DOMAIN" =~ ^# ]] && continue

  echo "[+] Running paramspider for $DOMAIN"

  paramspider -d "$DOMAIN"
  
done < "$FILE"
