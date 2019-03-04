---
id: 872
title: Reduce wordpress comment spam with .htaccess rules
date: 2011-09-29T07:36:37+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/09/29/866-revision-2/
permalink: /2011/09/29/866-revision-2/
---
I get quite a lot of spam comments on my wordpress blog, and even with things like akismet to try and detect and block spam I still get a lot. Some people have suggested using a mod_rewrite rule in apache to detect very obvious attempts to post unsolicited comments. The basic idea is that if anyone tries to submit a comment and they have not set a referrer in the HTTP headers of your site, then they probably aren&#8217;t doing anything near normal browsing. Also, a blank user agent is also only common if you have gone to the effort of not setting one.

Based on the mod_rewrite hack from <http://www.wprecipes.com/reduce-spam-on-your-wordpress-blog-by-using-htaccess>, I have my own slightly different version

> <pre>&lt;IfModule mod_rewrite.c&gt;
  RewriteEngine On

  RewriteCond %{REQUEST_METHOD} POST
  RewriteCond %{REQUEST_URI} .wp-comments-post\.php*
  RewriteCond %{HTTP_REFERER} !.*YOURSITE\.COM.* [OR]
  RewriteCond %{HTTP_USER_AGENT} ^$
  RewriteRule .* / [R=301,L]
&lt;/IfModule&gt;</pre>

This basically rewrites the url back to / (edit the last line if you want to set it to somewhere else). The rule only works if the request is a POST request and for the wp-comments-post.php file, and either the referrer url was not your site or the user agent is empty. I can&#8217;t think of anything that sends blank user agents, so this should be pretty safe. All browsers should also send the referrer url, so again this should be pretty safe.

Don&#8217;t forget to change &#8220;YOURSITE\.COM&#8221; to your domain name