---
id: 592
title: 'dpatch &#8211; using patch files in Debian packaging'
date: 2009-11-08T18:14:10+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2009/11/08/497-revision-2/
permalink: /2009/11/08/497-revision-2/
---
I do a fair bit  of packaging of Debian and Ubuntu packages at work, often having to make tweaks to upstream packages. I used to just hack the upstream source directly, but have now discovered dpatch.

dpatch is a clever addition to the Debian packaging process which allows all your changes to be stored as patch files in the debian/ subfolder in the source package rather than having to modify the upstream source. There are good reasons to do this &#8211; You can easily see what you have changed in the source, and therefore can remove the changes easily if the need arises. It also allows upgrading the upstream source more easily as you do not have to patch the code yourself (and only have to do anything if the upstream code has changed too much for patch to figure out where the changes need to go)

<http://matrixhasu.altervista.org/index.php?view=use_dpatch> is an excellent introduction for dpatch, and certainly got me going.

The basics of dpatch are pretty simple. After installing dpatch on your system, you can start using it in your source package straight away.

I prefer to start with the debian/rules file and add dpatch support first, as dpatch can complain in some of its commands if you have not done this step first. The easiest way to do this is simply to add the following line near the top of debian/rules

> <pre>include /usr/share/dpatch/dpatch.make</pre>

This pulls in several dpatch definitions for make, allowing it to be called easily. Next you have to change the build-stamp and clean definitions in your debian/rules. The basic idea is to tell dpatch to patch files before the build happens, and to remove the patches during the clean. This way you can work with the original package, and dpatch will add your patches automatically during package build.

> <pre>build-stamp: patch-stamp
... 
clean: unpatch</pre>

Now dpatch will apply any patches found in debian/patches (though it does need an index of patches to apply). Of course there are other ways to configure dpatch, see _man dpatch_ for details.

Now you want to change your code. The dpatch-edit-patch command will copy your packages source tree to a temporary directory and put you in a new shell. You simply edit the code to make the change you want, then logout of that shell and dpatch will work out what you have changed and save those changes to a patch file.

For a new patch you probably want to use the _&#8211;add2list_ flag as it adds your patch to the index of patches to apply. The following is an example of creating a new patch

> <pre>dpatch-edit-patch --add2list 01_my_patch_name</pre>

If you want to go back and make changes to your patch you can just run

> <pre style="font: normal normal normal 12px/18px Consolas, Monaco, 'Courier New', Courier, monospace;">dpatch-edit-patch 01_my_patch_name</pre>

That is the basics of dpatch. You can apply all patches with _dpatch apply-all <span style="text-decoration: underline;">a</span>_