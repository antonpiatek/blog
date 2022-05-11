---
id: 667
title: A Debian Packaging Howto
date: 2010-06-16T17:18:40+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/06/16/665-revision-2/
permalink: /2010/06/16/665-revision-2/
---
I do a fair bit of Debian/Ubuntu packaging at work (kind of on the side) and have had several people tell me that although the New Maintainer&#8217;s guide (<span style="font-size: 13.3333px;"><a href="http://www.debian.org/doc/maint-guide/">http://www.debian.org/doc/maint-guide/</a>) does do an introduction it is a bit hard to follow, particularly if you have a really simple program you want to package up and release. The New Maintainer&#8217;s guide does assume you have an existing tarball to work from, and that is often not the case if you just want to package up something you have made so I thought I would write a detailed walkthrough of packaging up something simple.</span>

<span style="font-size: 13.3333px;">While you can just use something like dpkg-deb to turn the right files into a .deb, this only works for already-compiled files and loses some of the great features about Debian-based systems such as changelogs, so I am only going to describe how to make a full source-format package that is built using the Debian tools</span>

#### <span style="font-size: 13.3333px;">Prereqs</span>

<span style="font-size: 13.3333px;">You will want to install a few packages before you go any further &#8211; these are very useful helper tools for packaging. Install <strong>dh-make</strong>, <strong>dpkg-dev</strong>, <strong>cdbs </strong>and <strong>devscripts<br /> </strong></span><span style="font-size: 13.3333px;"><strong><em>sudo aptitude install dh-make dpkg-dev cdbs devscripts</em></strong></span>

I chose cdbs here as it is a very powerful and yet often simple way of quickly creating packages. It takes a lot of the slow work away from the packager and does very sensible default things. My example package does not really need compiling so it could be simple to just create it by hand, but I feel that learning cdbs is well worth it (and wish I had used it for more of my packages rather than writing all the rules by hand). cdbs has documentation online at ﻿﻿<http://build-common.alioth.debian.org/cdbs-doc.html>

It is worth mentioning here that all aspects of the parts of a Debian package are covered in detail in the Debian Policy document (<http://www.debian.org/doc/debian-policy/>), which although Debian specific will not steer you wrong for getting started with Ubuntu packages.

#### Lets Begin

<span style="font-size: 13.3333px;">So, where do we start. Let&#8217;s start at the point where you have a simple program, perhaps a shell/perl/python script that you simply want to package up as a deb for easy installation. The first thing we want to do is make a folder formed out of the package name and version, and put the script in it in the correct place.</span>

Here is my example folder with me example program (called simple-program):  
_simple-package-0.1/usr/bin/simple-program  
<span style="font-style: normal;">Note that the folder is the package name followed by a hyphen and a version number (simple point versions are the easiest to work with, so stick with them if possible)</span>_ 

**<span style="font-weight: normal;">Now, all work is done from within the package folder normally, so cd into that folder<br /> </span>_<span style="font-weight: normal;">cd simple-package-0.1</span>_<span style="font-weight: normal;"><em><br /> </em></span>**

So far, all we have is just a folder with a binary in the place we want it to end up in. Now we have to &#8220;Debianise&#8221; (or Debianize if you prefer) this into a package  
<span style="font-size: 13.3333px;"><em>dh_make &#8211;single &#8211;cdbs  &#8211;createorig<br /> </em></span><span style="font-size: 13.3333px;">This command takes a source tree and turns it into a Debian source package format. The first flag tells dh_make that our source package is only going to build a single binary package (which is the most common). The second argument tells it to make it a cdbs style packge, and the third tells it that we do not have a tarball of our package so it should create a new one for us.</span>

<span style="font-size: 13.3333px;">Now if you look in the current folder, you will see a debian/ folder. This is where all the Debian-specific magic happens.</span>

<span style="font-size: 13.3333px;">The next thing we do is edit debian/rules<br /> The rules file is the main makefile (or build script) which is run by &#8220;make&#8221; to produce your package. Everything starts from here.</span>

> <div id="_mcePaste">
>   <em>$ cat debian/rules</em>
> </div>
> 
> <div id="_mcePaste">
>   <em>#!/usr/bin/make -f<br /> </em>
> </div>
> 
> <div id="_mcePaste">
>   <em>include /usr/share/cdbs/1/rules/debhelper.mk</em>
> </div>
> 
> <div id="_mcePaste">
>   <em>include /usr/share/cdbs/1/class/makefile.mk</em>
> </div>

 <span style="font-size: 13.3333px;">The first line tells cdbs to use debhelper. debhelper is a collection of very powerful build tools that pretty much all packages use. Each has its own man page and I will explain only a few as they are very numerous.<br /> The second line tells cdbs to run the Makefile in the root directory of our package, but as we do not have a makefile (our package is too simple) this will fail, so comment it out by putting a hash (#) at the beginning of that line.</span>

<span style="font-size: 13.3333px;">As we do not have a Makefile, nothing is going to put our package files into the right place, so instead we are going to use the dh_install script. Edit a new file at <em>debian/simple-package.install<br /> <span style="font-style: normal;">This</span></em></span>