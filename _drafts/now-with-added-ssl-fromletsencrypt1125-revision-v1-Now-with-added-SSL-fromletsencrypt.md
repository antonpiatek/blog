---
id: 1126
title: Now with added SSL fromletsencrypt
date: 2016-08-22T18:51:27+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2016/08/22/1125-revision-v1/
permalink: /2016/08/22/1125-revision-v1/
---
I&#8217;ve had SSL available on my site for some time using [startssl](https://www.startssl.com/), but as the certificate was expiring and requires manual renewal, I though it was time to try out [letsencrypt](https://letsencrypt.org/). I&#8217;m a huge fan of the idea of letsencrypt, which is trying to bring free SSL encryption to the whole of the internet, in particular all the smaller sites who might not have the expertise to roll out SSL or where a cost might be restrictive.

There are a lot of scripts for powering letsencrypt, but [getssl](https://github.com/srvrco/getssl) looked the best fit for my use case as I just wanted a simple script to generate certificates, not manage apache configs or anything else. It seems to do a pretty good job so far. I swapped over the certificates to the newly generated ones and it seems pretty smooth sailing.