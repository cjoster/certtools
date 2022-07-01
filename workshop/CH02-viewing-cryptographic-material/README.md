# Viewing cryptographic material

All useful commands to `openssl` have a `-text` option, which will print out
the object in plain text. This is useful to check things like expiration date,
issuer, subject-alternative-names and the like. As an example, take a look at the certificate
in this directory:

## <a name="hard"></a> Viewing a Certificate (the hard way)

```bash
openssl x509 -in vmware.com.crt -text -noout
```

The `-noout` flag tells openssl not to print out the x509 certificate at the end
of the listing. If you're just viewing the certificate to verify what's contained in it,
printing the PEM-encoded certificate is not important.

## Viewing a private key

Likewise, there's a `-text` and a `-noout` flag for the `rsa` command to view
a private key. This is only so useful but it is included here for completeness.

```bash
openssl rsa -in example.key -text -noout
```

For those curious about the size of the number that you must factor to break this key, you
can get it with the following command (in American digit groupings):

```bash
(echo ibase=16;openssl rsa -in example.key -noout -modulus | sed 's/.*=//') | bc | tr -d '\n\\' | rev | sed 's/\(...\)/\1,/g' | sed 's/,$//' | rev; echo
```

## Viewing a certificate signing request before sending it to your CA

It's always a good idea to double check your CSR to make sure it has everyting in it you want before sending
it to a possibly money-costing certificate authority. After generating a CSR, you can check it with:

```bash
openssl req -in example.csr -text -noout
```

## Viewing a live certificate on the internet

The `openssl` command has a very handly `s_client` subcommand. It's short for "secure client"
and allows you to connect to a network resource and issue requests by hand--if you've evern `telnet`'ed to
a web server and issue a request (or any other plain-text resource), this is the way to do
it via TLS.

```bash
openssl s_client -connect google.com:443 -servername google.com
```

Pay particular attention to the `-servername` flag. While we used the hostname to lookup the address and
make the connection, you could very easily have just used an IP address in cases where, for example, when DNS is not setup yet
or not setup correctly. This flag let's you set the SNI field in the TLS 1.2+ hello message so that L4+ loadbalancers
can do their thing correctly (think HTTPProxies in contour/envoy).

If you want to issue a request, you can simply type it in here. Note that there are TWO carriage returns in a
row at the end--this signifies the termination of the request headers.

```
GET / HTTP/1.1
Host: www.google.com

```

...And you'll get Google's home page.

### Putting it all together

You can stop the `s_client` command from expecting input from the terminal by disrupting its standard in. This
can be done one of two ways. Either `echo |`--although I like to not send it anything, not even the carriage return,
and I also like to explicitly put the empty string `""` in that echo as well so that it is entirely explicit what it
is doing.

Another way to do this, and this is handy when you're already started typing the command is to `< /dev/null` at the end
of the `s_client` command. 

```bash
echo -n "" | openssl s_client -connect vmware.com:443 -servername vmware.com | openssl x509 -text -noout | less
# -OR-
openssl s_client -connect vmware.com:443 -servername vmware.com < /dev/null | openssl x509 -text -noout | less
```

### SNI Explained

Server Name Indication (SNI) is a header that is set in the TLS client-hello segment of the initial TLS handshake.
It's how the modern web ~~continues to idiotically double down on IPv4~~ efficiently makes use of IP addresses. If
you connect to an IP address alone, and it's some kind of load-balancer, the SNI is how the load-balancer figures out
where to route the traffic. It's how Contour/Envoy work. It's how AWS ALB's work. It's how the web works.

So, here's an example. No affiliation, just Wix was the first load balancer I could find that refuses to present
a certificate if no SNI is present. Also, the websites are meaningless...simply examples taken from Wix's blog.

```bash
dig +short animalmusicweb.com
```

Which returns `185.230.63.186` (at least it did when this was written) as the IP address. But look what
happens when we connect just to the IP address

```bash
openssl s_client -connect 185.230.63.186:443 < /dev/null
```

...you don't get a certificate.

But, give it a hostname:

```bash
openssl s_client -connect 185.230.63.186:443 -servername animalmusicweb.com < /dev/null
```

And you'll see a certificate with a SubjectAltName for animalmusicweb.com.

Now try a different one.

```bash
openssl s_client -connect 185.230.63.186:443 -servername www.ravin.ai < /dev/null
```

# <a name="easy"></a> Viewing Certificates (the easy way)

There is a tool in the `/bin` directory that will display the plain-text certificate information of
a file (PEM or DER) encoded, a YAML config file, or a service on the internet.

```bash
view_cert vmware.com
```

View the help for the tool:

```bash
view_cert -h
```

SNI example

```bash
view_cert 185.230.63.186 www.ravin.ai
```
