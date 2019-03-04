---
id: 121
title: Backup options
date: 2006-05-24T15:53:03+00:00
author: Anton Piatek
layout: post
guid: http://strangeparty.com/2006/05/24/backup-options/
permalink: /2006/05/24/backup-options/
categories:
  - Linux
  - Misc
---
I mostly use a combination of Rsync (mostly for my photos) and [Unison](http://www.cis.upenn.edu/~bcpierce/unison/) (mostly for my personal documents) to back up my data between several machines. My documents get synchronised across several machines using Unison whereas Rsync just pushes my photos to another machine over the internet.

To use Unison across several machines, I always update to one central machine. Then whenever I can (especially before working on a file I have edited recently) just update everything on the machine I am working on and it knows what is old and new and copies it all. (Or you could use a CVS type system to the same effect, but probably not as nice a UI)

These solutions are great, but [Cleversafe](http://www.cleversafe.org/) looks even more interesting. Although for former 2 options are cross platform (with the help of [Cygwin](http://www.cygwin.com/) on windows for ssh and rsync) Cleversafe is not, but it is much more resistant to damage and will give more space if you have several machines to back up.

One other option is [Rsync.net](http://rsync.net/) who offer online backup via just about any method you can think of for $2/GB/month. Not the cheapest, but then not that expensive depending on the value of your data!

If you want help setting up cygwin and Rsync/Unison then give me a shout. I will be happy to help as best I can. Of course both these go to a linux server in my case, but you can install ssh on a windows box and do it that way too.