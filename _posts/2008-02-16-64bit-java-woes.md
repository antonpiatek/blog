---
id: 329
title: '64bit java woes&#8230;'
date: 2008-02-16T12:12:18+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2008/02/16/64bit-java-woes/
permalink: /2008/02/16/64bit-java-woes/
categories:
  - Linux
tags:
  - 64bit
  - firefox
  - flash
  - iceweasel
  - java
  - Linux
  - nspluginwrapper
---
 One of the last annoyances with running 64bit linux is the fact that there are no java plugins available. I have 64bit firefox (well, iceweasel) with flash (using nspluginwrapper which allows the 32 bit version to work) but java is a no-go.[  
](http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=4802695) 

Turns out Sun has had a request open for this for 5 years: [Bug ID: 4802695 Support Java Plug-in on 64-bit AMD and Intel](http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=4802695)

Given they are looking at it for java 1.7, I guess I had better move back to 32bit firefox until then. I cannot find any reference to getting nspluginwrapper working for java