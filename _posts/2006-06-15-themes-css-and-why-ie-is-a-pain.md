---
id: 141
title: Themes, css and why IE is a pain
date: 2006-06-15T21:29:09+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/06/15/themes-css-and-why-ie-is-a-pain/
permalink: /2006/06/15/themes-css-and-why-ie-is-a-pain/
categories:
  - Misc
---
So I have been working on the [theme](/theme/) on my site and while I still have a few things to do (including editing TinyMCE to do proper quoting of text and of code as well as embedded gallery images) but feel it is much better. For a start it looks much better in Internet Explorer.

Internet explorer is a pain to work with for websites, especially its CSS processing. It makes up its own rules and does what it wants, so I have extra stylesheets for IE to make it do what firefox and opera do. Saying that, firefox is not perfect either, as I found it rendered some things wrong too whereas opera actually did what I expected. This is not to say that opera is the best at following standards as I had to add some extra stylesheets as it had a few glitches I could not figure out why.

It is a shame that browsers cannot actually follow standards properly (though I had some fun when I did not have the DOCTYPE as the first text in the page and the browsers then reverted to a non-standard renderer (as opposed to XHTML). That really had me confused for a while as the whole of the embedded gallery was showing with huge fonts.