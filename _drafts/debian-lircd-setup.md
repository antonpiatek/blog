---
id: 178
title: debian lircd setup
date: -0001-11-30T00:00:00+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=178
permalink: /?p=178
---
apt-get install linux-headers-2.6.17-2-k7 lircd lirc-modules-source  
cd /usr/src  
ln -s linux-headers-2.6.17-2-k7 linux  
cd linux; fakeroot make-kpkg modules-image &#8211;append-to=-2-k7  
dpkg -i /usr/src/lirc-modules-2.6.17-2-k7\_0.7.1pre2-6+2.6.17-10.00.Custom\_i386.deb

dpkg-reconfigure setserial  
add &#8220;/dev/ttyS0 uart none&#8221; to /etc/serial.conf