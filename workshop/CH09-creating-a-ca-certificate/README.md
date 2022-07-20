## Create a new key

```bash
KEY_ALG=ecc new_key > CA.key
```

## Create a certificate signing request for the CA (this process can be skipped)

```bash
openssl req -new -key CA.key -config CA.cnf -out CA.csr -batch -reqexts ca_req_ext
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
```

# Signing a csr with your CA

### Make a directory for your certs

You'll need to keep all of the certificates you issue so that if you ever need to revoke one, you have it to revoke.

```bash
mkdir -p certs
```

### Generate a serial number

Serial numbers used to be sequential and meaningful. These days, most all CA's issue random 16-20 byte serial numbers.

```bash
serial=$(dd if=/dev/random bs=18 count=1 iflag=fullblock 2>/dev/null | xxd -p)
```

### Sign the CSR

This will sign the CSR created in the chapter *CH07-config-files-and-csrs*

```bash
openssl x509 -req -in ../CH07-config-files-and-csrs/site.csr -key CA.key -extfile CA.cnf -extensions cert_ext -days 365 -set_serial "0x${serial}" -copy_extensions copy > "certs/${serial}.crt"
```

### View your certificate

```bash
openssl x509 -in "certs/$serial.crt -text
```
```
