---
id: 510
title: KDE 4.2 on Debian
date: 2009-04-21T18:12:37+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2009/04/21/509-revision/
permalink: /2009/04/21/509-revision/
---
I recently installed KDE 4.2 on my Debian laptop, and found the whole process surpisingly easy and now working very nicely.

Following the instructions from [The Debian KDE maintainers website](http://pkg-kde.alioth.debian.org/kde4.html), all that is required is enabling a sid repository and then installing the **kde4** package which does the usual full-install of KDE. It is worth noting that it will warn you about installing in a running KDE session, so it is best to logout and use another windowmanager (like the failsafe one) or just a virtual console.

Once done, log back in with KDE and the migration wizard will move your data over (backing up the KDE3 settings in case you want to revert).

For me the process was painless and fairly quick. Configuring KDE to my liking took a little while, but I am quite liking it now and the widgets are quite cool. I have yet to turn on the special effects as I never got round to sorting out the ATI 3D drivers on my laptop since installing it, as they have been rather poor in the past (not sure if they are better now, but I use less power without hte eff