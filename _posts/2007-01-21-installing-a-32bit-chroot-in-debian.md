---
id: 199
title: Installing a 32bit chroot in Debian
date: 2007-01-21T16:49:11+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2007/01/21/installing-a-32bit-chroot-in-debian/
permalink: /2007/01/21/installing-a-32bit-chroot-in-debian/
categories:
  - Debian
---
My home PC is an AMD64 box, so when I installed linux I installed 64 bit Debian (why not use the power I can get from the hardware I have bought). Unfortunately there are several programs that don&#8217;t exist in 64 bit versions. So far just Skype, Flash, picasa and Bibble (if I decide to buy a copy) are the only things I coudn&#8217;t run. All Open Source software in Debian is pretty much already compiled in 64 bit for you (Debian have a wonderful build process which compiles for all architectures that are possible (and supported by Debian)).  
I looked at the [instructions for installing a 32 bit chroot](https://alioth.debian.org/docman/view.php/30192/21/debian-amd64-howto.html#id292281) and thought it was going to be rather difficult. It turns out it was incredibly simple. It took a few hours to download everything I need (basically a 2.4Gb second copy of Debian :-s ) but now I have all the above running happily, and I can barely tell that they are technically running on a second copy of linux. Using &#8220;schroot&#8221; (as explained in the instructions&#8221; allows me to run &#8220;skype&#8221; and it runs the 32 bit copy for me, I don&#8217;t notice&#8230;