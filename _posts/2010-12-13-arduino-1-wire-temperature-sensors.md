---
id: 736
title: Arduino 1-wire temperature sensors
date: 2010-12-13T08:42:01+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=736
permalink: /2010/12/13/arduino-1-wire-temperature-sensors/
aktt_notify_twitter:
  - 'yes'
aktt_tweeted:
  - "1"
openid_comments:
  - 'a:1:{i:0;s:5:"28189";}'
wp-syntax-cache-content:
  - |
    a:1:{i:1;s:16555:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="c" style="font-family:monospace;"><span style="color: #666666; font-style: italic;">// OneWire and DallasTemperature libraries from</span>
    <span style="color: #666666; font-style: italic;">//   http://milesburton.com/index.php?title=Dallas_Temperature_Control_Library</span>
    <span style="color: #666666; font-style: italic;">// Code based on examples from above and at</span>
    <span style="color: #666666; font-style: italic;">//   http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html</span>
    <span style="color: #666666; font-style: italic;">// See also http://www.arduino.cc/playground/Learning/OneWire</span>
    &nbsp;
    <span style="color: #339933;">#include &lt;onewire .h&gt;</span>
    <span style="color: #339933;">#include &lt;dallastemperature .h&gt;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">// Data wire is plugged into pin 2 on the Arduino (can be any digital I/O pin)</span>
    <span style="color: #339933;">#define ONE_WIRE_BUS 2</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">// Setup a oneWire instance to communicate with any OneWire devices</span>
    <span style="color: #666666; font-style: italic;">// (not just Maxim/Dallas temperature ICs)</span>
    OneWire oneWire<span style="color: #009900;">&#40;</span>ONE_WIRE_BUS<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">// Pass our oneWire reference to Dallas Temperature.</span>
    DallasTemperature sensors<span style="color: #009900;">&#40;</span><span style="color: #339933;">&amp;</span>amp<span style="color: #339933;">;</span>oneWire<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #993333;">int</span> numberOfSensors<span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #993333;">void</span> setup<span style="color: #009900;">&#40;</span><span style="color: #993333;">void</span><span style="color: #009900;">&#41;</span>
    <span style="color: #009900;">&#123;</span>
    <span style="color: #666666; font-style: italic;">// start serial port</span>
    Serial.<span style="color: #202020;">begin</span><span style="color: #009900;">&#40;</span><span style="color: #0000dd;">9600</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Serial.<span style="color: #202020;">println</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;1-Wire DS18B20 example code&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">// Start up the library</span>
    sensors.<span style="color: #202020;">begin</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    &nbsp;
    delay<span style="color: #009900;">&#40;</span><span style="color: #0000dd;">5000</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>  <span style="color: #666666; font-style: italic;">//important on linux as serial port can lock up otherwise</span>
    numberOfSensors <span style="color: #339933;">=</span> discoverOneWireDevices<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Serial.<span style="color: #202020;">println</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #993333;">void</span> loop<span style="color: #009900;">&#40;</span><span style="color: #993333;">void</span><span style="color: #009900;">&#41;</span>
    <span style="color: #009900;">&#123;</span>
    printTemperaturesToSerial<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    delay<span style="color: #009900;">&#40;</span><span style="color: #0000dd;">10000</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span> <span style="color: #666666; font-style: italic;">//wait 10 sec</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #993333;">void</span> printTemperaturesToSerial<span style="color: #009900;">&#40;</span><span style="color: #993333;">void</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #666666; font-style: italic;">// call sensors.requestTemperatures() to issue a global temperature</span>
    <span style="color: #666666; font-style: italic;">// request to all devices on the bus</span>
    Serial.<span style="color: #202020;">print</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;Requesting temperatures...&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    sensors.<span style="color: #202020;">requestTemperatures</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span> <span style="color: #666666; font-style: italic;">// Send the command to get temperatures</span>
    Serial.<span style="color: #202020;">println</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;DONE&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">// Read each of our sensors and print the value</span>
    <span style="color: #b1b100;">for</span><span style="color: #009900;">&#40;</span><span style="color: #993333;">int</span> i<span style="color: #339933;">=</span><span style="color: #0000dd;">0</span><span style="color: #339933;">;</span> i <span style="color: #339933;">&lt;</span> numberOfSensors<span style="color: #339933;">;</span> i<span style="color: #339933;">++</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    Serial.<span style="color: #202020;">print</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;Temperature for Device &quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Serial.<span style="color: #202020;">print</span><span style="color: #009900;">&#40;</span> i <span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    Serial.<span style="color: #202020;">print</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot; is: &quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #666666; font-style: italic;">// Why &quot;byIndex&quot;? You can have more than one IC on the same bus. </span>
    <span style="color: #666666; font-style: italic;">// 0 refers to the first IC on the wire</span>
    Serial.<span style="color: #202020;">println</span><span style="color: #009900;">&#40;</span> sensors.<span style="color: #202020;">getTempCByIndex</span><span style="color: #009900;">&#40;</span>i<span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    Serial.<span style="color: #202020;">println</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #666666; font-style: italic;">// Based on http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html</span>
    <span style="color: #993333;">int</span> discoverOneWireDevices<span style="color: #009900;">&#40;</span><span style="color: #993333;">void</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    byte i<span style="color: #339933;">;</span>
    byte present <span style="color: #339933;">=</span> <span style="color: #0000dd;">0</span><span style="color: #339933;">;</span>
    byte data<span style="color: #009900;">&#91;</span><span style="color: #0000dd;">12</span><span style="color: #009900;">&#93;</span><span style="color: #339933;">;</span>
    byte addr<span style="color: #009900;">&#91;</span><span style="color: #0000dd;">8</span><span style="color: #009900;">&#93;</span><span style="color: #339933;">;</span>
    <span style="color: #993333;">int</span> count <span style="color: #339933;">=</span> <span style="color: #0000dd;">0</span><span style="color: #339933;">;</span>
    &nbsp;
    Serial.<span style="color: #202020;">println</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;Looking for 1-Wire devices...&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #b1b100;">while</span><span style="color: #009900;">&#40;</span>oneWire.<span style="color: #202020;">search</span><span style="color: #009900;">&#40;</span>addr<span style="color: #009900;">&#41;</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    Serial.<span style="color: #202020;">print</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;Found <span style="color: #000099; font-weight: bold;">\'</span>1-Wire<span style="color: #000099; font-weight: bold;">\'</span> device with address: &quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #b1b100;">for</span><span style="color: #009900;">&#40;</span> i <span style="color: #339933;">=</span> <span style="color: #0000dd;">0</span><span style="color: #339933;">;</span> i <span style="color: #339933;">&lt;</span> <span style="color: #0000dd;">8</span><span style="color: #339933;">;</span> i<span style="color: #339933;">++</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    Serial.<span style="color: #202020;">print</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;0x&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #b1b100;">if</span> <span style="color: #009900;">&#40;</span>addr<span style="color: #009900;">&#91;</span>i<span style="color: #009900;">&#93;</span> <span style="color: #339933;">&lt;</span> <span style="color: #0000dd;">16</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    Serial.<span style="color: #202020;">print</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">'0'</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    Serial.<span style="color: #202020;">print</span><span style="color: #009900;">&#40;</span>addr<span style="color: #009900;">&#91;</span>i<span style="color: #009900;">&#93;</span><span style="color: #339933;">,</span> HEX<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #b1b100;">if</span> <span style="color: #009900;">&#40;</span>i <span style="color: #339933;">&lt;</span> <span style="color: #0000dd;">7</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    Serial.<span style="color: #202020;">print</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;, &quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #b1b100;">if</span> <span style="color: #009900;">&#40;</span> OneWire<span style="color: #339933;">::</span><span style="color: #202020;">crc8</span><span style="color: #009900;">&#40;</span> addr<span style="color: #339933;">,</span> <span style="color: #0000dd;">7</span><span style="color: #009900;">&#41;</span> <span style="color: #339933;">!=</span> addr<span style="color: #009900;">&#91;</span><span style="color: #0000dd;">7</span><span style="color: #009900;">&#93;</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    Serial.<span style="color: #202020;">println</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;CRC is not valid!&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #b1b100;">return</span> <span style="color: #0000dd;">0</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    Serial.<span style="color: #202020;">println</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    count<span style="color: #339933;">++;</span>
    <span style="color: #009900;">&#125;</span>
    Serial.<span style="color: #202020;">println</span><span style="color: #009900;">&#40;</span><span style="color: #ff0000;">&quot;That's it.&quot;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    oneWire.<span style="color: #202020;">reset_search</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #b1b100;">return</span> count<span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span></pre></td></tr></table><p class="theCode" style="display:none;">// OneWire and DallasTemperature libraries from
    //   http://milesburton.com/index.php?title=Dallas_Temperature_Control_Library
    // Code based on examples from above and at
    //   http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html
    // See also http://www.arduino.cc/playground/Learning/OneWire
    
    #include &lt;onewire .h&gt;
    #include &lt;dallastemperature .h&gt;
    
    // Data wire is plugged into pin 2 on the Arduino (can be any digital I/O pin)
    #define ONE_WIRE_BUS 2
    
    // Setup a oneWire instance to communicate with any OneWire devices
    // (not just Maxim/Dallas temperature ICs)
    OneWire oneWire(ONE_WIRE_BUS);
    
    // Pass our oneWire reference to Dallas Temperature.
    DallasTemperature sensors(&amp;amp;oneWire);
    
    int numberOfSensors;
    
    void setup(void)
    {
    // start serial port
    Serial.begin(9600);
    Serial.println(&quot;1-Wire DS18B20 example code&quot;);
    
    // Start up the library
    sensors.begin();
    
    delay(5000);  //important on linux as serial port can lock up otherwise
    numberOfSensors = discoverOneWireDevices();
    Serial.println();
    }
    
    void loop(void)
    {
    printTemperaturesToSerial();
    delay(10000); //wait 10 sec
    }
    
    void printTemperaturesToSerial(void) {
    // call sensors.requestTemperatures() to issue a global temperature
    // request to all devices on the bus
    Serial.print(&quot;Requesting temperatures...&quot;);
    sensors.requestTemperatures(); // Send the command to get temperatures
    Serial.println(&quot;DONE&quot;);
    
    // Read each of our sensors and print the value
    for(int i=0; i &lt; numberOfSensors; i++) {
    Serial.print(&quot;Temperature for Device &quot;);
    Serial.print( i );
    Serial.print(&quot; is: &quot;);
    // Why &quot;byIndex&quot;? You can have more than one IC on the same bus.
    // 0 refers to the first IC on the wire
    Serial.println( sensors.getTempCByIndex(i) );
    }
    
    Serial.println();
    }
    
    // Based on http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html
    int discoverOneWireDevices(void) {
    byte i;
    byte present = 0;
    byte data[12];
    byte addr[8];
    int count = 0;
    
    Serial.println(&quot;Looking for 1-Wire devices...&quot;);
    while(oneWire.search(addr)) {
    Serial.print(&quot;Found \'1-Wire\' device with address: &quot;);
    for( i = 0; i &lt; 8; i++) {
    Serial.print(&quot;0x&quot;);
    if (addr[i] &lt; 16) {
    Serial.print('0');
    }
    Serial.print(addr[i], HEX);
    if (i &lt; 7) {
    Serial.print(&quot;, &quot;);
    }
    }
    if ( OneWire::crc8( addr, 7) != addr[7]) {
    Serial.println(&quot;CRC is not valid!&quot;);
    return 0;
    }
    Serial.println();
    count++;
    }
    Serial.println(&quot;That's it.&quot;);
    oneWire.reset_search();
    return count;
    }</p></div>
    ";}
categories:
  - Arduino
  - Programming
tags:
  - 1-wire
  - arduino
  - c
  - electronics
  - Programming
---
So you have played a bit with your [Arduino](http://www.arduino.cc/), and have heard about other people using it to monitor the temperature, but weren&#8217;t sure how they did it &#8211; Here is how I did.

Maxim make a very simple [1-wire](http://en.wikipedia.org/wiki/1-Wire) temperature sensor &#8211; the [DS18B20](http://www.maxim-ic.com/datasheet/index.mvp/id/2812) (the replacement to the DS1820). This 3 pin sensor looks just like a transistor, and can work with only two wires, combined data+power and ground. You can put several on the same wire and address them all separately.

The DS18B20 is [less that £4 from RS](http://uk.rs-online.com/web/search/searchBrowseAction.html?method=getProduct&R=5402805P), so not exactly expensive.

Wiring up the 1-wire sensors is fairly simple:

You can power them with either dedicated power wires (exercise for the reader), or use their &#8220;parasitic mode&#8221; where they use power from the same wire as data. To wire them this way you need to wire pins 1 and 3 (ground and Vcc) from the DS18B20 both to ground. Pin 2 goes to your Arduino (any digital I/O pin), and also 5v DC through a 4.7kΩ resistor (if you have a lot of 1-wire devices, there are reports that you may need to reduce this down to 2kΩ).  
If you have long wires you may need to start looking at dedicated power, but certainly for testing parasitic power will be fine.

Stringing multiple 1-wire sensors together is as simple as connecting all the pins up in parallel.

[<img class="alignnone size-full wp-image-752" title="Wiring DS18B20" src="http://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20.png" alt="Wiring DS18B20" width="500" height="250" srcset="https://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20.png 500w, https://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20-300x150.png 300w, https://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20-150x75.png 150w, https://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20-400x200.png 400w" sizes="(max-width: 500px) 100vw, 500px" />](http://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20.png)

To actually query the devices on your Arduino, you will need the [1-wire and Dallas temperature sensor libraries](http://milesburton.com/index.php?title=Dallas_Temperature_Control_Library#Latest) (unzip them to your Arduino editors&#8217; libraries/ folder).

[Examples](http://www.arduino.cc/playground/Learning/OneWire) of [using the sensors](http://milesburton.com/index.php?title=Dallas_Temperature_Control_Library#Example) are [all over the place](http://arduinotronics.blogspot.com/) (also [examples of querying the ID&#8217;s of the devices](http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html)), or you can try mine below which prints to the serial connection the hex ID&#8217;s for each 1-wire device found, and the temperature of each every 10 sec.

<pre lang="C">// OneWire and DallasTemperature libraries from
//   http://milesburton.com/index.php?title=Dallas_Temperature_Control_Library
// Code based on examples from above and at
//   http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html
// See also http://www.arduino.cc/playground/Learning/OneWire

#include &lt;onewire .h>
#include &lt;dallastemperature .h>

// Data wire is plugged into pin 2 on the Arduino (can be any digital I/O pin)
#define ONE_WIRE_BUS 2

// Setup a oneWire instance to communicate with any OneWire devices
// (not just Maxim/Dallas temperature ICs)
OneWire oneWire(ONE_WIRE_BUS);

// Pass our oneWire reference to Dallas Temperature.
DallasTemperature sensors(&oneWire);

int numberOfSensors;

void setup(void)
{
  // start serial port
  Serial.begin(9600);
  Serial.println("1-Wire DS18B20 example code");

  // Start up the library
  sensors.begin();

  delay(5000);  //important on linux as serial port can lock up otherwise
  numberOfSensors = discoverOneWireDevices();
  Serial.println();
}

void loop(void)
{
  printTemperaturesToSerial();
  delay(10000); //wait 10 sec
}

void printTemperaturesToSerial(void) {
  // call sensors.requestTemperatures() to issue a global temperature
  // request to all devices on the bus
  Serial.print("Requesting temperatures...");
  sensors.requestTemperatures(); // Send the command to get temperatures
  Serial.println("DONE");

  // Read each of our sensors and print the value
  for(int i=0; i &lt; numberOfSensors; i++) {
   Serial.print("Temperature for Device ");
   Serial.print( i );
   Serial.print(" is: ");
   // Why "byIndex"? You can have more than one IC on the same bus. 
   // 0 refers to the first IC on the wire
   Serial.println( sensors.getTempCByIndex(i) );
  }

  Serial.println();
}

// Based on http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html
int discoverOneWireDevices(void) {
  byte i;
  byte present = 0;
  byte data[12];
  byte addr[8];
  int count = 0;

  Serial.println("Looking for 1-Wire devices...");
  while(oneWire.search(addr)) {
    Serial.print("Found \'1-Wire\' device with address: ");
    for( i = 0; i &lt; 8; i++) {
      Serial.print("0x");
      if (addr[i] &lt; 16) {
        Serial.print('0');
      }
      Serial.print(addr[i], HEX);
      if (i &lt; 7) {
        Serial.print(", ");
      }
    }
    if ( OneWire::crc8( addr, 7) != addr[7]) {
        Serial.println("CRC is not valid!");
        return 0;
    }
    Serial.println();
    count++;
  }
  Serial.println("That's it.");
  oneWire.reset_search();
  return count;
}</pre>

I get the following output on the serial connection

> <pre>1-Wire DS18B20 example code
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

There you have it - A very quick Arduino temperature sensor, using pretty cheap 1-wire devices. The only problem you have now is how to get the wires everywhere you might want to read the temperature of.</dallastemperature></onewire>