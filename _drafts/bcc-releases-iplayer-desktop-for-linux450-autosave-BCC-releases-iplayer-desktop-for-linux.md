---
id: 454
title: BCC releases iplayer desktop for linux
date: 2008-12-20T19:05:10+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2008/12/20/450-autosave/
permalink: /2008/12/20/450-autosave/
---
BBC recently [announced](http://news.bbc.co.uk/2/hi/technology/7787335.stm) that iplayer now supports downloads on windows an linux, in the form of iplayer desktop. You can get started on the [iplayer labs page](http://www.bbc.co.uk/iplayer/labs).

So I decided to try it out&#8230;

First I had trouble upgrading flash &#8211; Installing it was easy, but I found I still had a flash 9 install listed in my about:plugins page. Following the [Flash &#8211; MozillaZine Knowledge Base](http://kb.mozillazine.org/Macromedia_Flash#Linux_and_Solaris) page helped me solved this (it turns out I had a flash 9 file in my ~/.mozilla/plugins folder)

Then it was time to install iplayer. First it installed Adobe AIR, which was simple enough. Then the iplayer desktop app installed inside AIR &#8211; the security dialog for this was particularly unappealing as it did not have any knowledge of the publisher, let alone a secure signature or certificate to assure me it was really BCC content I was installing

<div id="attachment_449" style="width: 310px" class="wp-caption alignright">
  <img aria-describedby="caption-attachment-449" class="size-medium wp-image-449" title="iplayer security dialog" src="http://www.strangeparty.com/wordpress/uploads/2008/12/iplayer_install-300x295.jpg" alt="iplayer security dialog" width="300" height="295" />
  
  <p id="caption-attachment-449" class="wp-caption-text">
    iplayer security dialog - extremely bad! Why can't they get a digital signature for the download?
  </p>
</div>

After that it was plain sailing &#8211; Top Gear started downloading straight away, and was done within minutes.

It plays great, works fullscreen (though my laptop can&#8217;t manage full screen well, I probably need to look at setting up 3d acceleration which I didnt do when I installed it ~2 years ago as the drivers were rubbish), and the volume still goes to 11 like the iplayer.