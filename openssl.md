```
# To create a private key:
$openssl genrsa -out privatekey.pem 2048

# Create a public key from this private key:
$ openssl rsa -in privatekey.pem -pubout -out publickey.pem
```

Let's encrypt and decrypt with this public private key pair
```
# encrypt with public key
$ openssl pkeyutl -encrypt -pubin -inkey publickey.pem -in plaintext.txt | base 64 > encrypt

# decrypt with private key
$ cat encrypt | base64 -d | openssl pkeyutl -decrypt -inkey privatekey.pem
```

