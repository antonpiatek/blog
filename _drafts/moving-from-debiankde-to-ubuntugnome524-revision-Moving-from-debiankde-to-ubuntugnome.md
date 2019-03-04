---
id: 525
title: Moving from debian+kde to ubuntu+gnome
date: 2009-05-20T18:15:50+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2009/05/20/524-revision/
permalink: /2009/05/20/524-revision/
---
I have been using Debian for quite a long time, and it has been my primary OS on my work laptop for about the last 3 years. Recently software suspend (sleep) started having problems where it often did not come back from sleep. For a laptop, this is a big annoyance to me, so I finally decided to try out Ubuntu.

I tried the usual Ubuntu Jaunty Live/install cd, but found that Ubuntu do not consider LVM a core part of Ubuntu and so the installer couldn&#8217;t install on my disk without serious reworking. So I grabbed the _alternate install cd_ which is pretty much the old curses Debian installer, which does support LVM. Having backed up /home/ and /etc/ I started down the road installing. Things went very smoothly (short of a scary warning from the installer suggesting it was going to erase my LVM partition but actually doesn&#8217;t do anything more than rewrite the same partition table to the disk). In little over an hour I had Jaunty fully installed, and a large number of my work specific apps installed and running, including Lotus Notes and Lotus Symphony which are quite large downloads).

Of course firefox picked up all my custom plugins and current browsing session because I had left /home/ completely intact and reused it. I initially didn&#8217;t like the look of gnome and so tried kde briefly before managing to get it crashing regularly (probably one of the compiz 3d effects). I cleared out ~/.kde/ and got it a little more stable, but couldn&#8217;t get kde network manager to attempt to connect to my wifi, and wicd didn&#8217;t seem to finish connecting properly.

I decided to go back to gnome and try and see if I could get used to it. Customising it was a little interesting, as I like a launcher bar at the bottom and nothing in gnome seemed to be what I was looking for. Eventually I found gnome-do and the theme that has a recently launched bar at the bottom that resembles the osX launcher with icons that expand when you move the mouse over them. The gnome terminal is rubbish, so I am still using the kde konsole for now.

I am starting to get comfortable in gnome, and I think the fonts actually look better, though that could be something extra in Ubuntu or simply a better default setting somewhere that I would have found on a reinstall of Debian too. Gnome feels slightly faster than KDE, though that could be my imagination.

All-in-all I am impressed with the really good finish in Ubuntu Jaunty, and gnome is quite workable now (though I do miss the kde ctrl+alt+esc shortcut key to bring up a kill this window icon, which I have always found useful for when some Java applet tries to kill firefox). The gnome power/battery monitor applet has a rather cool power graph funcion which is interesting, though ultimately nothing more than a toy. I did like the kde4 application tray as you could set a wide panel and tell it ti use two rows to list running applications, which I cannot seem to get gnome to do.

Gnome&#8217;s philosophy of almost no options does kind of annoy me though. For a start I want my screensaver to be a random slideshow of photos I have on my computer, but the screensaver uses a hardcoded folder to display from, and doesn&#8217;t tell you what this folder is. This may be fine if the system created that folder for you but my system didn&#8217;t have it created (probably becaue my install reused an existing homedir) and I had to search for a while to find out that it was ~/Pictures. After that a symlink solved that probelm.

Another niggling issue I have is that under KDE I could configure the compiz effects to do an &#8220;expose&#8221; style window view &#8211; when Imove the mouse to a specified corner, all running applications are presented as nicely arranged tiles for me to select the one I want. Despite installing the compiz configuration package, I cannot seem to find a way to get gnome to do this, which is a shame as I could find that really useful.

It is still a novelty to me to have any 3d effects at all, so I have them all prettty much turned on and am loving it (I initially played with compiz when it first hit Debian Unstable, but the ATI graphics drivers for my T43p were not reliable enough and I had frequent crashes, so ultimately turned it all off again).

My new Ubuntu system is very stable, very flashy and I am really impressed. This is not to say I am going to move all my other machines from Debian to Ubuntu, but next time they are up for a reinstall (probably not until a major hardware upgrade) I will probably consider Ubuntu rather than just installing Debian straight away.