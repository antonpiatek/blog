---
id: 670
title: A Debian Packaging Howto
date: 2010-06-16T18:02:50+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/06/16/665-revision-5/
permalink: /2010/06/16/665-revision-5/
---
I do a fair bit of Debian/Ubuntu packaging at work (kind of on the side) and have had several people tell me that although the New Maintainer&#8217;s guide (<http://www.debian.org/doc/maint-guide/>) does do an introduction it is a bit hard to follow, particularly if you have a really simple program you want to package up and release. The New Maintainer&#8217;s guide does assume you have an existing tarball to work from, and that is often not the case if you just want to package up something you have made so I thought I would write a detailed walkthrough of packaging up something simple.  
<!--more-->

  
While you can just use something like dpkg-deb to turn the right files into a .deb, this only works for already-compiled files and loses some of the great features about Debian-based systems such as changelogs, so I am only going to describe how to make a full source-format package that is built using the Debian tools

#### Prereqs

You will want to install a few packages before you go any further &#8211; these are very useful helper tools for packaging. Install **dh-make**, **dpkg-dev**, **cdbs** and **devscripts  
** 

_sudo aptitude install dh-make dpkg-dev cdbs devscripts_

I chose cdbs here as it is a very powerful and yet often simple way of quickly creating packages. It takes a lot of the slow work away from the packager and does very sensible default things. My example package does not really need compiling so it could be simple to just create it by hand, but I feel that learning cdbs is well worth it (and wish I had used it for more of my packages rather than writing all the rules by hand). cdbs has documentation online at ﻿﻿<http://build-common.alioth.debian.org/cdbs-doc.html>

