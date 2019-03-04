---
id: 590
title: Cross-platform realtime collaborative editing
date: 2009-11-11T12:04:21+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=590
permalink: /2009/11/11/cross-platform-realtime-collaborative-editing/
aktt_notify_twitter:
  - 'yes'
aktt_tweeted:
  - "1"
categories:
  - Internet
  - Linux
  - Technology
tags:
  - collaboration
  - editing
  - Linux
  - live
  - mac
  - opensource
  - windows
---
I recently stumbled across [Gobby](http://gobby.0x539.de/trac/):

> Gobby is a free collaborative editor supporting multiple documents in one session and a multi-user chat. It runs on Microsoft Windows, Mac OS X, Linux and other Unix-like platforms.

It looks really cool, and the realtime-editing would be very well suited to trying to draw up any form of document or source code at the same time when you will have too much activity for trying to use a code repository.

It is a shame Gobby does not have hooks builtin to allow loading code from a VCS or DVCS (that would be cool), but you can launch it headless on a server with an auto-save directory and then all connect in and start loading documents. There are times when I have wanted something like this, particularly when you are starting out a new piece of code and have several people wanting to get started right away. Once the pace dies down, it probably makes a lot of sense to move the file to your source code control system, but for that initial burst this looks like a fantastic tool