---
id: 568
title: powerline networking
date: 2009-09-30T12:00:47+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=568
permalink: /2009/09/30/powerline-networking/
aktt_notify_twitter:
  - 'yes'
aktt_tweeted:
  - "1"
categories:
  - Misc
  - Technology
tags:
  - networking
  - power
---
After moving into our new house, I contemplated running a pile of ethernet cables before we got the new carpets laid, as I have always had issues with wireless. In the end I didn&#8217;t find the time to rip up floorboards and skirting boards to lay the cables I wanted, and as it turns out the solid brick walls reduce the wireless networking strength down to almost useless (it sometimes connects upstairs, and sitting at the wrong side of the dining-room table loses the signal).

I decided that powerline networking might be a better solution. I looked at [linksys&#8217; range](http://www.linksysbycisco.com/UK/en/products/PowerLine) and decided on the [PLK300 kit](http://www.linksysbycisco.com/UK/en/products/PLK300) which is a 200mbpss kit with a 1-port adapter, and a 4-port adapter. I suspect that 200mbit means 100mbit/s in real terms as powerlines have only one pair of wires, so it is simples (as opposed to ethernet&#8217;s two pair that gives full duplex).

Getting the encryption was simple enough &#8211; press the right incantation of buttons, but I actually have no way of testing the encryption works. As for real-world speeds, I only get about 4-5Mb/s (32-40mbit/s) which is not as fast as I was hoping, but the wiring in my house is probably quite old and it is going from the downstairs power ring to the upstairs ring. I think it is probably fast enough, and as wireless is slower (and less reliable) the only other alternative is carving up the floor and walls to run cable &#8211; and I am too lazy&#8230;

Of course, as the devices are just ethernet bridges, it works seamlessly with linux and my existing network, and has almost no configuration. The power rating of these devices totals about 50W, but they seem to use less than that according to my Current Cost meter.