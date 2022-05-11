---
id: 696
title: Running a personal server
date: 2010-06-27T19:28:13+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/06/27/693-revision-3/
permalink: /2010/06/27/693-revision-3/
---
Maybe you read some of my posts on [software raid and lvm](http://www.strangeparty.com/2008/05/24/software-raid1-and-lvm-on-debian-etch/), or maybe you have a spare pc lying around and want a box you can use as a small personal server and are wondering about some tips for running it with less hassle. I am sharing a few things that I have learnt about running a personal server (though some will apply to any Linux server or always-on machine) that make my life as a part-time admin easier. This is by no means an exhaustive list, nor necessarily the _correct way_ to run a box, but it works well for me and so should be useful to others as well.

## ADSL port forwarding

If your box is behind an ADSL modem (and unless you have a professional server and datacentre to put it in, it probably is) then by default the NAT addressing and firewall will mean that you cannot get in remotely to your box. This may be fine if you don&#8217;t want anything from the box accessible, but I tend to like being able to ssh in from anywhere, so you need to set up some port forwarding from your ADSL router/modem to get into your box

I wont attempt to describe how your ADSL modem/router config works, you&#8217;ll have to read it&#8217;s manual, but the ports you probably want are:

> ssh 22 &#8211; if you want to log from outside your home network with ssh  
> smtp 25 &#8211; if you want your box to be able to receive email  
> ftp 21 &#8211; if you want ftp (though I recommend sftp or scp which use ssh and therefore encrypt your password and data)  
> http 80 &#8211; if you want webpages visible from the internet  
> https 443 &#8211; if you want webpages visible from the internet and want to use https encrypted http 

## Mail

I really want mail configured for delivery, as that is one of the easiest ways to get alerts from your machine (though twitter could be cool too though). If you have a email to smms gateway or smartphone with push email then these alerts can be very fast and direct.

I use exim, not because it is the fastest or most configurable mail system available, but because it is very easy to get configured and running on Debian or Ubuntu. Simply install the exim4 package and the debconf wizard will get you up and running.

> <pre>sudo aptitude install exim4
</pre>

The wizard, which can be re-run with the command _sudo dpkg-reconfigure exim4-config_, asks you how you want to configure exim. Normally you select the first or second option (&#8220;internet site; mail is sent and received directly using SMTP&#8221; or &#8220;mail sent by smarthost; received via SMTP or fetchmail&#8221;). Most of the questions come with sensible defaults. If you selected the second option you will get asked what your smarthost for sending mail is, in many cases this is just mail.your.isp or you can use google if you have an account, but it will require authentication which which is a little more complicated to set up.

Next you want to set all email for &#8216;root&#8217; to forward to you preferred email address.  
Edit _/root/.forward_ to look like this

> <pre># Exim filter   &lt; &lt;== do not edit or remove this line!

if error_message then finish endif

deliver me@myemail.com
</pre>

You can test sending email with a simple command line of _mail root -s test_ followed by a message and then CTRL+d. You should get the email at your address set above

## Logwatch

## Raid emails

## Smart disk monitoring

## Toughening SSH