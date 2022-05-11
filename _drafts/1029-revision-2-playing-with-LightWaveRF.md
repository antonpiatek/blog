---
id: 1032
title: playing with LightWaveRF
date: 2013-03-06T20:11:37+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2013/03/06/1029-revision-2/
permalink: /2013/03/06/1029-revision-2/
---
Following on from [Benjie&#8217;s excellent breakdown of the LightWaveRF protocol](http://www.benjiegillam.com/2013/02/lightwaverf-rf-protocol/), and him lending me a [433Mhz transmitter and receiver](http://www.ebay.co.uk/itm/RF-Wireless-Transmitter-and-Receiver-Link-Kit-Module-433Mhz-For-Remote-Control-/350628314207?pt=UK_Gadgets&hash=item51a3137c5f), I have had a go at controlling my lights from a pc with an arduino.

The hardware setup is trivial &#8211; as Benjie did, wire the power and ground to the transmitter and receiver, the receivers data pin to arduino pin 3, and the transmitter pin to arduino pin 4. You will probably want to solder on an antenna too.

The [arduino sketch](https://github.com/antonpiatek/rf-experiments/blob/master/signal_capture.ino) should be fine as-is, so just upload it to your arduino.

For the software side on your PC, you can either go with Benjie&#8217;s coffee script code (which is probably better than my code to be honest). You will need [NodeJS installed](http://nodejs.org/), and the [Node Serial Port module](https://github.com/voodootikigod/node-serialport/blob/master/README.md) installed (this is quick if you add the NodeJS bin folder to $PATH, then you can use `npm install serialport` to install it to the current dir, so do it from nodepath/lib/. You will need to export that dir with  export NODE\_PATH=path\_to\_node/lib/node\_modules for node to find it though.)

&nbsp;

My &#8220;mood&#8221; button set 0x82 for the level, which from Benjie&#8217;s breakdown of moods is the third one &#8211; and odd number, but with only the one remote and one mood button I can&#8217;t say much more