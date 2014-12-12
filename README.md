backdoorBash
============

Unix remote-shell backdoor develop with Bash, Netcat, OpenSSL (data encryption with AES-128bit)

## Introduction

This project is associated to the others mine : 
- https://github.com/pilebones/etterfilterSamples
- https://github.com/pilebones/hostingBackdoorInstaller

The main goals of this project is to implement an attack scenario as below : 
- Implement backdoor like remote-shell with Bash
- Attack Man In the middle with Ettercap (like ARP Spoofing)
- Hosting a backdoor installer
- Automate data alteration to inject our backdoor inside the computer of target by a browser
- If the target run (naively) the script (ie: the backdoor installer) without reading code source the computer is infected and the attacker can obtain a remote access command
- Detect and prevent this kind of attack with NIDS tool as Snort

Notice :
- The programming language was choose only for a Proof of Concept (POC)
- The socket layer is assumed by a portable version of Netcat. I compiled Netcat for i686 and x86_64 computer architecture a put the binary inside this project.
- The transmited data were encrypted with AES-128 (without using Cryptocat). The data are encrypted on the fly via OpenSSL.

## Requirements

- openssl (tested with v1.0.1j)
- ettercap (>= v0.8.1)
- etterfilter (>= v0.8.1)
- etterfilter (>= v0.8.1)
- netcat (The compiled version is "The GNU Netcat" v0.7.1)

## How it work ?

### Simple test

```bash
git clone git@github.com:pilebones/backdoorBash.git
cd backdoorBash
cp config.sh.sample config.sh 
vim config.sh
./server.sh
./client.sh
```
.... And try to execute some shell command

### Real condition

## Limitations

This backdoor is writing in bash programming language => It work only on Unix OS.
Currently, tested only on :
- Archlinux -
- Debian 7 
- Ubuntu 14.10

## References

