---
id: 721
title: MQ on Ubuntu
date: 2010-07-15T16:05:11+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/07/15/714-revision-3/
permalink: /2010/07/15/714-revision-v1/
---
I have been running MQ and Message Broker on Ubuntu and Debian pretty much since I joined IBM in 2005, and it seems there are [lots of other people doing this too](http://www.google.co.uk/search?q=mq+on+ubuntu) despite it not being a supported platform.

Hopefully at some point soon IBM will start looking at some form of support for Ubuntu and package up MQ, but in the meantime if you are going to install it anyway the following sites have pretty sound advice:  
[http://www.reidmorrison.com/linux/install-websphere-mq-on-ubuntu  
](http://www.reidmorrison.com/linux/install-websphere-mq-on-ubuntu) <http://www.gefira.pl/blog/2010/07/03/websphere-mq-and-ubuntu-howto/>  
<http://blog.herbert.groot.jebbink.nl/2009/06/wmb-61-ubuntu-904.html>

Basically all advocate installing RPM on your Ubuntu box and then installing the rpm&#8217;s. This is generally better than using alien.

One thing that might help is to run the mqlicense script with the &#8216;-console&#8217; flag as it may not find your X applications properly and some user&#8217;s have noticed that chown on Debian and Ubuntu strips the setuid bit from the binaries (Debian and Ubuntu consider leaving setuid set on an executable when you change it&#8217;s owner a security flaw, whereas Redhat and SuSE do not) so you may need to fix the permissions (best to check the permissions of the same level of MQ from a RHEL or SLES box and set them the same)

To see what files on a box are setuid run _find /opt/mqm/ -perm +1000_ and then save that output to a file