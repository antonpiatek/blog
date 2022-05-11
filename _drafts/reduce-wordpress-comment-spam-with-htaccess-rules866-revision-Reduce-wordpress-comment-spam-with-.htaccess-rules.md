---
id: 867
title: Reduce wordpress comment spam with .htaccess rules
date: 2011-09-14T13:55:42+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/09/14/866-revision/
permalink: /2011/09/14/866-revision/
---
Based on the mod_rewrite hack from http://www.wprecipes.com/reduce-spam-on-your-wordpress-blog-by-using-htaccess, I have my own slightly different version

> <pre>&lt;IfModule mod_rewrite.c&gt;
  RewriteEngine On

  RewriteCond %{REQUEST_METHOD} POST
  RewriteCond %{REQUEST_URI} .wp-comments-post\.php*
  RewriteCond %{HTTP_REFERER} !.*strangeparty\.com.* [OR]
  RewriteCond %{HTTP_USER_AGENT} ^$
  RewriteRule .* / [R=301,L]
&lt;/IfModule&gt;</pre>

This basically rewrites the url back to / (edit the last line if you want to set it to somewhere else). The rule only works if the request is a POST request and for the wp-comments-post.php file, and either the referrer url was not your site or the user agent is empty. I can&#8217;t think of anything that sends blank user agents, so this should be pretty safe. All browsers should also send the referrer url, so again this should be pre