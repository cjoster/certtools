# Generatinig Keys

Generating keys with openssl is pretty straight forward.
Pick an algorithm and then possibly a curve and you'll all set.

## Generating RSA keys

RSA keys are, by many account, the easiest keys to understand, They
function on the inherent difficulty of factoring two VERY large prime numbers
multiplied together. Current NIST standard is that 2048-bit keys are sufficiently
large. There is a lot of debate on the value of larger keys.

RSA is VERY slow compared to DSA and ECC keys. Google and Cloudflare
both use ECC keys on their publicly facing sites.

### Generate a key

```bash
openssl genrsa 2048 
```

Some time recently, openssl was updateded to produce PKCS#8 formatted
keys. The usability of these will vary depending on where you're trying
to use them. If the output you get from `genrsa` looks like this:

```
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDNdN/aXjV/+yTk
```

...then you have a PKCS#8 formatted key (more on those later)

If you want a traditionally formatted key, use:

```bash
openssl genrsa 2048 -traditional
```

--

## Generating DSA keys

DSA keys (as well as ECC keys) require parameters to be generated first,
befor the key can be created. This process can be done separately, or in
a single command.

### Generate DSA parameters

```bash
openssl dsaparam 1024 > params.dsa
```

### Generate the key

```bash
openssl gendsa params.dsa
```

Again, if you're using a new enough version of `openssl` you might see

```
-----BEGIN PRIVATE KEY-----
```

...instead of...


```
-----BEGIN DSA PRIVATE KEY-----
```

Unfortunately, the `gendsa` command doesn't have a `-traditional` flag, but you
can get the traditionally formatted DSA key by running it through `openssl dsa`
or `openssl pkcs8 -nocrypt -traditional`.

To generate a DSA key directly, you can pass the `-genkey` parameter
to `dsaparam`, which will generate the parameters and the key at the same
time. You can then run it through `dsa` to filter out just the key or use the `-noout`
flag:

### One-step DSA key generation

```bash
openssl dsaparam -genkey 1024 | openssl dsa 2>/dev/null
```

OR

```bash
openssl dsaparm -noout -genkey 1024 | openssl pkcs8 -nocrypt -traditional
```

---
# ECC Keys

Start by getting a list of curves your implementation of openssl supports.

### NOTE:
On MacOS and other BDS variants, this will be MUCH larger than available curves
on Linux.

```bash
openssl ecparam -list_curves
```

### Generate an ECC key

```bash
openssl ecparam -name prime256v1 -genkey -noout
```
