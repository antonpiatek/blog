---
id: 350
title: software raid1 and lvm on debian etch
date: 2008-05-24T11:47:38+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=350
permalink: /2008/05/24/software-raid1-and-lvm-on-debian-etch/
openid_comments:
  - 'a:1:{i:0;s:4:"6557";}'
categories:
  - Debian
tags:
  - Debian
  - filesystems
  - Linux
  - lvm
  - raid
  - software
---
**Background**

I have a fileserver box, which currently has 2x200GB disks in lvm to give me a 400GB virtual disk. This arrangement gets good use of space, but if one disk has a failure, then the whole filesystem is trashed and cannot be recovered.

The solution is to start using raid. Before I go on, raid is not a backup solution. It cannot protect you from accidentally deleting all your files, and will not protect you from a virus or malicious user or hacker. Raid just reduces the damage if a disk happens to fail (which knowing my luck, is sometime soon).

The final solution I want is 2x500GB disks in raid1 (mirrored) with lvm on top to split into my partitions. This way I could add another pair of disks in raid, add them to the lvm and not have to worry about which partitions get new space, as lvm will allow me to expand any parition onto the new space, and have a partition across multiple disks.

Why not raid5? Raid 5 is great for getting space, as you have n+1 disks, and get the space of n disks out of it as one is the redundant disk. The problem with raid5 is it is limited to the smallest disk in the raid. So 2 500GB disks and one 200GB disk will only give 400GB as each disk can only be used up to 200GB. Raid5 is great if all your disks are the same size, but if I want to add disks, and not have to replace all 3+ disks, then with raid1 I just have to buy disks in pairs. My pc has 4 ide slots and 2 sata slots, so raid1 should be fine (disks are getting quite bit these days).

So the plan is to add 2 500GB disks. put them in raid1 with a partition for /boot (which cant be in lvm) and the rest becomes part of a lvm group, with my / and /home partitions in there (and /tmp, swap)

**How I did it**

<!--more-->

**Warning: This can seriously mess up your data. Please, please backup first &#8211; I didn&#8217;t and was sweating hard at one point when I thought I had lost my entire lvm array. I found the [Debian From Scratch (DFS)](http://people.debian.org/~jgoerzen/dfs/html/) a fabulous rescue CD**

_Note: This took me several attempts to actually finish writing, so there are probably some errors, so let me know if you spot anything that looks wrong or is ambiguous._

For background, my current setup has 2 disks. hda and sda. these are both 200GB, and /boot and swap are on hda, and the rest of hda and all of sdb are in my lvm group

I added my new 500GB disk as /dev/sdb and booted up.

Use fdisk to create a small (~100mb) parition for /boot. Set its type to _fd_ (linux raid). This parition cannot be in lvm, as grub does not understand lvm.  
Create another parition using the rest of the space for our lvm. Also set its type to _fd_

You may need to use partprobe or reboot to see the new partitions, however my Debian Etch box autodetected them when leaving fdisk

**Installing raid**

<p style="padding-left: 30px;">
  <em>$apt-get install mdadm</em><br /> <em>$cat /proc/mdstat</em> should look something like
</p>

<p style="padding-left: 30px;">
  Personalities : [linear] [multipath] [raid0] [raid1] [raid6] [raid5] [raid4] [raid10]<br /> unused devices: <none>
</p>

if not, you may need to load some modules &#8220;modprobe md;modprobe raid1&#8221;

Next, you will need to create some raid device entries.

<p style="padding-left: 30px;">
  <em>$mknod /dev/md0 b 9 0<br /> $mknod /dev/md1 b 9 1</em>
</p>

This creates a block device, major number (like a type) 9. As etch uses udev, you need to tell udev to do this next boot too

<p style="padding-left: 30px;">
  <em>$</em><em>echo M md0 b 9 0 >> /etc/udev/links.conf<br /> $echo M md1 b 9 1 >> /etc/udev/links.conf</em>
</p>

Now we can create our real raid array:

<p style="padding-left: 30px;">
  <em> $mdadm &#8211;create /dev/md0 &#8211;verbose &#8211;level=1 &#8211;raid-disks=2 /dev/sdb1 missing<br /> $mdadm &#8211;create /dev/md1&#8211;verbose &#8211;level=1 &#8211;raid-disks=2 /dev/sdb2 missing</em>
</p>

or the short version

<p style="padding-left: 30px;">
  $<em>mdadm -C /dev/md0 -n 2 -l 1 /dev/sdb1 missing<br /> </em>$<em>mdadm -C /dev/md1 -n 2 -l 1 /dev/sdb2 missing</em>
</p>

This creates a raid1 array md0 which has parition sdb1 in it and is expecting another disk soon, similarly raid1 array md1 has partition sdb2 and also expects another disk. A raid array without all its disks is called a _degraded_ array, as it is running and works, but is not in good condition.

Next we need to save the state of this array so that it will be loaded at next boot

<p style="padding-left: 30px;">
  <em>$mdadm &#8211;detail &#8211;scan >> /etc/mdadm/mdadm.conf</em>
</p>

**Adding/modifying VM**

To create a new lvm setup, the following commands are a quick guide to creating a single partition in your raid. You will probably want to create a few more paritions, as this just creates a single lvm logical volume called root

