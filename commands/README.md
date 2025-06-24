# Use Full Commands
 
##### List of commnads
- Using grep to find IP addresses:
```
cat test.txt | grep -Eo '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b'
```