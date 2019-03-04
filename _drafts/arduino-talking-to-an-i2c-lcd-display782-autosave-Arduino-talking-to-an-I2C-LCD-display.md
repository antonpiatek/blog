---
id: 793
title: Arduino talking to an I2C LCD display
date: 2011-01-17T19:36:56+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/01/17/782-autosave/
permalink: /2011/01/17/782-autosave/
---
I had a spare [Matrix Orbital](http://www.matrixorbital.com/) 20&#215;4 character LCD floating about so I decided to try and connect it up to my Arduino. The display is a [LK204-25](http://www.matrixorbital.com/Intelligent-Display-Character-LCDs/c39_3/p25/LK204-25/product_info.html), which is a brilliant little serial display, with support for a 25 button keypad and six outputs that can be used to control power to something else.

Being a serial display, I could just write to it from my Arduino using the serial interface, but that would mean that I lose the ability to communicate with my Arduino from my computer over serial. Fortunately the display also supports I2C as an interface (some similar, but newer, models also contain a 1-wire interface and a temperature sensor built in).

It turns out that getting the display to work with my Aruino Uni, using I2C is rather trivial. The display needs power, that is easy enough, and then there are just two wires to connect from the Arduino &#8211; Analog pin 4 for is SDA, analog pin 5 is SCL. Connect those two up to the display (the display docs show which pins SDA and SCL are) and you are ready to write the code to control it.

It turns out that I2C has fantastic support in Arduino, Wire.h contains all you need. The code below will read a character from the serial connection from your computer and write it to the display. Easy, eh?

<pre lang="C">#include &lt;wire.h>
#include &lt;stdlib .h>
// default MatrixOrbital lcd address (0x5C) converted from 8bit to 7bit
#define LCD (0x2E) 

void setup() {
  Serial.begin(9600);
  Wire.begin();

  // Initialise display with clear command
  Wire.beginTransmission(LCD);
  Wire.send(254);
  Wire.send(88);
  Wire.endTransmission();
}

void loop() {
  if (Serial.available() > 0) {
    char c = Serial.read();
    Serial.write(c);
    Wire.beginTransmission(LCD);
    Wire.send(c);
    Wire.endTransmission();
  }
}&lt;/stdlib></pre>