---
id: 227
title: Syncing ratings between Bibble and Picasa
date: 2007-04-22T17:22:45+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2007/04/22/syncing-ratings-between-bibble-and-picasa/
permalink: /2007/04/22/syncing-ratings-between-bibble-and-picasa/
categories:
  - Photography
  - Programming
---
I use [Bibble](http://www.bibblelabs.com/) to manage my RAW digital photos. As such doign slideshows is rather limited as Bibble does have a special mode for them and RAW&#8217;s are slow to convert. So I export some smaller JPG&#8217;s for use in slideshows/screensavers etc. and as such I have a folder of raw images, and a folder of jpg image, both with the same structure and more or less the same images in them.

[Picasa](http://www.google.co.uk/pagead/iclk?sa=l&ai=BOK4ol5krRtu4NYrg0ASn9oTkBaLAnxyai-3IAsTY3pUBwLgCCAAQARgBOAFQw8rSov______AWC7BqABxNLL_gOqAR9vcmcuZGViaWFuOmVuLUdCOnVub2ZmaWNpYWwrM0YzyAEB2QO-BjbpbmQRd-ADEA&ggladgrp=244246506&gglcreat=594721986&adurl=http://picasa.google.co.uk#utm_campaign=en&utm_source=en-ha-emea-uk-google&utm_medium=ha&utm_term=picasa) does a wonderful job for showing of photos to friends, and is really nice for flagging up favourites however I want those ratings to be transferred back to Bibble. So i started writing a script to do it&#8230;

Bibble uses a config file per image that holds rating information, whereas Picasa uses a file per directory. I started parsing the config files by hand, but realised that this was going to be tricky for writing the files back with new ratings (particularly if the files don&#8217;t exist yet). So I headed over to [CPAN](http://www.cpan.org/) to look for an existing perl module to do this for me&#8230; It turns out that the config files are both a very simple .ini format that is handled quickly by [Config::Tiny.](http://search.cpan.org/author/ADAMK/Config-Tiny-2.10/lib/Config/Tiny.pm) so I installed the debian package for that (perl modules are packaged in Debian usually with a naming structure of lib<module-name>-perl, so the package I wanted is called libconfig-tiny-perl).

This package allowed very quick reading and writing of the ratings in the config files. I thought I was done then. The files were being updated as desired, but Picasa refused to show the new ratings&#8230; Playing around led to me changing an image and suddenly Picasa found the new rating from the config file. I guess Picasa cache&#8217;s the ratings data but if the date/time on the file changes then it reloads it, so after changing a rating in the picasa config I had to &#8220;touch&#8221; the associated image to get Picasa to reload the data (there is a perl module called File::Touch for that too!)