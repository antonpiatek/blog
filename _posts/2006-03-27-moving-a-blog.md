---
id: 104
title: Moving a blog
date: 2006-03-27T09:46:27+00:00
author: Anton Piatek
layout: post
guid: http://strangeparty.com/2006/03/27/moving-a-blog/
permalink: /2006/03/27/moving-a-blog/
categories:
  - Misc
---
No, I am not moving, but a friend is&#8230; From Blogger to [WordPress](http://wordpress.org).

[The Lost Oupost](http://andypiper.wordpress.com/) has moved, and it ra[i](http://www.somacon.com/p145.php)ses some interesting questions. Such as how do you get everything moved? The posts and comments are just some hacking of mysql, but how about external links and search engines?

I have never been one to rate my blog, but I suppose if it ever got a decent rating I might care more about it, so how do you transfer that over to your new blog?

I suppose you could try an apache [301 redirect](http://httpd.apache.org/docs/1.3/mod/mod_alias.html) if you have access to your own server, but I doubt if blogger lets you do that. What about with [javascript](http://www.somacon.com/p145.php)? Doesn&#8217;t work very nicely&#8230;

I guess the best thing you could do is try to write a script to forward users and pass the old address, giving a temporary redirect with the new site and new page, and then either have that processed on the old server, or have the new one do it. Not a very nice solution, but then when you don&#8217;t host your own server you have limited options&#8230;