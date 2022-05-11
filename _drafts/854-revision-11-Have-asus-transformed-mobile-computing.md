---
id: 871
title: Have asus transformed mobile computing?
date: 2011-09-29T07:32:55+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/09/29/854-revision-11/
permalink: /2011/09/29/854-revision-11/
---
I have been debating buying either a netbook style computer or a tablet for quite a while. In the end I decided on something in between, and recently bought an Asus eee Transformer.

There are some bugs around the hardware keyboard. Browser performance is not particularly brilliant with the keyboards as there is a fair delay. I also found that some keys don&#8217;t quite wok properly. but that appeared to be related more with the website and possibly javascript rather than the hardware keyboard itself (Specifically I had issues writing this post via the browser, however the wordpress android app is quite good and works incredibly well on a tablet). There are some blog post suggesting Asus has some fixes in the works, but it is not clear if they are already attempted or still to come.

Web browsing on the Transformer is very nice, as you would probably expect. Flash supports means it feels just like a real desktop browser experience. In fact, in some ways the browser experience is slightly nicer that on a PC, as pinch zoom and touchscreen scrolling feel very natural, even with a keyboard.  
The only negative about the browser experience, is that pages seem to load slightly slower than I have become accustomed to on my pc/laptop.

The gmail app is very nice, very well polished and uses the screen real estate quite well, as you would expect from Google given that they wrote the OS!

Using the device for ssh is still a bit fiddly as the hardware keyboard is not supported by the current version of Connect Bot, though there is a fork which seems to sort out most of the problems. Alternatively, there is enough screen realestate to make the Hackers Keyboard a real alterntative, and as it has and escape key and all other keys, it is actually quite usable for remote sessions.

Multitasking seems to work reasonably well, though it slower switching between apps that I am used to compared to a simple alt+tab on linux. Copy and paste works well and many apps even support ctrl+c to copy, etc.

Android 3.2 comes with an encryption option which makes me more comfortable having all my mail account instantly accessible, as the risk of having such a device stolen means that access to all my email and other accounts is easy to obtain. One word of caution &#8211; you cannot change you encryption password yet, though you can later change the unlock code, so choose a memorable code (once encrypted you cannot remove the encryption except with a full-reset). I have heard people saying that you can access some data by connecting it to a computer, however I haven&#8217;t managed to connect it at all on linux (it uses the MTP (media transfer protocol rather than USB mass storage) and it is fiddly on linux). Similarly the ASUS sync software is no available for linux. For me this isn&#8217;t an issue as I can copy files via SMB from on the device, and I also user FolderSync to pull down whole trees of files such as a smaller (3.5G) copy of my photos. (Sadly, at the time of writing, bugs to do with android file timestamp interface make a two-way sync annoying and almost pointless).

Overall, I am really happy with the device. A lot of what I use a computer for is reading things on the web, often via feedreaders, and email. For this, the device really excels.

Others have started looking at how to do development actually on the device, and thing like SL4A, which provides native perl, python and other scripting interfaces opens up some simpler development environments than the full android SDK. For me, I mostly want to just write scripts on other boxes, and working over ssh is how I normally do that anyway.