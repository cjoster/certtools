# OpenSSL

OpenSSL is the swis-army-knife of cryptographic systems. Each it has a modular sub-command mechanism where
by you specify the subcommand immediately after the `openssl` command.

# Useful OpenSSL modules

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

\* `genpkey` can technically generate any private key using any supported algorithm, but
its systax is clunky. It is, however, really the only way to generate more obscure EC keys,
like curve 25519, ED448, etc.
