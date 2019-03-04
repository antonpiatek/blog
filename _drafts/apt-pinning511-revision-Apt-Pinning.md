---
id: 512
title: Apt-Pinning
date: 2009-04-22T17:15:38+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2009/04/22/511-revision/
permalink: /2009/04/22/511-revision/
---
If you run a Debian or Ubuntu system and have more than one release in your apt-sources file (/etc/apt/sources.list) then you should probably learn the basics of apt-pinning. Apt-pinning allows you to have a specific package stay at a certain level or set a preference for it to be installed from a specific release. This way you can have the latest version of package X from a cutting-edge server without worrying about the rest of your packages moving up to cutting-edge levels by accident.

Two excellent resources are:

  * [AptPinning &#8211; Debian Wiki](http://wiki.debian.org/AptPinning)
  * [howtoforge &#8211; A short introduction to apt-pinning](http://www.howtoforge.com/a-short-introduction-to-apt-pinning)