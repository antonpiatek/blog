---
id: 250
title: Frequently Asked Questions about the GNU GPL
date: 2011-12-08T11:18:45+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=250
permalink: /2011/12/08/frequently-asked-questions-about-the-gnu-gpl/
aktt_notify_twitter:
  - 'yes'
al2fb_facebook_link_id:
  - 518790023_10151017427595024
al2fb_facebook_link_time:
  - 2011-12-08T11:19:30+00:00
al2fb_facebook_link_picture:
  - wordpress=http://www.strangeparty.com/?al2fb_image=1
aktt_tweeted:
  - "1"
categories:
  - IBM
  - Linux
  - Programming
  - Rights
  - Technology
tags:
  - development
  - gpl
  - patents
  - software
---
I have been flicking through the following FAQ on the GNU GPL: [Frequently Asked Questions about the GNU GPL &#8211; GNU Project &#8211; Free Software Foundation (FSF)](http://www.gnu.org/copyleft/gpl-faq.html). I am trying to understand the risks that we are told about regularly in IBM of working with/on Open Source code.

I have to say that most of the risks are rather undefined, and no real examples are given. I am having trouble figuring out why IBM is so scared of its employees working with Open Source, and yet at the same time encouraging it (I run Debian on my laptop, and in fact run a Debian server distributing internal tools packaged specially for other Debian users).

The one big concern is of course patents. Personal views on software patents aside, if I were to code a patented idea into some GPL&#8217;d code and release it (as an IBM employee) then quite likely that patent will be considered GPL&#8217;d and could be used by others &#8211; the extent of patents in GPL&#8217;d code is untested in court, hence the reason for v3 of the GPL, which will probably explicitly state that any patents are given away under the terms of the GPL if in GPL&#8217;d code.

However, even if not modifying the code there is still a huge concern about working with it. Even releasing code that is dynamically linked against a LGPL&#8217;d library is incredibly hard to get approved. Why should it be? The FAQ above makes clear that if the library is LGPL&#8217;d, then dynamic linking (i.e. using a JAR file in Java) means that the library source must be available and some reverse engineering of the interaction between the two is allowed (in case someone wanted to rewrite the library). Your code does not have to be Open Sourced. Is it simply that shipping the source code is too much effort? Surely if I use a prebuilt JAR, and dump a zip of the corresponding source of a LGPL&#8217;d library in the zip I am shipping then that is it. I am complying with the terms of the GPL.

The only thing I can think of is the other side of Patents &#8211; somebody else has a patent on something in the GPL code, but the authors of the GPL code were not aware of this. If IBM were to ship GPL&#8217;d code that a competitor had a Patent on part of then indeed they would be liable for infringement, not just the author of the code. Is this risk likely? Well, SuSE have just signed a deal with Microsoft for this reason, but RedHat and Ubuntu have declined the deal. Maybe with the GPLv3 this will be less of a problem, as if another company releases GPL code then they will be explicitely releasing any patents on it too.

What if the patent holder is another third party. IBM could still be in trouble if a competitor finds they have a patent on some GPL&#8217;d code we are shipping. They won&#8217;t bother suing small linux vendors, but IBM has lots of money to claim from, that would be worth going to court for. Could they claim only for IBM and not all the little guys who have already been using it?

Is it too much risk to work on the fact that we could always change the code to avoid the patent at a later date?