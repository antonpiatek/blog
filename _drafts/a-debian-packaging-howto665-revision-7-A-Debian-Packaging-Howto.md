---
id: 672
title: A Debian Packaging Howto
date: 2010-06-16T19:05:31+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/06/16/665-revision-7/
permalink: /2010/06/16/665-revision-7/
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
> $ cat debian/control  
> Source: simple-package  
> Section: unknown  
> Priority: extra  
> Maintainer: anton <anton@unknown>  
> Build-Depends: cdbs, debhelper (>= 7)  
> Standards-Version: 3.8.1  
> Homepage: <insert the upstream URL, if relevant>_
> 
>  ___Package: simple-package  
> Architecture: any  
> Depends: ${shlibs:Depends}, ${misc:Depends}  
> Description: <insert up to 60 chars description>  
> <insert long description, indented with spaces>  
>_ 

We will want to edit several of these fields. Of course these are all explained in [Chapter 5 of the Debian Policy](http://www.debian.org/doc/debian-policy/ch-controlfields.html). The first thing to note is that the first chunk applies to the source package. Here we want to set our Maintainer name and email.  
The build-depends are a default guess too, and should be enough for us for now (build-depends is all the packages needed to build this program, which often include any extra libraries you might need or extra tools such as unzip).  
The homepage is also worth filling in if your package has one, but the whole line can be deleted if not required. The section and priority I will leave you to look up in the Debian policy manual if you want to know more about them, but can be left as-is for now

The second block is all about the binary .deb we want to produce. Note that the Package: section has the same name &#8211; This is the default for a &#8220;single package&#8221; that we asked dh_make to create for us, though you can have more than one block if your source package should produce multiple debs.  
The Architecture: fields is worth getting correct. You can put in values like _i386_ or _amd64_ if your package will only work there, or if it should compile and work on any architecture you use _any_. As my package is a simple script-type application, it is actually slightly more special than that and only needs building once and will not need recompiling for any architecture, so I am going to change this to _all_. &#8220;all&#8221; has a special meaning, telling dpkg-buildpackage to only compile it once and use that on any architecture.

The Depends: field is also another important field to get correct. This says what you will need installed to actually use this package. So if your package is written in Python, then you want to put the correct Python package name in here (and a version in brackets like &#8220;_python (>=2.6)_&#8220;﻿ if your package needs a minimum level of that package. You can also do OR&#8217;s if you use a pipe &#8220;|&#8221;.  
The two magic variable depends are filled in by various debhelper scripts and can be left alone (in this case they will end up empty.

The Description: field has a special formatting. The first line is a short description of less than 60 characters, and then after that is a long description where each line starts with a space. If you want to put an empty line in your long description put a space then a period/dot ( &#8220;.&#8221;) on this line (do not use an empty line). Full explanation is in the Debian Policy.

&#8220;Where do I set the version number&#8221; I hear you ask&#8230; well, I&#8217;m coming to that now

#### debian/changelog

Package versioning is controlled from the _debian/changelog_ file. You can edit this file directly, but it is often easier to use the command _dch_ as it will fill in various fields for you, and can even do simple increments and comments completely from the command line. If you run _dch_ from the main folder of your package it will launch the default editor with a new comment line created for you. If you want to quickly increment the version you can use _dch -i_ and this will do the same, but increment the version number for you first (creating a new changelog entry in doing so).

Let&#8217;s have a quick look at a changelog (you might want to look at [Section 4.4 of the Debian Policy](http://www.debian.org/doc/debian-policy/ch-source.html#s-dpkgchangelog) too)

> _$ cat debian/changelog  
> simple-package (1.0-1) unstable; urgency=low_
> 
> _* Initial release (Closes: #nnnn)</p> 
> 
> </em> _&#8212; anton Wed, 16 Jun 2010 19:32:10 +0100  
>_ </blockquote> 
> 
> A changelog file is a colletion of repeated blocks like the above. The first line of a block shows the package name, then the version in brackets, then the release this package was built for and then it&#8217;s urgency. The version here is what comes out when we build our package. The release is only really used when uploading a package as the build-systems look for this field to work out where your package should go (in Debian you would have something like stable or testing, whereas in Ubuntu you would use the release name such as lucid or maverick)
> 
> Then we have a set of specially formatted bullet points. You can have many of these, but check the policy for allowed formatting. Notice that we have a Closes section here. This is used by bugtrackers that are attached to the package building systems, and unless you are uploading to one of these is probably simplest to remove.
> 
> Then we have the signature line which should have your name and email address, followed by two spaces and a timestamp. If you use _dch -i_ then dch will create all this for you, and if you check the man page for it you can see how to set environment variables in your shell so that you do not have to tell it your correct name or email address. (It is worth mentioning the -v flag to dch. This lets you set a specific version to be put in the changelog, which is useful when you want to go up to version 2.0 or similar.)
> 
> It is perhaps worth mentioning that there are two types of source packages.
> 
> The usual type of package has version numbers that have a hyphen in them and the part before the hyphen is the upstream number, and the part after is the Debian revision. This is used to show that the upstream code has a specific version number but allows us to have our own incremented versions that clearly show that we are not shipping a new version of the upstream code but merely patches or even just packaging fixes which do not change the upstream code at all.  
> When built, these types of packages output a .orig.tar.gz file and a .diff.gz file. This allows the upstream code only to be in the orig.tar.gz, and the diff.tar.gz to be a diff file of all the changes we have made, including the entire contents of the debian/ folder
> 
> The second type of package is a &#8220;native Debian&#8221; package. This package has simpler version numbers and only builds a .tar.gz file. This format is normally only used for packages that are entirely owned by Debian (or Ubuntu) and the source code was created entirely for use in Debian (or Ubuntu).
> 
> You can choose which type of package your&#8217;s is by how the version number is structured. Without a hyphen it will be a &#8220;native&#8221; package, however I recommend you use the first type by default (you can also force the type with flags to dpkg-buildpackage).  
> The advantage of the first type of package is that because you have a .diff.gz and a .orig.tar.gz if you are uploading a very large package you only need to upload the .orig.tar.gz if the code in it has changed. If you are just making packaging fixes, or small patches then these are all in the .diff.gz and will be a much smaller upload.
> 
> #### Other files
> 
> Of course there are many other files in debian/ which are mostly templates created by dh_make. I will only explain a few here as they are all pretty well covered in the Debian Policy
> 
> debian/copyright &#8211; You should put a full license in this file so that people know what license your code is under (see S[ection 12.5 of the Debian Policy manual](http://www.debian.org/doc/debian-policy/ch-docs.html#s-copyrightfile))
> 
> debian/README.Debian &#8211; This file is a readme file that is normally used to supplement any upstream readme file. It is copied out to /usr/share/doc/package-name/ as you saw above in the .deb. It should explain anything you have to do to make this package work that may be different from the upstream readme (if any) and normally contains the &#8220;Debian way&#8221; of getting your program running.
> 
> debian/compat &#8211; This file sets the compatibility level of the debhelper tools &#8211; you normally don&#8217;t need to change this
> 
> debian/simple-package.dirs or debian/dirs &#8211; This file will create empty directories that your package might need. Note that you rarely ever