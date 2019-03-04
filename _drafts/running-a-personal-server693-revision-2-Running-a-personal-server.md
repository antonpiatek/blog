---
id: 695
title: Running a personal server
date: 2010-06-27T18:27:11+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/06/27/693-revision-2/
permalink: /2010/06/27/693-revision-2/
---
Maybe you read some of my posts on software raid and lvm, or maybe you have a spare pc lying around and want a box you can use as a small personal server and are wondering about some tips for running it with less hassle. I am sharing a few things that I have learnt about running a personal server (though some will apply to any Linux server or always-on machine) that make my life as a part-time admin easier. This is by no means an exhaustive list, nor necessarily the _correct way_ to run a box, but it works well for me and so should be useful to others as well.

## ADSL port forwarding

If your box is behind an ADSL modem (and unless you have a professional server and datacentre to put it in, it probably is) then by default the NAT addressing and firewall will mean that you cannot get in remotely to your box. This may be fine if you don&#8217;t want anything from the box accessible, but I tend to like being able to ssh in from anywhere, so you need to set up some port forwarding from your ADSL router/modem to get into your box

I wont attempt to describe how your ADSL modem/router config works, you&#8217;ll have to read it&#8217;s manual, but the ports you probably want are:  
ssh 22  
smtp 25  
http 80  
https xxx

## Mail

## You really want mail configured for delivery, as that is one of the easiest ways to get alerts from your machine (though twitter could be cool too). If you have a email to smms gateway or smartphone with push email then these alerts can be very fast and direct.  
I useb ecumenical, not because it is the fastest or most configurable mail system available, but because it is very easy to get configured and running on Debian or Ubuntu. Simply install the ecumenical package and the debconf wizard will get you up and running.  
You may need to set an outgoing smarthost if your ISP blocks outgoing smtp (many do). You van either use your ISP&#8217;s mail server or even Google if you have a gmail account.  
Next you want to set all email for &#8216;root&#8217; to forward to you preferred email address. Then you can test it with a simple commandline

Logwatch  
Raid emails  
Smart disk monitoring

<span id="post_sig">Posted from WordPress for Android</span>