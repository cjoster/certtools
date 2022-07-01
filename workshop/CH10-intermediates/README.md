# Making a root CA and Intermediate

### Make a root key

```bash
KEY_ALG=ecc new_key > Root.key
```

### Make the root CSR

```bash
openssl req -new -config Root.cnf -reqexts ca_req_ext -key Root.key -out Root.csr -batch
```

### Sign the root CA

```bash
openssl x509 -req -signkey Root.key -in Root.csr -set_serial 0 -extfile Root.cnf -extensions ca_ext > Root.crt
```

## Intermediate

### Key

```bash
KEY_ALG=ecc new_key > Intermediate.key
```

### CSR

```bash
openssl req -new -config Intermediate.cnf -key Intermediate.key -out Intermediate.csr -reqexts int_req_ext -batch
```

### Sign the intermediate cert with the root key

This is just like signing a certificate, except pay close attention to the config file and the extensions section is mentions.

```bash
openssl x509 -req -in Intermediate.csr -extfile Intermediate.cnf -extensions int_ext -CA Root.crt -CAkey Root.key > Intermediate.crt
```

## Signing an end-user cert

```bash
cp ../CH07-config-files-and-csrs/site.csr ./
```

```bash
openssl x509 -req -in site.csr -extfile Intermediate.cnf -extensions cert_ext -copy_extensions copy -CA Intermediate.crt -CAkey Intermediate.key > site.crt
```

## Don't forget to make the chain for your user

It is the responsibility of the server to present the intermediate certificates.

```bash
cat site.crt Intermediate.crt | tee site.chain
```
