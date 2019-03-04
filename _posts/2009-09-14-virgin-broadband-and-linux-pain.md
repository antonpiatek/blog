---
id: 538
title: Virgin Broadband and linux = pain
date: 2009-09-14T18:10:24+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=538
permalink: /2009/09/14/virgin-broadband-and-linux-pain/
categories:
  - Internet
  - Linux
---
When I moved house in July, I decided to sign up for Virgin Broadband. Virgin was an obvious choice as they could connect me and have broadband available within about two days.

So I signed up and the modem arrived two days later. I plug it in, trying to follow their instructions, phone them up for activation and&#8230;. nothing happens. There is power on the modem, but the &#8220;link&#8221; light never comes up. After about an hour on the phone, they say they will open a tech request for it. The next day I get a call from Virigin (from India) asking if my modem is working. I explain that I am at work (as most people in the UK are between 9am-5pm) and will check when home &#8211; It was indeed working.

The next step, is to then register your connection with a computer, so I plug in my linux laptop and desperately try to make the web pages work. First it tells me I don&#8217;t have a new enough browser and unsupported OS. So I tell Konqueror to pretend it is some level of IE on windows. That works, and I am now declining offers of screensavers, setup exe&#8217;s and all sorts of downloads. Eventually it gets to a page that simply won&#8217;t load. There are several javascript errors popping up, so I wonder if I can see the addres in there. Stepping through the javascript in the debugger, over a invalid reference, and suddenly the next page loads &#8211; I am done!

I wish I had searched around first. Apparently there is a much simpler version of the website that does the basic job, without all the screensavers and browser checks:

> &#8220;instead of doing what they tell you to do, you go to https://autoreg.autoregister.net/ you get prompted for whether you&#8217;re signing up for Broadband or Dialup, and on clicking Broadband, you&#8217;re lead through the sign-up procedure with no complaints about compatibility, and within 5 minutes he was online with his GNU/Linux (Ubuntu) system and Firefox browser.&#8221;

 <http://wiki.hands.com/chezfil/entry/virginmedia/>