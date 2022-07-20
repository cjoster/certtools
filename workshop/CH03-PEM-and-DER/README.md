## Champter 1 - Formats: PEM and DER

Here is a PEM (*P*rivacy *E*nhanced *M*ail) encoded certificate. Let's talk about what we're
looking at here:

```
-----BEGIN CERTIFICATE-----
MIIH/TCCBuWgAwIBAgIQBWY4ySOSI2ERoIrVhqn11zANBgkqhkiG9w0BAQsFADBg
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMR8wHQYDVQQDExZHZW9UcnVzdCBUTFMgUlNBIENBIEcx
MB4XDTIyMDIwNzAwMDAwMFoXDTIzMDMxMDIzNTk1OVowGTEXMBUGA1UEAxMOd3d3
Lm1vdXNlci5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC6oTwV
hKAP9Bo/KXzBr7ssJfgn2DDI/HaaCReVOyfO01JCF5GzYtzrDVzzEhPzjgPFXX1u
wwNZAHJazMNXXUcCoeP4AZqRhQmqsAQN8QIt2ZY+TNruY9ddNoC3mZDYOOJylyif
UogDy3PuUTSDmcNuyHoZD6fpvx6OiHIDLb97cbkXfTrO6c7J9H9S2S+6lmapkBpp
s1B472XLcmfY/T+qvq7f+82SVKxWRJEiVgwlWOZfYpjNuK+H82yuNwC6fAlJCOar
pHk+AWDJv3C7W2CL8CzbVGVnMWLC3lE1M/2T4Y+BFM4uBGHmrdVQjaQ9SqkZ8hjk
jHKp2QASMnbbrjRBAgMBAAGjggT4MIIE9DAfBgNVHSMEGDAWgBSUT9Rdi+Sk4qaA
/v3Y+QDvo74CVzAdBgNVHQ4EFgQUQm5zSjUaMuwyUw8bRrXL5KTjAVMwggH9BgNV
HREEggH0MIIB8IIOd3d3Lm1vdXNlci5jb22CEW1hY25pY2EtbW91c2VyLmpwgglt
b3VzZXIuYXSCCW1vdXNlci5iZYIJbW91c2VyLmNhggltb3VzZXIuY2iCCW1vdXNl
ci5jbIIJbW91c2VyLmNuggxtb3VzZXIuY28uY3KCDG1vdXNlci5jby5pZIIMbW91
c2VyLmNvLmlsggxtb3VzZXIuY28udWuCCm1vdXNlci5jb22CDW1vdXNlci5jb20u
Z3SCDW1vdXNlci5jb20udHKCCW1vdXNlci5kZYIJbW91c2VyLmRrggltb3VzZXIu
ZG+CCW1vdXNlci5lY4IJbW91c2VyLmVlggltb3VzZXIuZXOCCW1vdXNlci5maYIJ
bW91c2VyLmZyggltb3VzZXIuaGuCCW1vdXNlci5oboIJbW91c2VyLmllggltb3Vz
ZXIuaW6CCW1vdXNlci5pdIIJbW91c2VyLmpwggltb3VzZXIua3KCCW1vdXNlci5s
aYIJbW91c2VyLmx1ggltb3VzZXIubXiCCW1vdXNlci5wZYIJbW91c2VyLnBogglt
b3VzZXIucGyCCW1vdXNlci5wcoIJbW91c2VyLnNlggltb3VzZXIuc2eCCW1vdXNl
ci5za4IJbW91c2VyLnR3ggltb3VzZXIudm4wDgYDVR0PAQH/BAQDAgWgMB0GA1Ud
JQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjA/BgNVHR8EODA2MDSgMqAwhi5odHRw
Oi8vY2RwLmdlb3RydXN0LmNvbS9HZW9UcnVzdFRMU1JTQUNBRzEuY3JsMD4GA1Ud
IAQ3MDUwMwYGZ4EMAQIBMCkwJwYIKwYBBQUHAgEWG2h0dHA6Ly93d3cuZGlnaWNl
cnQuY29tL0NQUzB2BggrBgEFBQcBAQRqMGgwJgYIKwYBBQUHMAGGGmh0dHA6Ly9z
dGF0dXMuZ2VvdHJ1c3QuY29tMD4GCCsGAQUFBzAChjJodHRwOi8vY2FjZXJ0cy5n
ZW90cnVzdC5jb20vR2VvVHJ1c3RUTFNSU0FDQUcxLmNydDAJBgNVHRMEAjAAMIIB
fAYKKwYBBAHWeQIEAgSCAWwEggFoAWYAdQDoPtDaPvUGNTLnVyi8iWvJA9PL0RFr
7Otp4Xd9bQa9bgAAAX7VBatbAAAEAwBGMEQCIAcmxIGEZ4+6/vJcl+pzhBLfvyLD
MmHWmU4S7huTbdCzAiB3bdB6CP4rWu0tF/aFug/9iG3/VX7FqwOErCgMv8F7uAB2
ADXPGRu/sWxXvw+tTG1Cy7u2JyAmUeo/4SrvqAPDO9ZMAAABftUFqu4AAAQDAEcw
RQIgZ3HypUKzTyh/V9geT1pFNQcpIlom/fjSI+/IEAw24U0CIQDoU8GzcW5ef+ln
414ukTehevrxBesew8/4Wy6SSgpHDAB1ALNzdwfhhFD4Y4bWBancEQlKeS2xZwwL
h9zwAw55NqWaAAABftUFqw4AAAQDAEYwRAIgAbqrbJxx+086C/CK9tw8Dger1NXC
o0qnNrrgYIQFDXACICfgH3SyK0+N10HNAhdPnTgvYT62yBu039efrtMTQ+ZMMA0G
CSqGSIb3DQEBCwUAA4IBAQCmOd26i1rku2Sqe6WTvIogJSaAeLtfOCyNpt3Yx6cZ
65vWdgix1DWQl2y2kLLRaTKJtAJI1LbKB9ZOjkzzaQumlF50I1nHIuhcV33uYrGF
V0zS+NL2vzzWr4G9mK8Vh90DhvR+XdOdzVg5NTR/f/zareLtkuQgfdtRNX2H2Lv+
tSZImASeJVnsjooXkcgKdAKPBWK4OAOBdMOjRW175PZj/mEHHigpfBGQWQSOWcpj
JBUMgXLVclYLKTSBR34mU8VJ+6Iulkz+A5GzQHsq74KxJ85NwNOGU8m01PHSU9Le
nhA/bLWrEpwIZAoNRrOX2xOidlOsm8CZ1KN6Tmcf6NL3
-----END CERTIFICATE-----
```

