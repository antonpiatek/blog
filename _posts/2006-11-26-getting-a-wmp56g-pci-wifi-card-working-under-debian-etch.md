---
id: 186
title: Getting a WMP56G pci wifi card working under debian etch
date: 2006-11-26T15:11:30+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/11/26/getting-a-wmp56g-pci-wifi-card-working-under-debian-etch/
permalink: /2006/11/26/getting-a-wmp56g-pci-wifi-card-working-under-debian-etch/
categories:
  - Debian
---
So I got my card working not long ago, then went and bought a amd64 pc and had to do it all again. It wasn&#8217;t a walk in the park last time, and this time the driver would compile but wouldn&#8217;t load. I was about to email the amd64 debian mailing list when I found someone saying to try the rt2x00 driver. So I did&#8230;

> module-assistant get rt2x00  
> module-assistant build rt2x00  
> module-assistant install rt2x00  
> modrpobe rt2x00

All fine, so I decided to try loading up the card.  
my /etc/network/interfaces looks like:

> iface wlan0 inet dhcp  
> wireless-essid MySSID  
> wpa-driver wext  
> wpa-conf /etc/wpasupplicant.conf

and my /etc/wpasupplicant.conf was modified from the wpa example supplied with the wpasupplicant package (/usr/share/doc/wpasupplicant) and looks like

> ctrl\_interface=/var/run/wpa\_supplicant
> 
> network={  
> ssid=&#8221;my ssid&#8221;  
> key_mgmt=WPA-PSK  
> proto=WPA  
> pairwise=TKIP  
> group=TKIP  
> psk=&#8221;my wifi key&#8221;  
> }

Then running 

> ifup wlan0

and I am connected.

Sooo much simpler than the [other way I did it](http://www.strangeparty.com/2006/10/08/installing-a-linksys-wnp54g-wireless-pci-card-in-debian-etch/)

EDIT: Don&#8217;t forget (like I did first) to grab the firmware from ralink as the driver won&#8217;t work without the firmware files!