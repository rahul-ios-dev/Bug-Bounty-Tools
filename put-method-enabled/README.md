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