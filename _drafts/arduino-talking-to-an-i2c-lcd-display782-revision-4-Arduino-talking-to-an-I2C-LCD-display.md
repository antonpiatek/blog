---
id: 786
title: Arduino talking to an I2C LCD display
date: 2011-01-17T19:19:39+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/01/17/782-revision-4/
permalink: /2011/01/17/782-revision-4/
---
<pre lang="C">#include
#include
#define LCD (0x2E) //0x5C lcd address converted from 8bit to 7bit

<code lang="C">void setup() {
Serial.begin(9600);
Wire.begin();</code>

<code lang="C">// Initialise display with clear command
Wire.beginTransmission(LCD);
Wire.send(254);
Wire.send(88);
Wire.endTransmission();
}

</code>

<code lang="C">void loop() {
if (Serial.available() &gt; 0) {
char c = Serial.read();
Serial.write(c);
Wire.beginTransmission(LCD);
Wire.send(c);
Wire.endTransmission();
}
} </code></pre>