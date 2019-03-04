---
id: 745
title: Arduino 1-wire temperature sensors
date: 2010-12-12T20:12:23+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/12/12/736-revision-3/
permalink: /2010/12/12/736-revision-3/
---
The Code:  
`<br />
// OneWire and DallasTemperature libraries from http://milesburton.com/index.php?title=Dallas_Temperature_Control_Library<br />
// Code based on examples from above and at http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html<br />
// See also http://www.arduino.cc/playground/Learning/OneWire`

`#include<br />
#include</p>
<p>// Data wire is plugged into pin 2 on the Arduino (can be any digital I/O pin)<br />
#define ONE_WIRE_BUS 2</p>
<p>// Setup a oneWire instance to communicate with any OneWire devices (not just Maxim/Dallas temperature ICs)<br />
OneWire oneWire(ONE_WIRE_BUS);</p>
<p>// Pass our oneWire reference to Dallas Temperature.<br />
DallasTemperature sensors(&oneWire);</p>
<p>int numberOfSensors;</p>
<p>void setup(void)<br />
{<br />
// start serial port<br />
Serial.begin(9600);<br />
Serial.println("1-Wire DS18B20 example code");</p>
<p>// Start up the library<br />
sensors.begin();</p>
<p>delay(5000);  //important on linux as serial port can lock up otherwise<br />
numberOfSensors = discoverOneWireDevices();<br />
Serial.println();<br />
}</p>
<p>void loop(void)<br />
{<br />
printTemperaturesToSerial();<br />
delay(10000); //important on linux as serial port can lock up otherwise<br />
}</p>
<p>void printTemperaturesToSerial(void) {<br />
// call sensors.requestTemperatures() to issue a global temperature<br />
// request to all devices on the bus<br />
Serial.print("Requesting temperatures...");<br />
sensors.requestTemperatures(); // Send the command to get temperatures<br />
Serial.println("DONE");</p>
<p>// Read each of our sensors and print the value<br />
for(int i=0; i < numberOfSensors; i++) {<br />
Serial.print("Temperature for Device ");<br />
Serial.print( i );<br />
Serial.print(" is: ");<br />
// Why "byIndex"? You can have more than one IC on the same bus. 0 refers to the first IC on the wire<br />
Serial.println( sensors.getTempCByIndex(i) );<br />
}</p>
<p>Serial.println();<br />
}</p>
<p>// From http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html<br />
int discoverOneWireDevices(void) {<br />
byte i;<br />
byte present = 0;<br />
byte data[12];<br />
byte addr[8];<br />
int count = 0;</p>
<p>`

 `Serial.println("Looking for 1-Wire devices...");<br />
while(oneWire.search(addr)) {<br />
Serial.print("Found \'1-Wire\' device with address: ");<br />
for( i = 0; i < 8; i++) {<br />
Serial.print("0x");<br />
if (addr[i] < 16) {<br />
Serial.print('0');<br />
}<br />
Serial.print(addr[i], HEX);<br />
if (i < 7) {<br />
Serial.print(", ");<br />
}<br />
}<br />
if ( OneWire::crc8( addr, 7) != addr[7]) {<br />
Serial.println("CRC is not valid!");<br />
return 0;<br />
}<br />
Serial.println();<br />
count++;<br />
}<br />
Serial.println("That's it.");<br />
oneWire.reset_search();<br />
return count;<br />
}<br />
`  
Output:

<pre>1-Wire DS18B20 example code
Looking for 1-Wire devices...
Found '1-Wire' device with address: 0x28, 0xCE, 0x85, 0xBB, 0x02, 0x00, 0x00, 0xC1
Found '1-Wire' device with address: 0x28, 0xEF, 0x7F, 0xBB, 0x02, 0x00, 0x00, 0x5B
That's it.

Requesting temperatures...DONE
Temperature for Device 0 is: 21.31
Temperature for Device 1 is: 21.37

Requesting temperatures...DONE
Temperature for Device 0 is: 21.37
Temperature for Device 1 is: 21.37
...</pre>