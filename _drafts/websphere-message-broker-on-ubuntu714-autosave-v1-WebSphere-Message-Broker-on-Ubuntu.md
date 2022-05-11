---
id: 1081
title: WebSphere Message Broker on Ubuntu
date: 2014-01-15T08:18:27+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2014/01/15/714-autosave-v1/
permalink: /2014/01/15/714-autosave-v1/
---
WebSphere Message Broker v8 now supports Ubuntu for development systems (i.e. not production use) &#8211; <http://www-01.ibm.com/support/docview.wss?uid=swg27023600#Ubuntu>

I have been running MQ and Message Broker on Ubuntu and Debian since shortly after I joined IBM in 2005, and it seems there are [lots of other people doing this too](http://www.google.co.uk/search?q=mq+on+ubuntu) despite it not being a supported platform before now.

Lots of people have advice on how to install MQ and WMB, and it is worth mentioning them in case you have problems.

<http://www.reidmorrison.com/linux/install-websphere-mq-on-ubuntu>

<http://www.gefira.pl/blog/2010/07/03/websphere-mq-and-ubuntu-howto/>

<http://blog.herbert.groot.jebbink.nl/2009/06/wmb-61-ubuntu-904.html>

The best advice I can give for installing MQ and WMB on Ubuntu is:

  * change the /bin/sh symlink to point to /bin/bash &#8211; MQ Doesn&#8217;t like installing with dash as the default shell.

&nbsp;

  * use rpm to install MQ &#8211; Alien is a bit of a hack, and does not work well. You will need to use the &#8220;&#8211;force-debian&#8221; flag on rpm to make it install.

&nbsp;

  * One other thing which might help is to run the mqlicense.sh script with the &#8216;-console&#8217; flag as it may not find your X applications properly.

&nbsp;

Some user&#8217;s have noticed that chown on Debian and Ubuntu strips the setuid bit from the binaries (Debian and Ubuntu consider leaving setuid set on an executable when you change it&#8217;s owner a security flaw, whereas Redhat and SuSE appear not to) so you may need to fix the permissions (best to check the permissions of the same level of MQ from a RHEL or SLES box and set them the same) though I have not seen this with recent versions of MQ.

Message Broker v8 installs quite happily on Ubuntu. The only issues that I know of are that some of the eclipse based gui applications do not draw everything correctly. This is a known eclipse-GTK bug, and is more common on releases after Lucid Lynx (10.04). A workaround is to set the environment variable  _GDK\_NATIVE\_WINDOWS=1_

Update 12/01/5 &#8211; I have just noticed that the script &#8216;mqsicreateworkpath&#8217; which is used to initialise /var/mqsi correctly still uses ksh. Either install ksh on your system or edit the script to say bash in the first line instead of ksh (it should work fine then)

Update 14/01/15 &#8211; Several people have contacted me about running IBM Integration Bus v9 (the new name of Message Broker), primarily on 64 bit Ubuntu installs. Some parts, noticeably the MQ Explorer extension, fail to install unless you have the following extra packages installed: libc6-i386 libgcc1:i386