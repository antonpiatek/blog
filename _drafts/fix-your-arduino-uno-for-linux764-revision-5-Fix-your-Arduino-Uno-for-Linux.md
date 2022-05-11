---
id: 769
title: Fix your Arduino Uno for Linux
date: 2010-12-13T17:24:57+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/12/13/764-revision-5/
permalink: /2010/12/13/764-revision-5/
---
Are you using an Arduino Uno on Linux? If so, you may have noticed that writing to the serial port in a loop can cause the Arduino Editor/Programmer software to appear to lock up, or even Linux having trouble using the serial port for your Uno.

It turns out there was a bug in the USB->Serial firmware on the chip which caused this [1], and it is quite easy to update your arduino to fix it. According to the author of the USB->Serial firmware, it is not possible to break your Arduino permenantly doing this [1], but I can&#8217;t promise anything (though it worked fine for me and others)

From <https://github.com/arduino/Arduino/tree/master/hardware/arduino/firmwares/arduino-usbserial/> download your hex file for your board, i.e. either _Arduino-usbserial-mega.hex_ or _Arduino-usbserial-uno.hex_. As it is github, click on the file in the list then right click on &#8220;_raw_&#8221; and click &#8220;_Save as_&#8220;.

The md5sum of the Arduino Uno file from the 4th December is 8e01ee236e70bbea43f7eb4e11c9688a

You will need the dfu programmer tools, which are conveniently in Lucid/Universe, so just run

> <pre>sudo aptitude install dfu-programmer</pre>

You need to do a hardware-reset to put the chip into the correct DFU programming mode, which is simply best explained with the picture at <http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1285962838/10#10> (you will need to register on arduino site to login)

The Uno&#8217;s use a AT90USB82 serial-usb chip, so we then reflash the firmware with the following commands

> <pre>sudo dfu-programmer at90usb82 erase
sudo dfu-programmer at90usb82 flash --debug 1 Arduino-usbserial-uno.hex
sudo dfu-programmer at90usb82 reset</pre>

Finally, just disconnect the USB lead and reconnect to reset the device back to normal mode.

Done &#8211; You no longer have to worry about writing to your serial port on your Arduino.

> _References:  
> [1] [http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1286088093/38#38 &#8211; Author of Arduino USB stack talks about](http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1286088093/38#38)  
> [2] [http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1286088093/34#34 &#8211; First person to find fix and author of instructions that these are heavily based on](http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1286088093/34#34)_