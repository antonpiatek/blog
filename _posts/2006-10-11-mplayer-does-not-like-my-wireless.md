---
id: 161
title: mplayer does not like my wireless
date: 2006-10-11T19:38:25+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/10/11/mplayer-does-not-like-my-wireless/
permalink: /2006/10/11/mplayer-does-not-like-my-wireless/
categories:
  - Linux
  - Misc
---
I don&#8217;t know if it is the wpa encryption, or just the extra latency of wireless, but mplayer plays funnily over my new wireless lan.

I figured out how to make mplayer work _mplayer -cache 4096_ certainly made it work, but did mean several seconds longer startup as it had to cache another 4Mb of data before beginning playback. I could put that option in my mplayer config file and then I won&#8217;t have to type it, but it is not the proper solution. Really I want the mounted network filesystem to do some read ahead caching for the data, but I have no idea whether samba can do it (I certainly cannot find an option for it).

I suppose I could look at using nfs to share my files (this is between 2 linux machines after all) but have never done much with nfs, so don&#8217;t know if it will actually work any better.

Anyone know a samba option or used nfs much?