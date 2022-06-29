# Troubleshooting Typical TLS Certificate issues


| Error Message | What's wrong | How to fix it |
| - | - | - |
| Certificate is expired | The certificate has expired. | <ol><li>Double check system-clock.</li><li>Use `view_cert` to verify the dates on the certificate</li><li>Submit your CSR or regenerate your certificate with correct dates.</li></ol> |
| Certificate is not yet valid | You somehow have managed to get a future-valid certificate | See "Certificate is expired" steps |
| Certificate valid for abc.com, def.com but not xyz.com | <ol><li>Certificate subject-alt-names are not there or wrong</li><li>You are using the wrong URL</li><li>DNS is misconfigured and sending your queries to the wrong server.</li></ol> | <ol><li>Use `view_cert hostname` or `view_cert IP hostname` to see the names in the certificate.</li><li>Double check the URL you're using for your request.</li><li>Check that DNS is sending your requests to the right IP address using `dig hostname`</li></ol> |
| Certificate signed by unknown authority | There are errors in the certificate chain | One of: <ol><li>The host is not presenting the intermediate certificate</li><li>Your verifying host does not trust the root certificate.</li></ol> | <ol><li>Use `get_chain` to see the certificate chain. Break the chain into certs and use `view_cert` to verify the chain. `openssl verify` is also a good tool for this.</li><li>Obtain the root certificate and install it into the machine doing the validation.</li></ol> |
| Certificate is self signed | The certificate is self-signed. | Obtain a certificate signed by a real CA. |
| Cannot get local issuer certificate | A chain has been built, but you do not trust the root locally. | Install the root CA certificate into the machine attempting to verify the chain |

# How to install certificates

### Debian, Ubuntu and other debian-based distros

```bash
cp my-ca.crt /etc/ssl/certs/
update-ca-certificates
```

### Amazon, Fedora, RHEL, Scientific, OEL, etc

```bash
cp my-ca.crt /etc/pki/ca-trust/source/anchors/
update-ca-trust
```

### Photon

```bash
cp my-ca.crt /etc/ssl/certs
rehash_ca_certificates.sh
```	
