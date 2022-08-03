# Generating Keys the Easy Way

Included in the tooling with this repo is a tool to take
away all the hand-wavey stuff involved in generating private keys.

Once installed, invoke with:

```bash
new_key -h
```

Output:
```
Usage:
       new_key

Generates a private key and prints to standard out.

The environment variable KEY_ALG can be used to select
the public key algorithm. Valid options are "RSA",
"DSA", and "ECC". The default is RSA.

The environment variable KEY_BITS can be use to specify
the number of bits for RSA and DSA keys. It defaults to
2048 and 1024 respectively.

For ECC curves, the variable KEY_CURVE can be use to
select the curve on which you'd like your key generated.
The default is "prime256v1". Supported curves are:

  secp224r1 : NIST/SECG curve over a 224 bit prime field
  secp256k1 : SECG curve over a 256 bit prime field
  secp384r1 : NIST/SECG curve over a 384 bit prime field
  secp521r1 : NIST/SECG curve over a 521 bit prime field
  prime256v1: X9.62/SECG curve over a 256 bit prime field

Environment variables can be set thusly:
    KEY_ALG=RSA KEY_BITS=4096 new_key
```


## Generating RSA keys

```bash
new_key
```

```bash
KEY_BITS=4096 new_key
```

## Generating DSA keys

```bash
KEY_ALG=dsa new_key
```

```bash
KEY_ALG=dsa KEY_BITS=2048 new_key
```
## Generating ECC keys

```bash
KEY_ALG=ecc new_key
```

```bash
KEY_ALG=ecc KEY_CURVE=secp521r1 new_key
```

