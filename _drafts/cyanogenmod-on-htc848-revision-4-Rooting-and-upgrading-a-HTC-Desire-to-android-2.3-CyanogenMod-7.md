---
id: 853
title: Rooting and upgrading a HTC Desire to android 2.3 (CyanogenMod 7)
date: 2011-07-25T08:01:40+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/07/25/848-revision-4/
permalink: /2011/07/25/848-revision-4/
---
I started writing this as I was actually doing this to my phone. The problem I found with most existing instructions is they seem to slightly contradict other instructions you find. Many have steps which are not well laid out and often don&#8217;t give a reason for doing things which can be a bit annoying. Often the instructions are from ancient Android OS version days, so steps like installing hboot versions, and recovery roms are now all covered with the one unrevoked3 step, but not all instructions are clear that this is the case.

These instructions are heavily based on the instructions from CyanogenMod 7 for HTC Desire: [http://wiki.cyanogenmod.com/wiki/HTC\_Desire\_(GSM):\_Full\_Update_Guide](http://wiki.cyanogenmod.com/wiki/HTC_Desire_(GSM):_Full_Update_Guide) but also some other sites I found along the way, often for other phone models so only parts apply. I also had some direct feedback from various IRC channels.

The following links were useful to me, so I mention in case you want to read some more:  
<http://forum.xda-developers.com/forumdisplay.php?f=628>  
<http://forum.xda-developers.com/showthread.php?s=ea2964d1e59f99d394ca758037ee6bc1&t=696189>  
<http://forum.xda-developers.com/showthread.php?t=788044>

## 1. Preparations

The first thing that may be of use, especially if you are checking other instructions, is to grab a few version numbers of the rom levels on your phone:

power off, hold vol down and power &#8211; get hboot version page, includes radio version  
mine was hboot 0.93.0001  
and my radio version is 5.11.05.27  
hboot version shouln&#8217;t matter for unrevoked3 though unless on very new phone like EVO4  
You can also check the radio version from &#8220;Settings->About Phone->Software information&#8221;.  
You should see &#8220;Basebane version&#8221;, mine is 32.49.00.32U_5.11.05.27  
The last part of that, after the _, is the radio rom version

## 2. Rooting your phone

Go to [http://unrevoked.com/recovery](http://unrevoked.com/recovery/)/ and download the rooting program.

This uses an exploit in the phone to install a new recovery rom, the &#8220;clockwork recovery&#8221; rom, which can then be used to do complete phone backups and install new roms.

You will need the &#8220;usb debugging&#8221; enabled on the phone, and the phone connected only to charge, not as disk access or tethering

It is straight forward on linux (run the downloaded file, and follow the instructions on screen), but I believe on windows there are soe extra drivers to install so check the unrevoked site for more instructions if you are on windows. .

I tried unrevoked3 with only 14mb available, and got &#8220;internal error: installing package failed&#8221;. Getting the space up to 25mb and it worked fine (I just uninstalled the gmail updates)

## 3. Backup your current OS (nandroid backup)

Reboot into the hboot screen as in step 1 for version numbers, then use use vol up/down to select &#8220;recovery&#8221;. The power button acts as the &#8220;ok&#8221; button here.

This boots the clockwork recovery rom which was installed when you ran unrevoked.

Then use trackball to select backup.

This does a complete backup to SD, also referrred to as a &#8220;nandroid backup&#8221; which should include the system OS, all installed apps and user data.  
You probably need as much space as your phone has on internal memory (512mb for desire).  
This will take a little while, so do it on power or a full battery.

The backup should appear in your sdcard in /sdcard/clokworkmod/backups/

Then press back and select the reboot option.

## 4. Backup apps and app data for migration

Why do you need this if you just did a complete backup? Well, when you install the new OS you will be erasing everything from the internal memory, so this backs up your apps so you can install them again, and also the app-data so you don&#8217;t lose it all.

I used the free version of &#8220;[Titanium Backup](https://market.android.com/details?id=com.keramidas.TitaniumBackup&feature=search_result)&#8221; but &#8220;[Astro File manager](https://market.android.com/details?id=com.metago.astro&feature=search_result)&#8221; has been suggested too, and it looks like &#8220;[Gemini App manager](https://market.android.com/details?id=com.seasmind.android.gmappmgr&feature=search_result)&#8221; can do this as well.  
It is pretty straightforward, but see <http://www.incredibleforum.com/forum/htc-incredible-hacks/7893-titanium-backup-how.html> if you want specific steps.

## 5. Backup your whole SD card

Ok, maybe I am paranoid, but at this point I plugged in my phone via USB and zipped up the entire SD card onto my computer. This way I have a backup of my SD card, which includes all the above backups, so if anything goes badly wrong I still have the restore files

I had to disable the usb debug mode to get the disk to mount

## 6. Update radio rom

Before applying the cyanogenmod, or any other, you may need to update your radio rom version.

According to [http://wiki.cyanogenmod.com/wiki/HTC\_Desire\_(GSM):\_Full\_Update_Guide](http://wiki.cyanogenmod.com/wiki/HTC_Desire_(GSM):_Full_Update_Guide) the version of mine is good enough for CM7, so I didn&#8217;t update it.

## 7. Now install new rom

Installing the mod is straightfowrard (there are [instructions in the first link of this page](http://wiki.cyanogenmod.com/wiki/HTC_Desire_(GSM):_Full_Update_Guide)).

Basically download the mod, and google apps if you want it, and drop the zip files in the root folder of the SD card.  
Then use the clockwork recovery mod as we did earlier and select &#8220;Wipe data/factory reset&#8221; to clear the flash (I have seen reports that this may not be required, but as it is such a large change of version numbers, I decided to do a full wipe), then &#8220;Wipe cache partition&#8221; to clear that too.

Then simply select &#8220;install zip from SD card&#8221; and install the new mod, and google apps if you wanted it.

Alternatively, you can use [Rom Manager](https://market.android.com/details?id=com.koushikdutta.rommanager) to do it as an app.

After the reboot, use your chosen backup program to then restore all your apps and data, however read the next step first as you may find space to still be an issue.

## 8. Space savings with CyanogenMod 7

After rebooting into the new OS, I had over 100mb free for base image (out of 148mb capacity reported by OS). 83mb free after installing a similar set of google apps from the market.

After then restoring all my backed up apps and data I found out I only had 25mb free, which is only about 10mb better than on the original android 2.2 from HTC.

You will probably find you have to install an app to force apps to install on SD card by default. Note that CyanogenMod 7 has an option to force all apps there by default, but it will put apps with widgets on there, which breaks the widgets.

**There is a way to get even more space for apps with CM7:**

All you have to do is add an ext4 partition to your SD card and then install &#8220;[simple2ext](https://market.android.com/details?id=ru.krikun.s2e)&#8221; from the android market.

This is a feature only available on the CyanogenMod 7 roms, and allows you to move all apps, app data, and caches to SD card. There is a performance hit for this, but it seems worth it.

I used a microSD adapter to plug in my SD card into my PC and used &#8220;gparted&#8221; on Ubuntu (a Live CD will do fine) to shrink the current partition and add an ext4 one  
without losing data (but you backed up above in any case, right?)

I created a 1GB partition and after installing simple2ext, I set it to move my apps and dalvik cache to the ext4 partition.

After a reboot I now have loads of space for apps to install to, about 80mb free despite installing another dozen apps without bothering to move them to SD.

To help you decide what to move, the Dalvik cache appears to be a binary cache for the Android implementation of Java. There is a performance hit to moving anything to SD unless you have quite a fast card (<http://forum.xda-developers.com/showthread.php?t=1175707> recommends ﻿minimum class 4, better yet a class 6). Mine is class 2, and I found that moving the application data seems to  
cause the phone to be very noticably slower, so it is probably best avoided unless you have a fast SD card.

Moving the Davlik cache did slow things down a little, but mostly only the boot time and first launch of an app. I decided that for an extra 80mb of space that I could live with that (I have also just ordered a new class 6 SD card, so that should help).

## Conclusions

Rooting, and modding was actually incredibly simple. It sounds so scary, but I think it is actually very, very hard to mess it up to a point where you cannot just overwrite with a new mod (or your backup) and start again. Once you get to the nandoid backup point you have a very good recovery strategy!

I have loads more space, which is good, because counting the bytes is annoying. I now don&#8217;t have to worry about if I have space to install something.

You do lose the HTC apps and widgets, but I found I could live without them fairly easily (I haven&#8217;t used peep since I discovered TweetDeck, and that was my most used HTC app). If you miss the clock widget, search for &#8220;[sense analog glass clock](https://market.android.com/details?id=factory.widgets.SenseAnalogGlass&feature=search_result)&#8221; on the android market, that is a nice replacement for me. &#8220;[glass widgets](https://market.android.com/details?id=dk.nicolai.buch.andersen.glasswidgets)&#8221; is a replacement calendar widget, which I now actually prefer.

The battery manager in the new rom is awesome compared to the old 2.2 one. It really shows where the battery is going. I think I possibly get longer battery life with this rom too.

The android 2.3 native keyboard is actually

There are some niggles &#8211; I have a few gui glitches which cause me to reboot the phone every few weeks, but I am hoping they will be fixed in the next stable build (I have not been brave enough to try the nightly builds :-s )

Overall, I quite like the new UI though it did take some getting used to. The fact I dont have to worry about space is the biggest reason I will keep this rom, though it does sound like [starburst rom](http://starburst.droidzone.in/) which is much closer to vanilla HTC sense branded android also allows the &#8220;data2sd&#8221; hack to get more space