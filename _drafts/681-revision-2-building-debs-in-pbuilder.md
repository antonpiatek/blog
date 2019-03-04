---
id: 684
title: building debs in pbuilder
date: 2010-06-17T20:40:05+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/06/17/681-revision-2/
permalink: /2010/06/17/681-revision-2/
---
Having recently written an [introduction to building Debian packages](http://www.strangeparty.com/2010/06/17/a-debian-packaging-howto/), I now have a follow-on on using pbuilder during building  
pbuilder allows you to have a pristine build environment for building your Debian (or Ubuntu) packages inside. The advantage of this is that you do not need to clutter your machine up with all the build-dependencies needed to build your package. It is also useful as it proves that your build-depends are correct, and that if you give your package to someone else that it will build for them (it is easy to forget a build-depends because it was already on your box, and this can be a problem in build systems or for other people wanting to build your package)

The first thing you need to do is install pbuilder (The pbuilder documentation is at <http://www.netfort.gr.jp/~dancer/software/pbuilder-doc/pbuilder-doc.html> if you need or want to read it)

> _sudo aptitude install pbuilder_

Now let&#8217;s create a pbuilder environment &#8211; This one is for building under lucid, but you could use another release (or even a debian release such as &#8220;unstable&#8221;)

> _sudo pbuilder create &#8211;distribution lucid_

This will take a while. When done, it is time to give it a whirl.

You will need the built source package, as pbuilder operates on .dsc files (and the matching tar.gz or orig.tar.gz and diff.gz). Inside your package folder run

> _dpkg-buildpackage -S_

Now go up a folder and you will find a .dsc file for your package. Now we simply ask pbuilder to compile it for us

> _sudo pbuilder build <yourpackage>.dsc_

It is possible to configure pbuilder to run without root, but I believe it is a fair bit of work so I have never bothered. Now watch as pbuilder opens up your base chroot image with very little installed, and installs all your build dependencies, unpacks your source package and follows all your build rules to turn it into a beautiful deb.

Note that the default output folder for pbuilder is _/var/cache/pbuilder/result/_ so look there for your build. You can configure this to be somewhere else in _~/.pbuilderrc_ or _/etc/pbuilderrc_

pbuilder has a fair few options you can set, but I have not found I need to set many of them, other than perhaps the mirror it should use for grabbing packages, but that is mostly because at work I have full mirror&#8217;s in the server room in the next building.

One other program included in the pbuilder package is _pdebuild_ which can be quite helpful. Running _pdebuild_ from inside your package source directory it will build the source package for you and then go straight into building your binary

That is pretty much the basics of pbuilder &#8211; Enjoy!

(I will write another post about using pbuilder to build 32 bit packages on a 64 bit box later and some helper scripts for pbuilder)