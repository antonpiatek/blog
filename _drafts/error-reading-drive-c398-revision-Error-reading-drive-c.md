---
id: 399
title: 'Error reading drive c:'
date: 2008-09-24T18:18:51+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2008/09/24/398-revision/
permalink: /2008/09/24/398-revision/
---
So about a week ago I was deleting some files from my USB key, and the delete failed. So I tried the command line, then with sudo on the command line. I was surprised to see a message like &#8220;UID 1000 does not exist in password file&#8221;, so I opened a new shell only to be told by my computer that I don&#8217;t have a username.

Switching to a pure console I found I couldn&#8217;t log in with root, and after rebooting I found that /etc/passwd no longer existed.

At this point I was wondering if I had any data left at all. I figured that either a)my disk has died, or b)my OS decided to scramble the file system. I was sadly hoping that it was a disk failure, as that is just bad luck with hardware&#8230;  
After a thorough disk scan with the manufacturers disk tools I realised that my system must have done the damage to itself &#8211; oh dear!

I am not reinstalling my Debian box from scratch (thankfully my home dir mount seems to be fine) in a new LVM logical volume. I was suprised that had to mark the partition as a LVM physical volume, and write the partition table to the disk before the installer would let me choose LVM volumes to use as filesystems, but thankfully it worked fine.

It will still be a while before my system is back to its usual state, but at least a fsck check of my home parition came up perfectly clean. The old root parition however looks a mess. /etc/ looks rather sparse, which is not good.  
I am still unsure exactly how this sort of thing can happen &#8211; anyone want to pose a theory?