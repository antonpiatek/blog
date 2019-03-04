---
id: 132
title: Automated Backups
date: 2006-06-04T18:29:38+00:00
author: Anton Piatek
layout: post
guid: http://strangeparty.com/2006/06/04/automated-backups/
permalink: /2006/06/04/automated-backups/
categories:
  - Internet
  - Linux
---
I recently wrote about [Backup Options](http://strangeparty.com/2006/05/24/backup-options/) but never mentioned how I actually kicked off the backups.

I use a [crontab](http://en.wikipedia.org/wiki/Crontab) to start my backups, it looks like this:

<blockquote class="code">
  <p>
    @daily unison -times -batch /home/anton/Documents ssh://MyServer/Documents -servercmd /home/anton/bin/unison >> $HOME/cron.unison.log 2>&1<br /> @weekly rsync &#8211;stats -auv &#8211;delete &#8211;exclude &#8220;*.db&#8221; &#8211;exclude &#8220;*/.pics/&#8221; &#8220;/home/anton/My Photos/&#8221; home:&#8221;~/My Photos/&#8221; >> $HOME/cron.rsync.log 2>&1
  </p>
</blockquote>

I am sure you can achieve this under windows with either [cywin](http://www.cygwin.com/) (which you will probably want for a good command line ssh client/[unison](http://en.wikipedia.org/wiki/Unison_%28file_synchronizer%29) anyway) or with the scheduled tasks and a batch file.

The commands are fairly simple, and redirect all output to cron..log (the &#8220;>>&#8221; redirect means it will append to the file and &#8220;2>&1&#8221; will redirect all errors as well)

[Rsync](http://en.wikipedia.org/wiki/Rsync) lets me exclude certain files. In this case I am excluding windows .db files (windows explorer thumbnails) and .pics directories (Digikam thumbnails), though I could copy them too.

The reason my photos are weekly as opposed to daily is because I might change/add enough photos for the upload to take more than 24 hours on a slow broadband connection (I do not want two scripts running at once, though there are defenitely better ways of achieving this i.e. writing a script to do the backup that checks for a lockfile)