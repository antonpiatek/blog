---
id: 185
title: nvidia in debian
date: 2006-11-26T14:39:50+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/11/26/nvidia-in-debian/
permalink: /2006/11/26/nvidia-in-debian/
categories:
  - Debian
---
Since I last had to install the nvidia drivers in debian, things have changed a bit.

It used to be fiddly to get the nvidia drivers installed, but if you are running etch (or later) you should just be able to run (as root)

`</p>
<blockquote><p>apt-get install module-assistant nvidia-kernel-common nvidia-glx<br />
module-assistant auto-install nvidia<br />
module-assistant install nvidia</p></blockquote>
<p>`

Then just edit your X config (/etc/X11/xorg.conf) and change the driver line with &#8220;nv&#8221; to &#8220;nvidia&#8221; and restart your window manager and all should be running.

There is a wonderful howto with loads more detail at <http://home.comcast.net/~andrex/Debian-nVidia/installation.html>