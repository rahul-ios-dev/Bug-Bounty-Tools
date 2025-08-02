- katana
```
katana -u "https://52.143.247.146/vendor" -o katana.txt
cat katana.txt | sed 's|\?.*$||' | sed 's|[^/]*\.[^/]*$||' | sed 's|/$||' | sort -u > 000.txt
nuclei -l 000.txt -t tmp.yaml -proxy http://127.0.0.1:8080
```
### **Explanation:**
- `s|\?.*$||` → Removes everything after `?` (query strings).
- `s|[^/]*\.[^/]*$||` → Removes files with extensions (e.g., `.md`, `.php`).
- `s|/$||` → Removes trailing slashes.
- `sort -u` → Removes duplicates.

- use nuclei via burp
```
nuclei -t put-method-enabled-custom.yaml -u https://52.143.247.146 -proxy http://127.0.0.1:8080
```
- `paths.txt` file present in current dir
```
/vendor
/vendor/bin
/vendor/doctrine
```