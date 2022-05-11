---
id: 164
title: Mozilla vs Debian Analyzed
date: 2006-10-12T07:46:37+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/10/12/mozilla-vs-debian-analyzed/
permalink: /2006/10/12/mozilla-vs-debian-analyzed/
categories:
  - Debian
  - Internet
  - Technology
---
Slashdot pointed my to an article which summarises the long problem between [Debian](http://www.debian.org) and [Mozilla](http://www.mozilla.org).  [Mozilla vs Debian Analyzed](http://slashdot.org/article.pl?sid=06/10/10/212236&from=rss) covers some of the basics behind the problem which is hard to believe.

The basic premise of the argument, which may stop Mozilla Firefox and Thunderbird shipping in Debian, is that the logo&#8217;s for the software are trademarked, and hence are not free for anyone to use. Debian has a strict policy on what is included in a release, and non-free software just doesn&#8217;t make it. So Debian want to ship Firefox without the logo&#8217;s, but you can only call it Firefox if you use the logo&#8217;s. There are also problems with code changes to the software, as Debian often fixes problems, or [changes the code slightly](http://packages.debian.org/changelogs/pool/main/m/mozilla-firefox/mozilla-firefox_1.0.4-2sarge11/changelog) to make it fit into Debian better.

Essentially the Mozilla foundation don&#8217;t want to let Debian use the name Firefox without the logo&#8217;s and without checking the code changes (and even build options) first. At this rate, as Etch is supposed to ship around the end of the year, or early next year, Firefox will only appear in Debian under the name IceWeasel!

This should never have got this far. There must be a better way of working the problem out&#8230; All I can say is that if this continues, Firefox could have competition from IceWeasel, as the Debian packagers are really good at patching the Mozilla codebase.