---
id: 845
title: 'Media PC &#8211; ASUS AT3IONT-I'
date: 2011-05-10T20:51:42+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/05/10/827-revision-5/
permalink: /2011/05/10/827-revision-5/
---
I run a desktop machine under my TV. It is a media center for music, photos, and DVDs I have ripped for convenience. For a while it mostly ran MythTV with an idea to look at getting a TV tuner card for it (especially as my set-top DVR crashes more than I would like). This never really materialised.

The music playback used to be rather rubbish, but then a little while ago a colleague at work showed me [MPD](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki) (Music Player Daemon). MPD simply is a music player backend. The frontend comes separately and I simply use [mpdroid](http://www.appbrain.com/app/mpdroid/com.namelessdev.mpdroid) on my Android phone, and my wife uses similar software on her iPhone. This allows really easy browsing of songs and playback control, without needing to turn on the TV and without using any annoying remote controls. It also means I have music coming out of my nice sounds system, which is always good to have.

The box also does a few other things, such as the occasional bittorrent client for new linux releases, logging my power usage via a [CurrentCost device](http://www.currentcost.com/). It is also my house filserver for music on both our desktops, but also (and most importantly) it is my backup copy of all my digital photos, for which I have RAID mirrored disks and weekly copies to make sure accidental deletions are minimised. So far my photos are logging 115GB of space, so it is not exactly a small requirement.  
(And for those that want to lecture about RAID not being a backup, there is the main copy on my desktop, and a copy on another machine at my parent&#8217;s house, so I think my files should be fairly safe)

I recently decided that the box probably uses too much power, so started hunting around for a replacement. I settled on an [ASUS AT3IONT-I](http://www.asus.com/Motherboards/Intel_CPU_on_Board/AT3IONTI/) Deluxe motherboard, as it has a fanless dual-core CPU that should be good enough for HD playback, HDMI, optical audio and has enough SATA connectors to connect up to 4 drives. The board is a tiny mini-ITX system, and the deluxe version comes with an external 12V DC power adatpor. The system also has built-in wifi, and bluetooth, though I have yet to use them so far. It also comes with a quite cool remote control for a media PC, which I thought I would not use, but actually find amazing.

The remote control works out of the box and appears as a USB keyboard, but there is an [excellent post on the Ubuntu forums](http://ubuntuforums.org/showthread.php?p=9293063) about building a replacement keyboard driver which you can easily edit the key mappings, and also provides a bluetooth kernel module. Both are DKMS packages, so will automatically rebuild for all newer kernels.

Replacing my old board with the new one was fairly easy and it booted fine on the existing Debian Squeeze install. The system was running a little hot though, as the charts below show the difference between the lid on, the lid off, and the lid on with a fan. The fan I settled on was a [Fractal Design Silent Series 140mm fan](http://www.fractal-design.com/?view=product&category=4&prod=19), which is rated for 800rpm at 12v, with only 9dB(A) noise and it is incredibly silent. It moves enough air to make a good difference to the temperatures and is finally very quiet. I could perhaps have got away without any fans, but I would prefer to have the disks cool as they should hopefully last longer that way.

With the hardware running nicely I looked around for what software to run to replace the MythTV installation which was feeling a little clunky. A friend showed me his [Boxee](https://www.boxee.tv/) box which is a really cool mini PC purpose-built for a media center. The software can also be installed on Linux, though they only support Lucid at the moment, so I decided to try it out on my Debian box. The local file playback, music playback, photo browsing and flickr plugins are really good. The ASUS remote works really nicely with it and the whole thing feels really snappy and quick. Boxee also has YouTube and iPlayer plugins, among many others.

The only issues I have had so far are PulseAudio &#8211; I am tempted to simply remove it, as trying to get it to play nicely between the gui user running Boxee and the system user running MPD is really painful.  
I also have not yet figured out why the flash-based videos such as YouTube do not play. I suspect it is a library issue on Debian, but have not solved it yet.