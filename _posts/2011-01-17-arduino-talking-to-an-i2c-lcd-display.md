---
id: 782
title: Arduino talking to an I2C LCD display
date: 2011-01-17T19:33:05+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=782
permalink: /2011/01/17/arduino-talking-to-an-i2c-lcd-display/
aktt_notify_twitter:
  - 'yes'
aktt_tweeted:
  - "1"
openid_comments:
  - 'a:1:{i:0;s:5:"34965";}'
wp-syntax-cache-content:
  - |
    a:1:{i:1;s:4379:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="c" style="font-family:monospace;"><span style="color: #666666; font-style: italic;">// Note the space after the . in the imports below - This blog seems to object to not having it there</span>
    <span style="color: #339933;">#include &lt; wire.h&gt;</span>
    <span style="color: #666666; font-style: italic;">// default MatrixOrbital lcd address (0x5C) converted from 8bit to 7bit</span>
    <span style="color: #339933;">#define LCD (0x2E) </span>
    &nbsp;
    <span style="color: #993333;">void</span> setup<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    Serial.<span style="color: #202020;">begin</span><span style="color: #009900;">&#40;</span><span style="color: #0000dd;">9600</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Wire.<span style="color: #202020;">begin</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">// Initialise display with clear command</span>
    Wire.<span style="color: #202020;">beginTransmission</span><span style="color: #009900;">&#40;</span>LCD<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Wire.<span style="color: #202020;">send</span><span style="color: #009900;">&#40;</span><span style="color: #0000dd;">254</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Wire.<span style="color: #202020;">send</span><span style="color: #009900;">&#40;</span><span style="color: #0000dd;">88</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Wire.<span style="color: #202020;">endTransmission</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #993333;">void</span> loop<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #b1b100;">if</span> <span style="color: #009900;">&#40;</span>Serial.<span style="color: #202020;">available</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span> <span style="color: #339933;">&gt;</span> <span style="color: #0000dd;">0</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #993333;">char</span> c <span style="color: #339933;">=</span> Serial.<span style="color: #202020;">read</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Serial.<span style="color: #202020;">write</span><span style="color: #009900;">&#40;</span>c<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Wire.<span style="color: #202020;">beginTransmission</span><span style="color: #009900;">&#40;</span>LCD<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Wire.<span style="color: #202020;">send</span><span style="color: #009900;">&#40;</span>c<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Wire.<span style="color: #202020;">endTransmission</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">// Note the space after the . in the imports below - This blog seems to object to not having it there
    #include &lt; wire.h&gt;
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
    if (Serial.available() &gt; 0) {
    char c = Serial.read();
    Serial.write(c);
    Wire.beginTransmission(LCD);
    Wire.send(c);
    Wire.endTransmission();
    }
    }</p></div>
    ";}
categories:
  - Arduino
  - Programming
  - Technology
tags:
  - arduino
  - code
  - display
  - i2c
  - lcd
  - matrixorbital
  - Programming
  - serial
---
I had a spare [Matrix Orbital](http://www.matrixorbital.com/) 20&#215;4 character LCD floating about so I decided to try and connect it up to my Arduino. The display is a [LK204-25](http://www.matrixorbital.com/Intelligent-Display-Character-LCDs/c39_3/p25/LK204-25/product_info.html), which is a brilliant little serial display, with support for a 25 button keypad and six outputs that can be used to control power to something else.

Being a serial display, I could just write to it from my Arduino using the serial interface, but that would mean that I lose the ability to communicate with my Arduino from my computer over serial. Fortunately the display also supports I2C as an interface (some similar, but newer, models also contain a 1-wire interface and a temperature sensor built in).

It turns out that getting the display to work with my Aruino Uni, using I2C is rather trivial. The display needs power, that is easy enough, and then there are just two wires to connect from the Arduino &#8211; Analog pin 4 for is SDA, analog pin 5 is SCL. Connect those two up to the display (the display docs show which pins SDA and SCL are) and you are ready to write the code to control it.

It turns out that I2C has fantastic support in Arduino, Wire.h contains all you need. The code below will read a character from the serial connection from your computer and write it to the display. Easy, eh?

<pre lang="C">// Note the space after the . in the imports below - This blog seems to object to not having it there
#include &lt; wire.h>
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
}</pre>