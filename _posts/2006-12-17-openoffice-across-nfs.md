---
id: 189
title: OpenOffice across NFS
date: 2006-12-17T19:32:44+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2006/12/17/openoffice-across-nfs/
permalink: /2006/12/17/openoffice-across-nfs/
categories:
  - Debian
---
I used to use samba for sharing files on my home network (most of my data is on a &#8220;server&#8221;) but it seemed to have nasty problems with wireless. It turns out NFS copes far better and allows mp3&#8217;s to stream nicely, so I fixed my IP address and got that setup (pretty easy actually).

The only problem I have found so far is that by default OpenOffice.org does not like to edit files across NFS as it wants to be able to lock files. I am not sure if you can allow file locking across NFS or not, but I found a workaround for OpenOffice, and I am not going to have a problem editing the same file from two places anyway.

Simply edit /usr/lib/openoffice/program/soffice (or /opt/openoffice2/program/soffice on non-debian distros) and comment out the lines

> `# file locking now enabled by default<br />
SAL_ENABLE_FILE_LOCKING=1<br />
export SAL_ENABLE_FILE_LOCKING`

and you can now open documents across NFS in write mode!