<p style="padding-left: 30px;">
  <em>$pvcreate /dev/md1<br /> $vgcreate vg0 /dev/md1<br /> $vgscan<br /> $lvcreate -L10G -n root vg0<br /> $mkfs -t ext3 /dev/vg0/root</em>
</p>

Then edit /etc/fstab to mount _/dev/vg0/root_ (you may need to refer to it as _/dev/mapper/vg0-root_) as _/_. Repeat for any other filesystems you may want, and then copy any data over

<p style="padding-left: 30px;">
  e.g.
</p>

<p style="padding-left: 30px;">
  <em>$mkdir /mnt/root<br /> $mount /dev/vg0/root /mnt/root<br /> $rsync -auHxv &#8211;exclude=/proc/* &#8211;exclude=/sys/* &#8211;exclude=/boot/* &#8211;exclude=/mnt / /mnt/root/<br /> $mkdir /mntroot/proc /mntroot/boot /mntroot/sys<br /> $chmod 555 /mntroot/proc</em>
</p>

I already had a LVM setup, so I wanted to migrate it from the old disks to the new raid disks

<p style="padding-left: 30px;">
  <em>$pvcreate /dev/md1<br /> $vgextend vg0 dev/md1<br /> $pvmove /dev/hda3 (this is gonna be slow)<br /> $vgreduce vg0 /dev/hda3<br /> $pvremove /dev/hda3</em>
</p>

Don&#8217;t forget a swap partition (can be in LVM too)

<p style="padding-left: 30px;">
  <em>$lvcreate -L2G -n swap vg0<br /> $mkswap /dev/vg0/swap</em>
</p>

Make sure you copy over your /boot to /dev/md0 too!

<p style="padding-left: 30px;">
  Then make sure you have edited /boot/grub/devices.map and /boot/grub/menu.lst to have the correct new devices
</p>

**Finishing off the config**

rebuild initrd to scan for raid devices  
 **!important, you need this for your initrd to load the raid so your kernel can find the root fs****!**  
__

<p style="padding-left: 30px;">
  <em>$dpkg-reconfigure linux-image-2.6.18-3-686</em>
</p>

(or whatever your current kernel package is). This is better than mkinitrd or update-initramfs as you dont need to worry about which you are using and is the &#8220;debian way&#8221;

Someone suggested adding a fallback in grub and a second boot entry, but they don&#8217;t use the automagic grub updating, so it will just get trashed when they upgrade kernels  
edit /boot/grub/menu.lst if you want to do this

<p style="padding-left: 30px;">
  [&#8230;]<br /> default 0<br /> fallback 1<br /> [&#8230;]
</p>

install grub on new disk(s)

you can reboot now if you want to see it working

**Add second disk to raid**

create same partition structure on /dev/sda, then add them to the raid as follows

<p style="padding-left: 30px;">
  <em>$mdadm &#8211;detail &#8211;scan<br /> $mdadm /dev/md1 -a /dev/sda2<br /> $mdadm /dev/md0 -a /dev/sda1</em>
</p>

<p style="padding-left: 30px;">
  <em>$watch cat /proc/mdstat</em><br /> Personalities : [raid1]<br /> md0 : active raid1 sda1[2] sdb1[0]<br /> 104320 blocks [2/1] [U_]<br /> resync=DELAYED
</p>

<p style="padding-left: 30px;">
  md1 : active raid1 sda2[2] sdb2[0]<br /> 488279488 blocks [2/1] [U_]<br /> [>&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;..] recovery = 0.1% (779328/488279488) finish=93.8min speed=86592K/sec
</p>

<p style="padding-left: 30px;">
  unused devices: <none>
</p>

when done you should see:

<p style="padding-left: 30px;">
  <em>$cat /proc/mdstat<br /> </em>Personalities : [raid1]<br /> md0 : active raid1 sda1[1] sdb1[0]<br /> 104320 blocks [2/2] [UU]
</p>

<p style="padding-left: 30px;">
  md1 : active raid1 sda2[1] sdb2[0]<br /> 488279488 blocks [2/2] [UU]
</p>

<p style="padding-left: 30px;">
  unused devices: <none>
</p>

delete the array lines from /etc/mdadm/mdadm.conf and run

<p style="padding-left: 30px;">
  <em>$mdadm &#8211;detail &#8211;scan >> /etc/mdadm/mdadm.conf</em>
</p>

__I am surprised that raid cannot figure this information out itself, but every webpages I saw says you need these lines in the config, and I am too scared to try not having those lines.

Make sure you rebuild your initrd so that it knows the raid setup at boot time and can initialise your root partition.

<p style="padding-left: 30px;">
  <em>$dpkg-reconfigure linux-image-2.6.18-3-686</em>
</p>

Add grub to second disk if desired

<p style="padding-left: 30px;">
  <em>$install-grub /dev/sda</em>
</p>

**discussion**

some sites suggest that dmadm.conf needs &#8220;devices=/dev/sdb6,/dev/sda6&#8221; for each array. Not sure if this is necessary. If you think you need it, other sites also suggest to use /dev/.static/dev/sdb6 instead of just /dev/sdb6 to make udev work properly. I dont have any devices set for my arrays &#8211; I would assume that is what the uuid is for, and mdadm finds them by scanning all paritions

I found the following page really helpful &#8211; <http://xtronics.com/reference/SATA-RAID-debian-for-2.6.html>