---
id: 397
title: Remote support for my family
date: 2008-09-17T13:50:50+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2008/09/17/344-autosave/
permalink: /2008/09/17/344-autosave/
---
[Andy Piper write about Remote PC support for family members](http://andypiper.wordpress.com/2006/09/07/remote-pc-support-for-family-members/) a while ago, and I remember playing with the single click reverse vnc, based on ultravnc. However I dont run windows often, so the idea died.

Today I played with getting it working under linux. The single click reverse vncserver part is still the same, but for the client I had three choices &#8211; Run a native vncviewer, which wouldnt support encryption, run the java ultravnc client which also does not support encryption, or get the ultravnc viewer working under Wine.

The third option was most enticing, as I want encryption working. Wine launches it fine, but getting the encryption to work was harder &#8211; fist make sure you have the version 1.16 of the [MSR4C plugin](http://msrc4plugin.home.comcast.net/~msrc4plugin/oldstuff.html), as the single click ultravnc builder uses that version. Then copy your encryption key and the plugin file to _~/.wine/drive\_c/Program\_Files/ultravnc/_ so that when wine runs th program it finds them all in the right places. I then launch the viewer with wine (from within that dir to be sure everything finds the right files) as follows: _wine vncviewer.exe -dsmplugin MSRC4Plugin.dsm -listen_

Then all you have to do is set up your firewall, and of course [customise your single click help executable](http://www.uvnc.com/addons/singleclick.html)