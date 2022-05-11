---
id: 647
title: Fixing broken LVM and Sofware Raid on Linux
date: 2010-01-10T15:24:06+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/01/10/632-revision/
permalink: /2010/01/10/632-revision/
---
I have been building a backup pc our of mostly spare parts, including several old disks. To get the most reliability and space our of the disks, which are all different sizes, I decided to use software raid to mirror each chunk of data in pairs (raid 0) and then use LVM on top of each piece of raid to make all the raid volumes appear as one storage device to the linux OS.

The disks are as follows: 250G, 200G, 160G 120G, so to get the most space out of them I divided them as follows (Note: this is a simplification for the purpose of explanation, the real disk also has a raid 0, mirrored /boot/ partition which is not mentioned below. You need this because LVM is not supported by GRUB, so you can&#8217;t boot from a LVM volume):  
250G: A (200G), C (40G)  
200G: A (200G)  
160G: B (120G) C (40G)  
120G: B (120G)

A,B,C are partitions on the disks for software raid &#8211; I then set up software raid for each pair of A,B,C and set the created LVM physical volumes on top of them, which then are grouped together into one large volume group, giving me around 360G (actually less once you convert to base 2 rather than 10) of mirrored data storage. Note that I can lose any one disk and still have all my data (though I wouldn&#8217;t want to hang around too long replacing the disk as a second disk failing could mean you lose most of your data).

I actually created 3 LVM logical volumes, one for mounting each of / (the root of the disk for all OS data), /home (for all the stuff I actually really care about), and a volume for swap that doesn&#8217;t really need to be in lvm or raid, but it was just easier to do.

I previously wrote instructions about [how to setup LVM and software raid](http://), but this time round managed to completely screw the whole lot up just near the end. I forgot to define one of the raid devices in /etc/mdadm/mdadm.conf so next time I rebooted this raid device was not found in the early boot stages. As this raid volume is needed to create the full set of LVMs for my root filesystem, the system stopped booting right at the beginning because the LVM array was incomplete.

Fixing it was actually not to difficult, but I mention it here in case it is of help to anyone else (or in case I manage to do it again, which is probably likely)

Fist I booted a Ubuntu Live CD (actually a USB stick image created from my running Ubuntu laptop and a spare Ubuntu CD), but nearly any live cd should do. Once booted, I had to install (in the live session) mdadm and lvm2 as Ubuntu does not have these installed by default. Once you have these tools you can start your recovery (note that this needs to be done with root permissions, so _sudo -s_ or similar to get a root shell)

Find the raid devices with _mdadm &#8211;assemble &#8211;scan_ and then use _pvscan_ and _lvscan_ as required until your system has found your lvm config, then mount it (don&#8217;t forget to mount /boot/ too as we will need to rebuild the initrd)

<pre>mkdir /tmp/root
mount /dev/mapper/main-root /tmp/root
mount /dev/md0 /tmp/root/boot
chroot /tmp/root</pre>

Now you should be pretty much inside your root filesystem on your lvm array. Now we need to make sure all the raid arrays are configured in /etc/mdadm/mdadm.conf

Run _mdadm &#8211;detail &#8211;scan_ to generate the lines for the config file, and make sure each array is listed in /etc/mdadm/mdadm.conf

From here it is pretty simple, all we have to do is rebuild the initrd so that it knows how to find all the raid and lvm devices needed during boot. _dpkg-reconfigure linux-image-<your current kernel version>_ It is imporant to __make sure that you get the right kernel, so have a look in /boot to check you get the right version (_uname -r_ wont work here because you have booted your live cd image and not the kernel your box will run)

I got several warnings about /proc/ not being mounted, but this did not appear to be a problem.

Reboot, and you should be ok. You may want to make a copy of your current kernel in case you accidentally break it, just copy the linux-image&#8230;gz and initrd&#8230;gz from /boot/ to new names and run _update-grub_ and that should give you two kernels to choose from (hopefully booting choosing them in the right order, the order should be based on the version numbers in your kernel files so adjust if needed)