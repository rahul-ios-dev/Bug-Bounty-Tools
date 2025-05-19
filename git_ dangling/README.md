- truff
```
trufflehog filesystem . --results=verified  --include-detectors="all"
```
- clone repo
```
gh repo list paypal --limit 1000 --json nameWithOwner --jq '.[].nameWithOwner' > repo.txt
```
- download repo
```
cat repo.txt | while read repo; do git clone "https://github.com/$repo.git"; done
```
- unreachable dangling
```
mkdir -p unreachable_blobs && git fsck --unreachable --dangling --no-reflogs --full -  | grep 'unreachable blob' | awk '{print $3}' | while read h; do git cat-file -p "$h" > "unreachable_blobs/$h.blob"; done
```
- recover_git_deletes
```
#!/bin/bash

# cd to cloned repo
mkdir -p "__ANALYSIS/del"

# Extract all commits and process each commit
git rev-list --all | while read -r commit; do

  echo "Processing commit: $commit"

  # Get the parent commit

  parent_commit=$(git log --pretty=format:"%P" -n 1 "$commit")

  if [ -z "$parent_commit" ]; then
    continue
  fi

  parent_commit=$(echo "$parent_commit" | awk '{print $1}')

  # Get the diff for the commit

  git diff --name-status "$parent_commit" "$commit" | while read -r file_status file; do

    # Replace / with _ for filenames in binary_files_dir

    safe_file_name=$(echo "$file" | sed 's/\//_/g')

    # Handle deleted files

    if [ "$file_status" = "D" ]; then

        # Handle binary files

        echo "Binary file deleted: $file" | tee -a "__ANALYSIS/del.log"

        echo "Saving to __ANALYSIS/del/${commit}___${safe_file_name}"

        git show "$parent_commit:$file" > "__ANALYSIS/del/${safe_file_name}"
    fi
  done
done
```
- scan
```
scan_repo
```
- scan repo
```
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
OUTPUT_DIR="./trufflehog_output"
mkdir -p "$OUTPUT_DIR"

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

    echo "REPO:....$(pwd)"

    recover_git_deletes

    mkdir -p unreachable_blobs && git fsck --unreachable --dangling --no-reflogs --full -  | grep 'unreachable blob' | awk '{print $3}' | while read h; do git cat-file -p "$h" > "unreachable_blobs/$h.blob"; done

# mkdir -p tunreachable_blobs && \
# git fsck --unreachable --dangling --no-reflogs --full | \
# grep 'unreachable blob' | \
# awk '{print $3}' | \
# while read -r h; do
#     git cat-file -p "$h" >> "tunreachable_blobs/00.txt"
# done

    # Run TruffleHog and store results
    trufflehog filesystem . --results=verified  --include-detectors="all" | tee "$OUTPUT_DIR/${REPO_NAME}.txt"

    cd ..

    echo "BASE....$(pwd)"
    echo "[+] Done... $REPO_NAME"
    echo "-------------------------------------"

done < "$REPO_LIST"

```
- contributor name
```
gh repo list paypal --limit 1000 --json nameWithOwner --jq '.[].nameWithOwner' | while read repo; do gh api -H "Accept: application/vnd.github+json" /repos/$repo/contributors --paginate --jq '.[].login'; done >> contributors.txt
```
- donwload latest repo
```
for page in {1..19}; do                                        

 gh api "search/repositories?q=user:google&sort=updated&order=des&per_page=50&page=$page" --jq '.items[].full_name'

done > latest_repo.txt
```