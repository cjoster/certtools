You can make a certificate signing request in one line pretty quickly
the problem is that modern certificate usages really benefit--and almost require
the use of what's called *subject alternative names* (subject alt names, or SANs).
In order to use SAN's, you have to get an OpenSSL config file involved.

Here's a minimal config file that works for most servers:

``` 
[ req ]
distinguished_name              = req_dn
default_md                      = sha256
req_extensions			= req_ext

[ req_dn ]
countryName                     = Country Name (2 letter code)
stateOrProvinceName             = State or Province Name
localityName                    = Locality Name
0.organizationName              = Organization Name
organizationalUnitName          = Organizational Unit Name
# commonName is deprecated
commonName                      = Common Name (e.g. your hostname)

countryName_default             = US
stateOrProvinceName_default     = California
localityName_default            = Palo Alto
0.organizationName_default      = VMware, Inc
organizationalUnitName_default  = Tanzu Labs
commonName_default              = www.myserver.com

[ req_ext ]
basicConstraints = critical, CA:false
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectKeyIdentifier = hash
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = mail.myserver.com
DNS.2 = *.otherserver.com
# IP addresses are frowned upon in certs, but some like to do it
# the problem is that they put them in as DNS entries
IP = 1.2.3.4
```

Save this file as `site.cnf`, and create your certificate signing request
from the configfile as follows:

```bash
openssl req -new -key site.key -config site.cnf -batch -out site.csr
```

After creating your CSR, it is always a good idea to check 


```bash
openssl req -in site.csr -text -noout
```
