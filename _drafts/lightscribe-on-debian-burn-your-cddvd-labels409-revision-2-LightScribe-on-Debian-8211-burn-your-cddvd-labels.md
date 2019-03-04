---
id: 411
title: 'LightScribe on Debian &#8211; burn your cd/dvd labels!'
date: 2008-10-25T16:24:22+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2008/10/25/409-revision-2/
permalink: /2008/10/25/409-revision-2/
---
I have started doing some photography for other people, so decided I should really put some effort into how I present the photos. I thought about buying an inkjet for printing labels, but they weren&#8217;t all that cheap and from my experience with inkets in the past the ink dries out and is rather expensive to replace.

I also had problems finding inkets that could print direct to cd from linux&#8230; Then BlueMonki suggested a LightScribe drive. LightScribe is a technology where you put the disk in the burner upside down and it etches a label onto it. Of course you need a new drive and specific media, but the drives are available for £20 and media is less than 30p each, which is more expensive than a normal dvd+r but not a problem for occasional use.

I picked up a Samsung drive because it was cheap, and came with 3 faceplates, so I could match my silver pc case. I was a little worried that I would have a hard time making the software work, but it was really easy.

Install the [LightScribe system software](http://www.lightscribe.com/downloadSection/linux/index.aspx?id=814), available in 32bit .debs, and install it with _sudo dpkg -i <downloaded deb>_  
Then install the [LaCie LightScribe labeller](http://www.lacie.com/support/support_manifest.htm?id=10204) software which you will have to convert with _alien &#8211;scripts <downloaded file.rpm>_ before you can install it (you might need to install alien from apt/synaptic first), then install it with dpkg as well

You can also use the LightScribe simple labeller if you just want text, but its a little boring to do that. If you do use it, after aliening the rpm and installing it you might need to change the group of /opt/lightscribeApplications as Debian doesnt have a wheel group. I used &#8220;_sudo chgrp cdrom -R /opt/lightscribeApplications_&#8221; as I am in the cdrom group and that sounded the most sensible group name.

You will probably want to work on your images with Gimp, or your favourite image tool, to add text to your cd label, though you could just use an image without text.

I found a cd template file [here](http://fox-gieg.com/tutorials/2006/lightscribe-for-mac/), which I modified to make square and make the middle transparent so I could add a layer in gimp and add stuff in the right places, then turn off the layer to save the image for burning. My version is [here](http://www.strangeparty.com/wordpress/uploads/lightscribe%20template.xcf.gz), consider it in the public domain.

Once you have your cool cd label image created, you want to burn it. Simple run &#8220;_4L-gui_&#8221; (I couldnt find an icon for this, so you might need to run it from the run dialog or a console window), select your image, move it and scale it as needed then hit the burn button in the top right.

It all worked straightforward, which was surprising. Best of all it seems that the LaCie software will work on any LightScribe drive so buy whichever one you fancy.

There is a lot more software out there for windows, but you will probably want to do more than they let you, and then you simple need Gimp and something to burn an image.

It is worth pointing out that burning the label takes ~15 minutes, but I