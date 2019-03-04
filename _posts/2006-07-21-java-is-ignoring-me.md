---
id: 144
title: Java is ignoring me
date: 2006-07-21T13:24:38+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/07/21/java-is-ignoring-me/
permalink: /2006/07/21/java-is-ignoring-me/
categories:
  - Programming
---
I spent a fair amount of time the other day, trying to figure out why java is ignoring all classpath options I had set (both command line and CLASSPATH var) when working with my Jar file. After getting at least one other person to have a look, google finally yielded someone with the [same problem](http://www.velocityreviews.com/forums/t142693-java-jar-ignore-the-classpath-command-line-argument.html)

Turns out that it is not a bug. It is in fact behaving correctly &#8211; yes accoding the the [specs](http://java.sun.com/j2se/1.4.2/docs/tooldocs/linux/java.html) java is supposed to ignore all classpath options when you are using a Jar file. I guess I have never done any complex java and put it in a Jar (though most people I talk to didn&#8217;t realise this, or forgot about it)  
The solution is of course to put a line in the [manifest](http://java.sun.com/docs/books/tutorial/deployment/jar/downman.html) so that it knows what jar files it needs&#8230;