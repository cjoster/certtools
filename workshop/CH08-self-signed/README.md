Creating a self-signed certificate is easy once you have a key
and a CSR. You can make the self-signed cert in one shot, but doing so doesn't generate a
CSR. Which, you can always generate later when you want a real certificate,
so it's not that big of a deal. But, on the flip side, generating the CSR requires
the private key. If you make the CSR now, before protecting your private key
somehow, you don't have to unprotect the key again just to submit the CSR.
The same CSR can be submitted to a CA as many times as you want.


### Make a key

```bash
KEY_ALG=dsa new_key > site.key
```

### Generate the self-signed certificate

```bash

```

### Make the CSR

```bash
openssl req -new -key site.key -config site.cnf -batch -out site.csr
```
