---
id: 368
title: iPod Classic with Amarok on Linux
date: 2008-05-29T12:02:48+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=368
permalink: /2008/05/29/ipod-classic-with-amarok-on-linux/
categories:
  - Debian
  - Linux
  - Music
tags:
  - amarok
  - ipod
  - Linux
  - Music
  - programs
---
When I first bought my iPod classic, Amarok hadn&#8217;t yet got support for the new SHA1 hashing that was being done in the song db. Then it was only in cvs, and while I remember compiling from source I don&#8217;t think I ever got round to running that code.

Of course I found out the hard way that Amarok didn&#8217;t have support for my iPod, and nearly bricked the thing. Thankfully a windows box and iTunes could reset it.

I now have it working, however it took a little fiddling. If you are trying to get it working, you absolutely must read <http://amarok.kde.org/wiki/Media_Device:IPod> before starting, especially [#My\_iPod\_does\_not\_show\_any\_music](http://amarok.kde.org/wiki/Media_Device:IPod#My_iPod_does_not_show_any_music), as this explains how to set up the magic ID number. Unfortunately earlier pages didn&#8217;t say whether to add the **0x** in from of the ID, and I remember having lots of difficulty just with libgpod and gtkpod. While I am mentioning it, the versions you need for an iPod Classic are: Amarok 1.4.8 and libgpod 0.6.0

So you have them installed, and you want to get Amarok managing your iPod &#8211; Well, I plugged it in, amarok detected it popped up a window asking if it should mount it as an iPod. I said yes, copied some songs, ejected it and BANG! &#8211; My iPod wouldnt show any songs.

It seems that the data uploaded by iTunes isn&#8217;t the same as by Amarok, and the iPod doesnt like that. Deleting the contents of the iPod_Control folder from the iPod seemed to make Amarok and the iPod happy. Of course Amarok needed to recreate some folder structure, but it asked nicely. Also, if you do this, don&#8217;t forget you have to recreate your SysInfo file again before Amarok uploads any songs.

Anyway, I now have an iPod that I can upload to with Linux (which is a hell of a lot faster than iTunes &#8211; iTunes took about 30 hours to copy ~30G of music, Amarok took about 3 hours), podcasts work and even some cover art has been copied.

If you have any problems, you can reboot the iPod by holding the Menu and select button down together for a few seconds. If the songs list comes up blank, then you have something wrong and Amarok didnt write the hash correctlty &#8211; check the SysInfo file, delete all music from the iPod in Amarok, and copy a few test tracks, disconnect and check if you have it right.

You can also use the _Smart Playlists_ to sync to the iPod &#8211; _Favourite tracks_, _Newest tracks_ and _All Collection_ are good ones to use. Of course you can create your own custom smart playlists too.

Best of all, Amarok is properly multi-threaded so I can copy my entire music collection to my iPod, while playing music and Amarok and writing blog posts &#8211; on windows syncing an iPod used to make the system struggle, and iTunes became rather unresponsive&#8230;