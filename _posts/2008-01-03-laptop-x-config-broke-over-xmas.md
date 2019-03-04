---
id: 312
title: Laptop X config broke over xmas
date: 2008-01-03T19:00:18+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2008/01/03/laptop-x-config-broke-over-xmas/
permalink: /2008/01/03/laptop-x-config-broke-over-xmas/
categories:
  - Debian
---
I got back to work yesterday to find that my laptop no longer started X properly. I spent ages trying to get X working again with the **ati, fglrx** and  **radeon** drivers with no luck.

I noticed initially that the console was loading a high resolution during bootup, which is wasnt doing before, so suspected something had changed with the framebuffer config. I searched but couldnt figure out where this was being set.

Then I noticed a error message in the startup that said that /etc/modprobe.conf was not including /etc/modprobe..d/  
Reading the man page for modprobe.conf revealed that without a config file,all files in the directory are read. So I moved the config file out of the way, and X started working properly again, the framebuffer stopped being used, and the system went in and out of suspend properly.

The framebuffer would be nice for a slash bootup screen, but I prefer the rest of the above working&#8230;