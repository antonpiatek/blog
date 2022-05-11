---
id: 273
title: Selective greyscale in The GIMP
date: 2007-09-17T19:24:30+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/2007/09/17/selective-greyscale-in-the-gimp/
permalink: /2007/09/17/selective-greyscale-in-the-gimp/
openid_comments:
  - 'a:1:{i:0;s:5:"13507";}'
categories:
  - Linux
  - Photography
---
I decided to make a selective greyscale image in The GIMP, and as lots of friends say to me that they would like to use The GIMP more but don&#8217;t know how, I thought I would write a bit of a walkthru for how I did it.

[<img src="http://farm2.static.flickr.com/1212/1391484931_b46a4fe5b4.jpg" alt="orange flower" border="0" height="500" width="333" />](http://www.flickr.com/photos/antonpiatek/1391484931/){.tt-flickr}<!--more-->

  
<!--more-->

Starting with your colour image, use the lasso tool to select a large chunk of the area you want coloured (this is optional but usually makes things faster)

[<img src="http://farm2.static.flickr.com/1170/1391482125_9e662828cc.jpg" alt="snapshot1" border="0" height="286" width="500" />](http://www.flickr.com/photos/antonpiatek/1391482125/){.tt-flickr}

The next step is to get a coarse selection of the area we want coloured. You can use the &#8220;select by color&#8221; tool if the colour is pretty distinctive in your image, or use the &#8220;select contiguous regions&#8221; tool as I did. Holding shift will force the tool to add to the selection (otherwise it might try to move it if you click on an already selected area). Keep shift-clicking until you have most of the area you want selected.

[<img src="http://farm2.static.flickr.com/1391/1392375326_595beffce4.jpg" alt="snapshot2" border="0" height="466" width="500" />](http://www.flickr.com/photos/antonpiatek/1392375326/){.tt-flickr}

Next use a quickmask to start fine-tuning the selection. In the bottom left of the image window, click the little red box to turn on the quickmask. The red area is the area outside of the selection, so we want to make everything around the flower red.

[<img src="http://farm2.static.flickr.com/1431/1392374190_d94b770e6b.jpg" alt="snapshot3" border="0" height="500" width="402" />](http://www.flickr.com/photos/antonpiatek/1392374190/){.tt-flickr}

Select a large paintbrush and paint in the areas you want to be in your selection. Painting white will add to the selection, painting black will remove from the selection. If you make a mistake you can use undo, or paint with black to correct (you can swap the foreground and background colours by clicking the arrow by the colour selector)

[<img src="http://farm2.static.flickr.com/1167/1392373178_abf94b0176.jpg" alt="snapshot4" border="0" height="472" width="500" />](http://www.flickr.com/photos/antonpiatek/1392373178/){.tt-flickr}

Move to a smaller brush to fine tune the selection.

[<img src="http://farm2.static.flickr.com/1041/1391478389_68752078b6.jpg" alt="snapshot5" border="0" height="500" width="375" />](http://www.flickr.com/photos/antonpiatek/1391478389/){.tt-flickr}

When your selection is good enough, turn off the quickmask again by clicking the little red square in the bottom left. At some point we need to make a copy of the layer, so we can do that now by right clicking the layer in the layers dialog box, and selecting &#8220;Dupicate Layer&#8221;. When you have 2 layers make sure you select the top one before continuing (most actions in the gimp only affect the currently selected layer. Don&#8217;t worry, your selection in the image does not depend on a layer, so will not be lost. Of course, you could have done this before starting the editing too).

[<img src="http://farm2.static.flickr.com/1198/1391476079_9554a37dc3.jpg" alt="newLayer" border="0" height="500" width="255" />](http://www.flickr.com/photos/antonpiatek/1391476079/){.tt-flickr}

Next we will feather the selection a little, this makes the edges of the selection slightly transparent, which makes the effect look a little better. Either right click on the image to get a menu or use the menu on the top of the image window: Select->Feather.

Next we want to make a layer mask on our top layer. Right click on the layer in the layer menu and select &#8220;Add Layer Mask&#8221;, then select &#8220;Selection&#8221; when asked what to initialise the mask to. A layer mask restricts what is visible of the layer, so we are going to make only our selection visible.

[<img src="http://farm2.static.flickr.com/1394/1392377150_4f62798b3b.jpg" alt="snapshot6" border="0" height="339" width="309" />](http://www.flickr.com/photos/antonpiatek/1392377150/){.tt-flickr}

By clicking the &#8220;eye&#8221; icon on the bottom layer, you can hide the layer from showing, which will allow you to see your new masked layer of the flower (don&#8217;t forget to turn it back on though).

[<img src="http://farm2.static.flickr.com/1099/1392371660_c8bd142b87.jpg" alt="snapshot7" border="0" height="451" width="500" />](http://www.flickr.com/photos/antonpiatek/1392371660/){.tt-flickr}

Next we need to make the background greyscale. First make sure you don&#8217;t still have a selection by pressing CTRL+SHIFT+A or Select->None from the menu. Next select your background layer in the Layers dialog.

[<img src="http://farm2.static.flickr.com/1437/1391479145_aa1c7fcf0a.jpg" alt="selectLayer" border="0" height="463" width="261" />](http://www.flickr.com/photos/antonpiatek/1391479145/){.tt-flickr}

There are several ways to make an image greyscale, the simplest is to desaturate the layer (this will make the current layer greyscale). From the right click menu, or menu bar at the top of the image, select Layer->Colours->Desaturate

[<img src="http://farm2.static.flickr.com/1337/1392376986_4b8bb06e06.jpg" alt="snapshot8" border="0" height="351" width="500" />](http://www.flickr.com/photos/antonpiatek/1392376986/){.tt-flickr}

And voila, your background is grey, your foreground is in colour.

[<img src="http://farm2.static.flickr.com/1346/1391476833_28c4de9bb8.jpg" alt="snapshot9" border="0" height="454" width="500" />](http://www.flickr.com/photos/antonpiatek/1391476833/){.tt-flickr}

There are of course other ways to achieve the same effect, I have only shown one.

Hopefully you found this useful and will consider The GIMP for your photo editing. Let me know if there are any other common tasks that you would like to know how to do in The GIMP and I will probably write up about them.