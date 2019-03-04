---
id: 179
title: pocket pc sync in linux
date: 2006-11-16T20:47:57+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/11/16/pocket-pc-sync-in-linux/
permalink: /2006/11/16/pocket-pc-sync-in-linux/
categories:
  - Linux
  - Technology
---
So i decided to look for ways to sync my PocketPC powered XDA IIs in linux. Sure I could sync it in windows if I wanted to use Outlook as an email program (which I most certainly don&#8217;t). I found that it is relatively easy to sync with KMail. I personally prefer Thunderbird, but as there is not that much between the two, I will happily use the KDE offering in return for the ability to sync to my PDA.

So what is needed?  
I installed synce-kde which allows you to connect your pda, along with syncekonnector which has the synchronising mechanism to sync with KMail.  
Running it all was a bit odd, first off I had to select a serial port (their wording, not mine) of ttyUSB0 (which is the USB hub, and not the actual ports. Then launching Raki (a part of synce) allowed me to start up a daemon to launch the thing, yet it didn&#8217;t work. Googling revealed that I have to run synce-serial-start (I had to do a synce-serial-config ttyUSB0 too) and then the device came alive. Tick a few boxes and my contacts, tasks and calendar are all in the base KDE apps!

Excellent!

Just be careful with recurring entries. At the moment syncing a recurring entry from Kmail to your pda causes the calendar to crash (and on mine this caused a memory leak which killed the whole pda!).