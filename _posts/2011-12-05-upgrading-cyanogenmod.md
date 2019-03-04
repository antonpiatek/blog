---
id: 887
title: Upgrading cyanogenmod
date: 2011-12-05T13:48:00+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=887
permalink: /2011/12/05/upgrading-cyanogenmod/
aktt_notify_twitter:
  - 'yes'
al2fb_facebook_link_id:
  - 518790023_10151006995670024
al2fb_facebook_link_time:
  - 2011-12-05T14:02:18+00:00
al2fb_facebook_link_picture:
  - wordpress=http://www.strangeparty.com/?al2fb_image=1
aktt_tweeted:
  - "1"
categories:
  - Android
  - Misc
  - Technology
tags:
  - Android
  - cyangenmod
  - roms
---
I previously wrote about [rooting a HTC Desire and installing CyanogenMod 7](http://www.strangeparty.com/2011/06/23/cyanogenmod-on-htc/). A month or so ago, a new [CyanogenMod](http://www.cyanogenmod.com/) rom was released, and I finally found the time to upgrade it.

Of course I first did a full backup, as described in my previous post, using the recover mod.

I first tried updating the rom via [RomManager](https://market.android.com/details?id=com.koushikdutta.rommanager&hl=en), which is apparently the preferred way to upgrade CyangonMod roms. Updating the Clockwork Recovery Mod went fine, and the app allows very easy downloading of alternate roms, however actually intalling did not go so well. It failed due to some error in the upgrade script. I decided to simply report the error and move on to a manual upgrade.

Manually updating was pretty much the same as installing the roms in my previous post. Using the reovery mod I installed the new Rom from the zip which was downloaded via RomManager, followed by the Google Aps zip. Then I cleared the Dalvik cache, as I wasnt sure if it would interfere (it doesn&#8217;t hurt to clear it anyway).

The update was quite smooth, and after a reboot or two nearly everything was working as before, though it took a while for all the app icons to come back on my desktops. As I did not reset any application data I did not have to reinstall any of my apps or restore the data.

The only issue I found is that the calendar would crash upon starting. I installed [CatLog](https://market.android.com/details?id=com.nolanlawson.logcat), which allows you to view the android system logs, and very quickly found a stack trace from the calendar app saying it could not find a database column.  
<img style="display: block; margin-right: auto; margin-left: auto;" src="http://www.strangeparty.com/wordpress/uploads/2011/12/wpid-screenshot-1323091961687.png" alt="image" width="288" height="480" />  
I guessed that the storage format must have changed, and as it is all synced from my Google calendar anyway, I thought I would just clear the data and let it resync. Under System->Applications I found the app CalendarStorage, and simply deleted all its data. After a moment to resync from the cloud, everything looks fine.

The latest CyanogenMod 7.1 seems to have some fixes I have been waiting for. In particular, I quite liked the dual lockscreen. A shorter timeout for a swype unlock, where the lockscreen has a music widget. The longer timeout is the unlock pattern. This was not possible in the older CyanogenMod 7.0.3 as a bug seemed to only show the pattern unlock screen.

There is quite a list of new fixes, but I don&#8217;t think I needed any of them. One new thing I noticed is that holding down the power button gives not only the usual shutdown/reboot options, but also a screenshot option, which is quite useful and removes the need for a separate app to do this.