This should be obvious to anybody that's worked with Kubernetes
that it's `base64` encoded. Some of you might have even tried to
base64 decode this, which you can try with:

```bash
cat example_certificate.pem | grep -v -- --- | base64 -d
```

...and you'll see you get a bunch of binary garbage with some
plain text in it. That binary form is called the DER (*D*istinguished
*E*ncoding *R*ules) format and was the original format certificates
and keys were distributed in.

So why PEM? PEM has a couple of advantages, in particular, it's plain
text, so they can be freely emailed. Being plain text, you can concatinate
a certificate and the corresponding key into the same file and most
libraries can understand this. It also allows for concatonation of multiple certicates
either as a *bundle* or a *chain* for their various purposes. Particularly,
PEM format allows for encrypting private keys with a symmetric password-based
encryption key.

### Convert PEM to DER

```bash
openssl x509 -in example_certificate.pem -outform DER -out example_certificate.der
```

OR

```bash
cat example_certificate.pem | grep -v -- --- > example_certificate.der # this works on keys and other kinds of PEM encoded data
```

### The `file` command is your friend

Don't be afraid to `cat` certificate material. Worst case, you'll get some binary stuff
on your terminal. Usually, it'll be PEM encoded and tell you what it is in the first and last
line.

```
[cjoster@host CH00-viewing-cryptographic-material]$ file *
example.csr:    PEM certificate request
example.key:    PEM RSA private key
README.md:      ASCII text
vmware.com.crt: PEM certificate

[cjoster@host CH01-PEM-and-DER]$ file *
encrypted_key_new.pem: ASCII text
encrypted_key_old.pem: PEM RSA private key
example_cert.der:      Certificate, Version=3
example_cert.pem:      PEM certificate
example_key.der:       DER Encoded Key Pair, 2048 bits
example_key.pem:       PEM RSA private key
README.md:             ASCII text
```

The whole point of this exercise is to point out that naming something `.pem` is a bit redundant. Name your keys `.key`, your certs `.crt` or `.cer`,
and your certificate signing requests `.csr`.
