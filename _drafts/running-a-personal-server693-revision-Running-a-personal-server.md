---
id: 694
title: Running a personal server
date: 2010-06-27T18:18:00+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/06/27/693-revision/
permalink: /2010/06/27/693-revision/
---
Maybe you read some of my posts on software raid and lvm, or maybe you have a spare pc lying around and want a box you can use as a small personal server and are wondering about some tips for running it with less hassle. I starring a few things that I have learnt about running a personal server (though some will apply to any Linux server or always-on machine. 

Mail  
You really want mail configured for delivery, as that is one of the easiest ways to get alerts from your machine (though twitter could be cool too). If you have a email to smms gateway or smartphone with push email then these alerts can be very fast and direct.  
I useb ecumenical, not because it is the fastest or most configurable mail system available, but because it is very easy to get configured and running on Debian or Ubuntu. Simply install the ecumenical package and the debconf wizard will get you up and running.  
You may need to set an outgoing smarthost if your ISP blocks outgoing smtp (many do). You van either use your ISP&#8217;s mail server or even Google if you have a gmail account.  
Next you want to set all email for &#8216;root&#8217; to forward to you preferred email address. Then you can test it with a simple commandline

Logwatch  
Raid emails  
Smart disk monitoring 

<span id="post_sig">Posted from WordPress for Android</span>