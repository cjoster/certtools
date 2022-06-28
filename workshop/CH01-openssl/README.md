# OpenSSL

OpenSSL is the swis-army-knife of cryptographic systems. Each it has a modular sub-command mechanism where
by you specify the subcommand immediately after the `openssl` command.

## Useful OpenSSL modules

| Sub-command | Used For |
| - | - |
| `x509` | Viewing, creating, converting X.509/TLS certificates |
| `req` | Viewing, creating, signing certificate signing requests |
| `genrsa` | Generating RSA private keys |
| `rsa` | Viewing converting RSA private keys |
| `dsa` | Viewing and converting DSA private keys | 
| `dsaparam` | Generating DSA parameters and private keys |
| `ecparam` | Generating ECC parameters and private keys |
| `genpkey` | Generating private keys \* |
| `pkcs7` | Manipulating PKCS#7 files (.p7b, .p7a files from Windows CA's) |
| `pkcs12` | Manipulating PKCS#12 files (.pfx, .p12 files from Windows CA's) |
| `CA` | Performing certificate authority actions |
| `s_client` | Manually connecting and interacting with a TLS-protected endpoint |
| `asn1parse` | Packs and unpacks ASN.1 formatted data objects |

\* `genpkey` can technically generate any private key using any supported algorithm, but
its systax is clunky. It is, however, really the only way to generate more obscure EC keys,
like curve 25519, ED448, etc.

## Documentation

### Linux

On Linux systems, getting at the documentation for OpenSSL sub-commands is done two ways. On older distributions
you run `man <subcommand>`; e.g. `man genrsa`. The command `man openssl` will give you a list of the subcommands.
On more recent releases of Linux distrubitions, this mechanism has moved to `man openssl-genrsa` and the
man page of `genrsa` takes you to the main OpenSSL man page.

### MacOS

On MacOS, you most likely have libreSSL, which is a fork of the OpenSSL project from a while ago. While the project
claims superiority to OpenSSL, the documentation certainly is not. On MacOS, `man openssl` gives you just a big
monolithic man page. Searching for `openssl asn1parse`, for example, is a good way to find what you're looking
for.

### Windows

Um. I got nothin'. F1 maybe?
