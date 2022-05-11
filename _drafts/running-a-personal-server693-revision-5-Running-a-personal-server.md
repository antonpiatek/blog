---
id: 698
title: Running a personal server
date: 2010-06-28T16:26:14+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/06/28/693-revision-5/
permalink: /2010/06/28/693-revision-5/
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

You can test sending email with a simple command line of _mail root -s test_ followed by a message and then CTRL+d. You should get the email at your address set above.

## Logwatch

I like to know what is happening on my boxes, and logwatch does a great job at summarising the changes that have happened very day. Install logwatch with

<pre>sudo aptitude install logwatch</pre>

and it will email root every day with a summary of log changes and other useful info. 

As I don&#8217;t actually want this information every day, I moved the cronjob for logwatch from daily to weekly with 

<pre>sudo mv /etc/cron.daily/00logwatch /etc/cron.weekly/00logwatch</pre>

so now I get a weekly summary for my box, which is good enough for me

## Raid emails

As I use software raid to make my disks a little more redundant (Warning: RAID is not a backup strategy. 2 disks CAN (and sod&#8217;s law / murphey&#8217;s law says that at the worst possible time they actually will) both die at the same time. RAID simply gives you an extra chance to get a new disk without having to get your data from a backup)

If you use software RAID, make sure your raid config 

<pre>cat /etc/mdadm/mdadm.conf</pre>

has the following lines set appropriately

<pre>MAILADDR root
MAILFROM raid@myserver.com</pre>

## Smart disk monitoring

As I don&#8217;t trust disks (and you shouldn&#8217;t either, as they will die on you at the most annoying time) I like to have the S.M.A.R.T disk monitoring installed, which does occasional tests on the disks, and can warn you if the disk starts showing bad sectors. If your disk does have bad sectors, it is probably best to replace it pretty soon, though sometimes you can just get a very small set of bad sectors and live with the disk for a long time.

Install smart with 

<pre>sudo aptitude install smartmontools</pre>

and if you have logwatch installed too, then the SMART reports get added to your logwatch summaries (including disk temperatures which can be a good indication of airflow in your box)

## Toughening SSH

I found that I had a lot of attempted logins on my box because SSH was open on the default port. One solution is to move the default port, but I am likely to forget to use that port number and just confuse myself&#8230; So I started looking at other ways to reduce the risk of having someone brute-force their way into an account.

You can use some really good stuff like fail2ban to take failed logins and firewall that IP off for a while, but I decided that I wanted something even stronger. I disabled password logins completely via SSH!

## Monitoring with Munin