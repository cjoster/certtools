## Create a new key

```bash
KEY_ALG=ecc new_key > CA.key
```

## Create a certificate signing request for the CA (this process can be skipped)

```bash
openssl req -new -key CA>key -config CA.cnf -out CA.csr -batch -reqexts ca_req_ext
```

## Look at your CSR and make sure it's what you want

```bash
openssl req -in CA.csr -text -noout
```

## Create the CA certificate

```bash
openssl x509 -req -in CA.csr -set_serial 0 -signkey CA.key -extfile CA.cnf -days 36500 -extensions ca_ext -out CA.crt
```

## Look at the CA certificate and make sure it's what you wanted

```bash
openssl x509 -in CA.crt -text -noout

# OR

view_cert CA.crt
```

---

## Create the CA key and cert in one shot


### RSA key
```bash
openssl req -x509 -newkey rsa:2048 -keyout CA.key -days 365 -config CA.cnf -extensions ca_ext -batch -nodes -out CA.crt
```


### DSA key

```bash
openssl req -x509 -newkey dsa:<(openssl dsaparam 1024) -keyout CA.key -days 36500 -config CA.cnf -extensions ca_ext -batch -nodes -out CA.crt
```

### ECC key

```bash
openssl req -x509 -newkey ec:<(openssl ecparam -name prime256v1) -keyout CA.key -days 36500 -config CA.cnf -extensions ca_ext -batch -nodes -out CA.crt
```

## If you want to see your key and certificate

```bash
openssl req -x509 -newkey ec:<(openssl ecparam -name prime256v1) -days 36500 -config CA.cnf -extensions ca_ext -batch -nodes -text
