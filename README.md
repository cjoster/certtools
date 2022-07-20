# Cert Tools

This is a repository to hold some tools I've written to help diagnose
TLS issues related to certificates. It also contains some helper tools
to manipulate TLS key and certificate materials.

You can install the tools in this repo by running `./install.sh`. It will
install them into the first writable directory it finds. If you have no
writable directories in your path, add one first...

```bash
echo "mkdir -p ~/bin && echo "export PATH=\"\${PATH}\":~/bin" >> ~/.bash_profile && . ~/.bash_profile"
```

...and then install the tools...

```bash
./install.sh
```

If you `sudo ./install.sh` it will attempt to place them into `/usr/local/bin` before trying
other elements of the path.
