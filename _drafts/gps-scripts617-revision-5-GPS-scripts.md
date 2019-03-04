---
id: 631
title: GPS scripts
date: 2010-01-03T21:21:55+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/01/03/617-revision-5/
permalink: /2010/01/03/617-revision-5/
---
I have a simple walking GPS (Garmin Etrex H) which is great for walks, hiking etc. I wrote about [using it under Ubuntu](http://www.strangeparty.com/2009/11/09/garmin-etrex-h-on-ubuntu/) earlier.

I can input waypoints and use it to direct me where to go and it can be set to tell you where you are in BNG (British National Grid, i.e. Ordnance Survey map coordinates) so working with a map becomes almost trivial. One thing I found I needed was a way of creating a GPX file to upload to the GPS which is formed from these BNG coordinates. Some of the walking books I have give BNG waypoints but you can&#8217;t just upload that data into the GPS (unless someone knows better? I never got it to work).

So I set out writing a script to do this &#8211; [BNG\_to\_gpx_route](﻿http://github.com/antonpiatek/gps/tree/master/BNG_to_gpx_route/) allows you to enter a list of BNG waypoints and it either outputs the GPX file (to file or stdout) or even writes direct to your GPS if you have gpsbabel installed!

I may well write a few more scripts to help me with my gps as I come across the need (though if you have a need maybe I will too, so let me know if you have a thought for a useful util for your gps).

Another good way to plan a route is with [Marengo GPS Route Planner](http://www.marengo-ltd.com/map/), which allows you to draw a path with a google-maps interface, and then simply download a GPX file which can again be uploaded to your GPS with gpsbabel

My GPS also records where you have walked which is known as a track. This can be used for finding your way back if the walk was difficult, or giving to someone else to follow your walk. One other use is for geotagging your photos, which means you run a script against your photos to add to the &#8220;meta-data&#8221; which describes details of your photos, and with the track file from your gps it adds the coordinates to the file, so when you upload them to flickr or zoomr they know where the photo was taken!

Like many others, I wondered if I would have to write this myself but it turns out there is a really good script called [gpsPhoto](http://www.carto.net/projects/photoTools/gpsPhoto/) (thanks to [bluemonki](http://blog.bluemonki.net/2008/07/16/how-to-automaticallyautomagically-geotag-your-photos-using-open-source-stuffs/) for pointing it out) which already does this!

It is pretty simple, you just need to give it the path to a gps file, or directory of files, and a list of photos or a directory of photos, along with a time offset (in case your gps time and camera are different (i.e. a few minutes out, or even an hour out for daylight savings time etc)) and it will add the gps coordinates to your photos. Apparently it even works on Canon raw files, so hopefully I could just tag photos as I get them from the camera and then any time I create a new jpg from them they should automatically have the gps data in them!