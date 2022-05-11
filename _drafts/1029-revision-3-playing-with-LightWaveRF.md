---
id: 1051
title: playing with LightWaveRF
date: 2013-06-16T13:44:46+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2013/06/16/1029-revision-3/
permalink: /2013/06/16/1029-revision-3/
---
Following on from [Benjie&#8217;s excellent breakdown of the LightWaveRF protocol](http://www.benjiegillam.com/2013/02/lightwaverf-rf-protocol/), and finding an [ebay supplier of 433Mhz transmitter and receiver kits](http://www.ebay.com/itm/New-433Mhz-RF-transmitter-module-and-receiver-link-kit-for-Arduino-ARM-MCU-WL-/130818054630?ssPageName=ADME:L:OU:GB:3160) who actually knows what they are selling (The first two couldn&#8217;t guarantee the frequency and I had to send one order back as they were illegal to use in the UK), I have had a go at controlling my lights from a pc with an arduino.

The hardware setup is trivial &#8211; as Benjie did, wire the power and ground to the transmitter and receiver, the receivers data pin to arduino pin 3, and the transmitter pin to arduino pin 4. You will probably want to solder on an antenna too.

The arduino sketch should be fine as-is, so just upload it to your arduino.

For the software side on your PC, you can either go with Benjie&#8217;s coffee script code (which is probably better than my code to be honest). You will need [NodeJS installed](http://nodejs.org/), and the [Node Serial Port module](https://github.com/voodootikigod/node-serialport/blob/master/README.md) installed (this is quick if you add the NodeJS bin folder to $PATH, then you can use `npm install serialport` to install it to the current dir, so do it from nodepath/lib/. You will need to export that dir with `export NODE_PATH=path_to_node/lib/node_modules` for node to find it though. (This took me some time to figure out!))

Or you can use my perl scripts if you prefer. Take your pick of [my github repository](https://github.com/antonpiatek/rf-experiments), or [Benjie&#8217;s](https://github.com/benjie/rf-experiments).

To run the perl you should just be able to run `read_lwrf.pl` assuming your serial port devices are the same as mine

Benjie has a rather good writeup of thelightwave protocol, so I won&#8217;t bother repeating what he said, however I found my My &#8220;mood&#8221; button set 0x82 for the level, which from Benjie&#8217;s breakdown of moods is the third one &#8211; and odd number, but with only the one remote and one mood button I can&#8217;t say much more. I also found that there are several ranges for setting light levels, one sets just the one light, another range sets all lights. So you can set a specific light or all lights which recognise that remote to a specific level. Similar commands for increasing and decreasing the levels of brightness, either for a single light or all lights.

The actual code are comments in my [perl module](https://github.com/antonpiatek/rf-experiments/blob/master/Lightwave.pm), but I am also putting them here for discussion:

> <pre id="LC338">Level 00 used for on/off
Level 40 sometimes sent as a repeat for off
Level C0 used on button D4 for "all off"
Level 82 used on button D4 with cmd MOOD for mood (mood 2?)
Level 02 used on button D4 with cmd MOOD to set current levels as mood (mood 2?)
Level BF used to increase brightness
Level A0 used to decrease brightness</pre>