It is worth mentioning here that all aspects of the parts of a Debian package are covered in detail in the Debian Policy document (<http://www.debian.org/doc/debian-policy/>), which although Debian specific will not steer you wrong for getting started with Ubuntu packages.

#### Lets Begin

So, where do we start. Let&#8217;s start at the point where you have a simple program, perhaps a shell/perl/python script that you simply want to package up as a deb for easy installation. The first thing we want to do is make a folder formed out of the package name and version, and put the script in it in the correct place.

Here is my example folder with me example program (called simple-program):  
_simple-package-0.1/usr/bin/simple-program_  
Note that the folder is the package name followed by a hyphen and a version number (simple point versions are the easiest to work with, so stick with them if possible)

Now, all work is done from within the package folder normally, so cd into that folder  
_cd simple-package-0.1_

So far, all we have is just a folder with a binary in the place we want it to end up in. Now we have to &#8220;Debianise&#8221; (or Debianize if you prefer) this into a package  
_dh_make &#8211;single &#8211;cdbs  &#8211;createorig  
_ This command takes a source tree and turns it into a Debian source package format. The first flag tells dh_make that our source package is only going to build a single binary package (which is the most common). The second argument tells it to make it a cdbs style packge, and the third tells it that we do not have a tarball of our package so it should create a new one for us.

Now if you look in the current folder, you will see a debian/ folder. This is where all the Debian-specific magic happens.

The next thing we do is edit debian/rules  
The rules file is the main makefile (or build script) which is run by &#8220;make&#8221; to produce your package. Everything starts from here.

> _$ cat debian/rules  
> #!/usr/bin/make -f_
> 
>  ___include /usr/share/cdbs/1/rules/debhelper.mk  
> include /usr/share/cdbs/1/class/makefile.mk  
>_ 

The first line tells cdbs to use debhelper. debhelper is a collection of very powerful build tools that pretty much all packages use. Each has its own man page and I will explain only a few as they are very numerous.  
The second line tells cdbs to run the Makefile in the root directory of our package, but as we do not have a makefile (our package is too simple) this will fail, so comment it out by putting a hash (#) at the beginning of that line.

As we do not have a Makefile, nothing is going to put our package files into the right place, so instead we are going to use the dh_install script. Edit a new file at _debian/simple-package.install_

dh_install looks for this file (actually, it will also look for just _debian/install_) and will copy any files listed in it into your package. In this file we will put a list of files we want installed, one per line (wildcards work too, but I will list our only file for explicitness)

> _$cat debian/simple-package.install  
> usr/bin/simple-program_

Notice that we do not have a leading &#8216;/&#8217;, this is deliberate. Also, if you check _man dh_install_ then you will notice that dh_install will not move files to other directories as it is expected that your makefile will do this for you. For now I will assume that your simple package comes with all the files in the correct places.

#### Building

Now let&#8217;s try building. Run _dpkg-buildpackage_ and this will turn your little folder into a Debian source package and then go and create a .deb

Have a look:

> _  
> $ls ../simple-package\_0.1-1\_i386.deb  
> ../simple-package\_0.1-1\_i386.deb_

See &#8211; you have a .deb

Now let&#8217;s have a look inside it:

> _  
> $dpkg &#8211;fsys-tarfile ../simple-package\_0.1-1\_i386.deb |tar -tv  
> tar: Record size = 8 blocks  
> drwxr-xr-x root/root 0 2010-06-16 18:48 ./  
> drwxr-xr-x root/root 0 2010-06-16 18:48 ./usr/  
> drwxr-xr-x root/root 0 2010-06-16 18:48 ./usr/sbin/  
> drwxr-xr-x root/root 0 2010-06-16 17:41 ./usr/bin/  
> -rwxr-xr-x root/root 0 2010-06-16 17:41 ./usr/bin/simple-program  
> drwxr-xr-x root/root 0 2010-06-16 18:48 ./usr/share/  
> drwxr-xr-x root/root 0 2010-06-16 18:48 ./usr/share/doc/  
> drwxr-xr-x root/root 0 2010-06-16 18:48 ./usr/share/doc/simple-package/  
> -rw-r&#8211;r&#8211; root/root 193 2010-06-16 17:44 ./usr/share/doc/simple-package/README.Debian  
> -rw-r&#8211;r&#8211; root/root 178 2010-06-16 17:44 ./usr/share/doc/simple-package/changelog.Debian.gz  
> -rw-r&#8211;r&#8211; root/root 693 2010-06-16 17:44 ./usr/share/doc/simple-package/copyright  
>_ 

Notice that your program is listed in _./usr/bin/simple-program_, and also that there is a changelog, a readme and a copyright file &#8211; I will come on to those later.

So, we&#8217;re done?  
Erm, no&#8230; Not really

While you may have a package, you will notice that it is a rather dumb package

> _$ dpkg-deb -I ../simple-package\_0.1-1\_i386.deb  
> new debian package, version 2.0.  
> size 1730 bytes: control archive= 524 bytes.  
> 303 bytes, 10 lines control  
> 290 bytes, 4 lines md5sums  
> Package: simple-package  
> Version: 0.1-1  
> Architecture: i386  
> Maintainer: Anton Piatek <anton@piatek.co.uk>  
> Installed-Size: 32  
> Section: unknown  
> Priority: extra  
> Homepage: <insert the upstream URL, if relevant>  
> Description: <insert up to 60 chars description>  
> <insert long description, indented with spaces>_

See &#8211; it really is a but dumb as we have not configured much about it. Lets start fixing that now as we really don&#8217;t want to be giving this to everyone in it&#8217;s current state

#### Package control files

Let&#8217;s start with the file _debian/control_

> _  
> Source: simple-package  
> Section: unknown  
> Priority: extra  
> Maintainer: Anton Piatek <anton @piatek.co.uk>  
> Build-Depends: cdbs, debhelper (>= 7)  
> Standards-Version: 3.8.1  
> Homepage: <insert the upstream URL, if relevant></p> 
> 
> Package: simple-package  
> Architecture: any  
> Depends: ${shlibs:Depends}, ${misc:Depends}  
> Description: </insert><insert up to 60 chars description>  
> </insert><insert long description, indented with spaces>
> 
> </insert></anton></em></blockquote>