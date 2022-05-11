---
id: 165
title: wpa wireless on a IBM Thinkpad T43p (running Debian Etch)
date: 2006-10-12T16:55:59+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/10/12/wpa-wireless-on-a-ibm-thinkpad-t43p-running-debian-etch/
permalink: /2006/10/12/wpa-wireless-on-a-ibm-thinkpad-t43p-running-debian-etch/
categories:
  - Debian
  - Linux
---
So after writing about setting up the [wireless on my desktop](http://www.strangeparty.com/2006/10/08/installing-a-linksys-wnp54g-wireless-pci-card-in-debian-etch/), I now have got it working on my laptop. All it needed was the wpasupplicant package and the ipw2200 network driver (and of course the ieee80211 network stack), though I installed all those ages ago, so cannot remember what was involved, but I think they are in a standard kernel.

It wasn&#8217;t all that hard to get encryption working, though it does appear that my patch to wpa\_supplicant does change the way it was intended to work. I am not sure if it is a general wpa\_supplicant change, or a Debian specific change, but to launch wpa_supplicant I am supposed to use the &#8220;wext&#8221; driver, instead of the ipw one which relates to my network card.

This was in the Debian readme for wpa\_supplicant, but I did spend a while trying to use the ipw driver in wpa\_supplicant before finding it. For completeness, I have 2 of my config files below (the only ones needed in fact)

/etc/network/interfaces

> `iface eth1 inet dhcp<br />
    wireless-essid      ant-wifi<br />
    wpa-driver wext<br />
    wpa-conf /etc/wpa_supplicant.conf<br />
` 

/etc/wpa_supplicant.conf

> `<br />
ctrl_interface=/var/run/wpa_supplicant</p>
<p>eapol_version=1<br />
ap_scan=1<br />
fast_reauth=1<br />
network={<br />
    ssid="ant-wifi"<br />
    proto=WPA<br />
    key_mgmt=WPA-PSK<br />
    pairwise=CCMP TKIP<br />
    group=CCMP TKIP WEP104 WEP40<br />
    psk="****"<br />
    priority=2<br />
}<br />
` 

The next stage will be trying to get the WPA-EAP/LEAP working at work. That WILL be more challenging