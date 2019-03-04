---
id: 180
title: Booting Debian with root (/) on LVM2
date: 2006-11-16T20:51:21+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/11/16/booting-debian-with-root-on-lvm2/
permalink: /2006/11/16/booting-debian-with-root-on-lvm2/
categories:
  - Debian
---
So I got 2 new pc&#8217;s recently. One was a complete reinstall job, playing with the new Debian Etch installer. Unfortunately the kernel it came with was too old to support lvm at boot time, so even though I installed initramfs-tools it would not find my root partition in lvm. I had to use a rescue disk to upgrade to a newer kernel and initramfs-tools.

My other box was far more fun. I tried to move it to LVM. I made a copied the data from / into my new LVM root partiton, rebooted and found that I could not boot off LVM. Installing initramfs-tools and a newer kernel worked, but then I tried to resize my old partition smaller and make it just a boot partition, which killed grub. So a boot disk came back and I had to reinstall grub, which was full of hassle. 

I do have both working now, so with a bit of effort it is possible.