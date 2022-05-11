---
id: 160
title: installing a linksys WNP54G wireless pci card in debian (etch)
date: 2006-10-08T19:56:49+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/10/08/installing-a-linksys-wnp54g-wireless-pci-card-in-debian-etch/
permalink: /2006/10/08/installing-a-linksys-wnp54g-wireless-pci-card-in-debian-etch/
categories:
  - Debian
  - Linux
  - Misc
---
EDIT: try [this way first!](http://www.strangeparty.com/2006/11/26/getting-a-wmp56g-pci-wifi-card-working-under-debian-etch/) It is a hell of a lot simpler

I bought this card to avoid cables allover my house, and when looking at cards (it was quite cheap on dabs) did a quick search for linux support. Satisfied I bought the card.

Well, it turned up today and the reality was that installing the driver was a little harder than i thought&#8230;

At first i thought i was going to have use ndiswrapper and use the windows driver, but I didn&#8217;t like that idea, so kept searching. I eventually found that there is a real driver from ralink  <http://www.ralinktech.com/supp-1.htm>  
Getting it working though was not as simple as installing a package.

  * I download the driver, extracted the tar and went into the module directory. Following the readme there to build the kernel module (I needed kernel sources and headers (apt-get can help you with that if you are on a standard kernel) as well as make, gcc etc.)
  * That was fine, and <span style="font-style: italic">insmod rt61.ko</span> worked so next step was going to be getting my WPA encyption working.
  * I installed wpa_supplicant, but found that I needed to patch it to make it support this driver.
  * <span style="font-style: italic">apt-get source wpa_supplicant; apt-get build-dep wpa_supplicant</span> will get you the source and build dependencies.
  * Following the patching instructions in the WPA\_supplicant directory of the driver I downloaded, I patched wpa\_supplicant (It would have been nice if they just gave a .patch or .diff file though)
  * _make_ worked fine, but I could not get <span style="font-style: italic">dpkg-buildpackage</span> to work as the patching failed. That is a shame, and I really should submit a patch to the wpa supplicant team for this driver so that this step won&#8217;t be required again.
  * To get it working system wide I had to copy the three binary files from my wpa\_supplicant build dir (wpa\_supplicant, wpa\_passphrase, wpa\_cli) to /usr/local/sbin (that is where <span style="font-style: italic">which wpa_supplicant</span> said they should be)
  * I had to edit my wpa_supplicant.conf (the default was fine, but I did have to copy out a lot of other definitions as it complained about them, and adding the wpa key was easy)
  * Loading by hand now worked, and I could now disconnect my network cable  
<span style="font-style: italic" /> 

  * <span style="font-style: italic">insmod ra61.ko; wpasupplicant -c /etc/wpa_supplicant.conf -i ra0 -D ralink; ifup ra0 inet 192.168.1.2 up</span>

  * To make it work on boot I edited /etc/network/interfaces to add wpa_options so that ifup knows about them
<div style="margin-left: 40px">
  iface ra0 inet static<br /> address 192.168.1.9<br /> netmask 255.255.255.0<br /> network 192.168.1.0<br /> broadcast 192.168.1.255<br /> gateway 192.168.1.1<br /> wpa-driver ralink<br /> wpa-conf /etc/wpa_supplicant.conf
</div>

  * I also needed to copy my rt61.ko from my driver build dir to my current kernel&#8217;s modules dir

  * _<span style="font-style: italic" />cp rt61.ko /lib/modules/\`uname -r\`/kernel/drivers/net_

  * I also needed to add _&#8220;alias ra0 rt61_&#8221; to the end of my /etc/modutils/aliases file so that the system knows that _ra0_ is a _rt61_ device (make sure you don&#8217;t edit /etc/modules.conf as it is created by modutils and will just be overwritten on the next boot)
  * I thought this should work, but instead <span style="font-style: italic">/etc/init.d/networking restart</span> complained that the ralink driver was unsupported. Turns out it uses a copy of wpa_supplicant in /sbin/
  * After copying wpa_supplicant to /sbin/ it now works
So what I really want is a debian package for the kernel module that will build and install the driver for me, and a copy of wpa_supplicant that supports this driver. I guess it is time to start investigating licences and emailing debian package maintainers and wpa supplicant developers&#8230;

Hope this helps somebody else, but drop me an email if you think I can help you