---
id: 546
title: Debian annouces fixed date release cycles
date: 2009-07-29T16:09:49+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=546
permalink: /2009/07/29/debian-fixed-release-date-cycles/
categories:
  - Debian
  - Ubuntu
---
I seem to recall Mark Shuttlework saying in an interview (possibly for Linux Format, possibly somewhere else) that he wanted to work with Debian to get fixed release cycles to help the Debian->Ubuntu porting efforts &#8211; It looks like he succeeded in planting the idea! I am looking forward to predictable Debian releases.

The most exciting thing I know of being attempted in the next Debian release (Squeeze) is the multiarch support, which should make running 32 bit apps on a 64 bit OS much better (currently some apps can install if you install the **ia32-libs** package however others need to be installed in a 32 bit chroot because they have too difficult dependencies to resolve). Redhat adopted another approach where 32 bit is more of a default than 64 bit than on Debian (On Debian a 64 bit install has absolutely no 32 bit support other than the ia32-libs package). Most 32 bit stuff seems to work ok on a 64 bit Redhat box but I don&#8217;t know how their approach relates to multiarch. The idea with multiarch is to natively support both 32 and 64 bit packages on the same system (I believe by changing the installer to put 32 bit libs in /lib32/, whereas I believe redhat uses /lib64/ for the 64 bit stuff and /lib/ is still 32 bit only).  
I am very interested to see how this pans out as I run a 64 bit desktop at work with lots of 32 bit apps (and gave up on my 64 bit install at home because it was too fiddly for the 32 bit proprietary apps I want to use)

A copy of the Debian announcement is below:

<!--more-->

> <div id=":zv" class="ii gt">
>   &#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;-<br /> The Debian Project                                 <a href="http://www.debian.org/" target="_blank">http://www.debian.org/</a><br /> Debian adopts time-based release freezes                 <a href="mailto:press@debian.org">press@debian.org</a><br /> July 29th, 2009                  <a href="http://www.debian.org/News/2009/20090729" target="_blank">http://www.debian.org/News/2009/20090729</a><br /> &#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;-</p> 
>   
>   <p>
>     Debian decides to adopt time-based release freezes
>   </p>
>   
>   <p>
>     The Debian project has decided to adopt a new policy of time-based<br /> development freezes for future releases, on a two-year cycle. Freezes<br /> will from now on happen in the December of every odd year, which means<br /> that releases will from now on happen sometime in the first half of every<br /> even year.  To that effect the next freeze will happen in December 2009,<br /> with a release expected in spring 2010. The project chose December as a<br /> suitable freeze date since spring releases proved successful for the<br /> releases of Debian GNU/Linux 4.0 (codenamed &#8220;Etch&#8221;) and Debian GNU/Linux<br /> 5.0 (&#8220;Lenny&#8221;).
>   </p>
>   
>   <p>
>     Time-based freezes will allow the Debian Project to blend the<br /> predictability of time based releases with its well established policy of<br /> feature based releases. The new freeze policy will provide better<br /> predictability of releases for users of the Debian distribution, and also<br /> allow Debian developers to do better long-term planning.  A two-year<br /> release cycle will give more time for disruptive changes, reducing<br /> inconveniences caused for users. Having predictable freezes should also<br /> reduce overall freeze time.
>   </p>
>   
>   <p>
>     Since Debian&#8217;s last release happened on Feb. 14th 2009, there will only<br /> be approximately a one year period until its next release, Debian<br /> GNU/Linux 6.0 (codenamed &#8220;Squeeze&#8221;).  This will be a one-time exception<br /> to the two-year policy in order to get into the new time schedule. To<br /> accommodate the needs of larger organisations and other users with a long<br /> upgrade process, the Debian project commits to provide the possibility to<br /> skip the upcoming release and do a skip-upgrade straight from Debian<br /> GNU/Linux 5.0 (&#8220;Lenny&#8221;) to Debian GNU/Linux 7.0 (not yet codenamed).
>   </p>
>   
>   <p>
>     Although the next freeze is only a short time away, the Debian project<br /> hopes to achieve several prominent goals with it. The most important are<br /> multi-arch support, which will improve the installation of 32 bit<br /> packages on 64 bit machines, and an optimised boot process for better<br /> boot performance and reliability.
>   </p>
>   
>   <p>
>     The new freeze policy was proposed and agreed during the Debian Project&#8217;s<br /> yearly conference, DebConf, which is currently taking place in Caceres,<br /> Spain. The idea was well received among the attending project members.
>   </p>
> </div>