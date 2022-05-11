---
id: 370
title: WordPress, k2, openid
date: 2008-06-05T11:47:19+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=370
permalink: /2008/06/05/wordpress-k2-openid/
categories:
  - Internet
  - Misc
  - Technology
tags:
  - openid
  - wordpress
---
I use the [k2 theme](http://code.google.com/p/kaytwo/) for this wordpress blog. I used to write my own, but k2 is much, much neater. I also use the [openid plugin](http://wordpress.org/extend/plugins/openid/) for wordpress. ([I wrote about openid&#8217;s before](http://www.strangeparty.com/2008/03/28/openid/))

To get the two to play together, you need to turn off live commenting.

In my case, as my blog is also my openid url (see this [tutorial in delegating your open id](http://www.intertwingly.net/blog/2007/01/03/OpenID-for-non-SuperUsers) if you want to use your blog or website as your openid url, and any provider), I had to add some code the the [k2 style&#8217;s functions.php](http://code.google.com/p/kaytwo/wiki/K2CSSandCustomCSS)

<pre>add_action('wp_head', 'custom_header');

function custom_header () {
        ?&gt;
        &lt;link rel="openid.server" href="...openid provider url..."/&gt;
        &lt;link rel="openid.delegate" href="...openid provider url..."/&gt;
        &lt;?php
}</pre>

Now you have your own blog as your openid url, and your blog accepts openid&#8217;s for comments with the k2 theme 🙂