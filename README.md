backdoorBash
============

Unix remote-shell backdoor develop with Bash, Netcat, OpenSSL (data encryption with AES-128bit)

## Introduction

This project is associated to the others mine : 
- https://github.com/pilebones/etterfilterSamples
- https://github.com/pilebones/hostingBackdoorInstaller

The main goals of this project is to implement an attack scenario as below : 
- Attack Man In the middle with Ettercap (like ARP Spoofing)
- Hosting a backdoor installer
- Automate data alteration to inject our backdoor inside the computer of target by a browser
- Implement a backdoor with Bash (language choose just for the POC..) socket layer is assumed by a portable version of Netcat (I compiled Netcat for i686 and x86_64 computer architecture a put the binary inside this project).
- If the target run (naively) the script (ie: the backdoor installer) without reading code source the computer is infected and the attacker can obtain a remote access command
- Detect and prevent this kind of attack with NIDS tool as Snort

## Requirements

- openssl (tested with v1.0.1j)
- ettercap (>= v0.8.1)
- etterfilter (>= v0.8.1)
- etterfilter (>= v0.8.1)
- netcat (The compiled version is "The GNU Netcat" v0.7.1)

## How it work ?

## References

