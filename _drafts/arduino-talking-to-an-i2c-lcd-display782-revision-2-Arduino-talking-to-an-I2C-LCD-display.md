---
id: 784
title: Arduino talking to an I2C LCD display
date: 2011-01-17T19:18:47+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/01/17/782-revision-2/
permalink: /2011/01/17/782-revision-2/
---
<code lang="C">#include&lt;br />
#include&lt;br />
#define LCD (0x2E) //0x5C lcd address converted from 8bit to 7bit</code>

<code lang="C">void setup() {&lt;br />
Serial.begin(9600);&lt;br />
Wire.begin();&lt;/p>
&lt;p>// Initialise display with clear command&lt;br />
Wire.beginTransmission(LCD);&lt;br />
Wire.send(254);&lt;br />
Wire.send(88);&lt;br />
Wire.endTransmission();&lt;br />
}&lt;/p>
&lt;p></code>

<code lang="C">void loop() {&lt;br />
if (Serial.available() &gt; 0) {&lt;br />
char c = Serial.read();&lt;br />
Serial.write(c);&lt;br />
Wire.beginTransmission(LCD);&lt;br />
Wire.send(c);&lt;br />
Wire.endTransmission();&lt;br />
}&lt;br />
} </code>