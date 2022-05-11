---
id: 741
title: verified by visa being targetted
date: 2010-10-19T11:04:29+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/10/19/739-revision-2/
permalink: /2010/10/19/739-revision-2/
---
It seems that verified by visa is not as secure as it was originally made out:

> &#8220;We&#8217;ve never claimed that those systems are 100% secure,&#8221; said Mark Bowerman from the association.
> 
> &#8230;
> 
> Visa says the best way to ensure a webpage is genuine is to register for Verified by Visa through a bank&#8217;s website and set a personal assurance message.
> 
> This will appear each time details are entered into a bona fide Verified by Visa page. It also advises customers to check they are dealing with a reputable retailer.

via [BBC News &#8211; Fraudsters &#8216;copying online banking security&#8217;](http://www.bbc.co.uk/news/uk-11571873).

The problem with verified by visa, is that they recommend implementing the &#8220;verification&#8221; part inside an iframe. An iframe allows a webpage to include another webpage inside it. The problem is that no browsers warn you if that iframe is unencrypted, or contains an invalid encryption certificate

http://sxatech.blogspot.com/2010/02/3ds-verifed-by-visasecurecode-insecure.html

There are other studies on how bad verifified by visa: <http://www.cl.cam.ac.uk/~rja14/Papers/fc10vbvsecurecode.pdf>