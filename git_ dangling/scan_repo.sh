#!/bin/bash

# Check if a file was provided as argument
if [ -z "$1" ]; then
    echo "Usage: $0 <repo_list_file>"
    exit 1
fi

REPO_LIST="$1"

# Check if the file exists
if [ ! -f "$REPO_LIST" ]; then
    echo "Error: File '$REPO_LIST' not found!"
    exit 1
fi

# Define output directory
# OUTPUT_DIR="./trufflehog_output"
# mkdir -p "$OUTPUT_DIR"

mkdir -p __trufflehog_output
mkdir -p __trufflehog_result


# Loop through each repo name
while read -r REPO_NAME; do
    [ -z "$REPO_NAME" ] && continue  # Skip empty lines

    echo "[+] Scan $REPO_NAME"

    # Check if directory exists
    if [ ! -d "$REPO_NAME" ]; then
        echo "[-] Directory $REPO_NAME does not exist. Skipping."
        continue
    fi

    cd "$REPO_NAME" || continue

    recover_git_deletes

    # mkdir -p tunreachable_blobs
    # git fsck --unreachable --dangling --no-reflogs --full \
    #   | grep 'unreachable blob' \
    #   | awk '{print $3}' \
    #   | while read -r h; do
    #       git cat-file -p "$h" >> "tunreachable_blobs/00.txt"
    #     done

    mkdir -p unreachable_blobs && git fsck --unreachable --dangling --no-reflogs --full -  | grep 'unreachable blob' | awk '{print $3}' | while read h; do git cat-file -p "$h" > "unreachable_blobs/$h.blob"; done

    # Run TruffleHog and store results
    trufflehog filesystem . --results=verified --include-detectors="all" | tee "__${REPO_NAME}.txt"

    cp "__${REPO_NAME}.txt" ../__trufflehog_output/

    if [ -s "__${REPO_NAME}.txt" ]; then
    mkdir -p "../__trufflehog_result/${REPO_NAME}"
    grep File "__${REPO_NAME}.txt" | cut -d " " -f 2 | while read -r file; do
        cp "$file" "../__trufflehog_result/${REPO_NAME}" 2>/dev/null
    done
    cp "__${REPO_NAME}.txt" "../__trufflehog_result/${REPO_NAME}/"
    else
    echo "File __${REPO_NAME}.txt is empty"
    fi

    cd ..

    rm -rf "$REPO_NAME"

    echo "[+] Done... $REPO_NAME"
    echo "-------------------------------------"

done < "$REPO_LIST"
