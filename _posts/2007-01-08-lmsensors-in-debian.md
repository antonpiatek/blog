---
id: 195
title: lmsensors in Debian
date: 2007-01-08T19:57:36+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2007/01/08/lmsensors-in-debian/
permalink: /2007/01/08/lmsensors-in-debian/
categories:
  - Debian
---
I was searching for how to get lmsensors running, and came a cross this [Howto at wolfgang.lonien.de](http://wolfgang.lonien.de/?p=171)

It says it all really. For a crash course, try:

> sudo apt-get install lm-sensors sensord hddtemp sensors-applet ksensors gkrellm  
> sudo /usr/sbin/sensors-detect

Then fire up gkrellm, or ksensors and you should be able to get the temperature of your system, various fan speeds and if you are lucky even the temperature of your hard drives!