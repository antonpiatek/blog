---
id: 765
date: 2010-12-13T17:13:30+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/12/13/764-revision/
permalink: /2010/12/13/764-revision/
---
From https://github.com/arduino/Arduino/tree/master/hardware/arduino/firmwares/arduino-usbserial/ download your hex file for your board, i.e. either _Arduino-usbserial-mega.hex_ or _Arduino-usbserial-uno.hex_. As it is github, click on the file in the list then right click on &#8220;_raw_&#8221; and click &#8220;_Save as_&#8220;.

The md5sum of the Arduino Uno file from the 4th December is 8e01ee236e70bbea43f7eb4e11c9688a

You will need the dfu programmer tools, which are conveniently in Lucid/Universe, so just run 

> <pre>sudo aptitude install dfu-programmer</pre>

You need to do a hardware-reset to put the chip into the correct DFU programming mode, which is simply best explained with the picture at http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1285962838/10#10 (you will need to register on arduino site to login)

The Uno&#8217;s use a AT90USB82 serial-usb chip, so we then reflash the firmware with the following commands

References:  
http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1286088093/34#34 First person to find fix  
http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1286088093/38#38 Author of Arduino USB stack talks about