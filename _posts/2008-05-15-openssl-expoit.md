---
id: 358
title: OpenSSL expoit
date: 2008-05-15T12:41:38+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=358
permalink: /2008/05/15/openssl-expoit/
categories:
  - Debian
  - Linux
---
I am sure you have all ready about the OpenSSL exploit that was recently found in Debian:  
<http://lists.debian.org/debian-security-announce/2008/msg00152.html>

It is worth noting that the exploit affects any keys that were built on a debian box after sarge (so etch, lenny, current sid). This also means that any box that has those keys as an authentication method is vulnerable too:

<http://blog.drinsama.de/erich/en/linux/2008051401-consequences-of-sslssh-weakness.html>

Because any of those boxes could already be compromised, if you are paranoid you should be careful about logging in with passwords to them too &#8211; basically if you are paranoid then you can&#8217;t really trust anything (so business as normal for paranoid people)

In order to fix your keys, you should probably do the following (thanks to [Hugo Mills](http://www.hants.lug.org.uk/lurker/message/20080513.191226.269a6c44.en.html))

on all boxes you own

  * Install the patch
  * Delete the following files if the host keys are likely to be vulnerable: 
      * /etc/ssh/ssh\_host\_dsa_key*
      * /etc/ssh/ssh\_host\_rsa_key*
  * Generate new host keys: 
      * sudo dpkg-reconfigure -plow openssh-server
  * Restart the ssh daemon

And on all boxes you have access to via keys

  * Delete the following files: 
      * ~/.ssh/authorized_keys
      * ~/.ssh/id_*
  * Generate new personal keys: 
      * ssh-keygen -t rsa -b 4096