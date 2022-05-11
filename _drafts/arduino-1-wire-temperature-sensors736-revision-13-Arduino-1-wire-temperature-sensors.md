---
id: 756
title: Arduino 1-wire temperature sensors
date: 2010-12-12T21:53:09+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/12/12/736-revision-13/
permalink: /2010/12/12/736-revision-13/
---
So you have played a bit with your [Arduino](http://www.arduino.cc/), and have heard about other people using it to monitor the temperature, but weren&#8217;t sure how they did it &#8211; Here is how I did.

Maxim make a very simple [1-wire](http://en.wikipedia.org/wiki/1-Wire) temperature sensor &#8211; the [DS18B20](http://www.maxim-ic.com/datasheet/index.mvp/id/2812) (the replacement to the DS1820). This 3 pin sensor looks just like a transistor, and can work with only two wires, combined data+power and ground. You can put several on the same wire and address them all separately.

The DS18B20 is [less that £4 from RS](http://uk.rs-online.com/web/search/searchBrowseAction.html?method=getProduct&R=5402805P), so not exactly expensive.

Wiring up the 1-wire sensors is fairly simple:

You can power them with either dedicated power wires (exercise for the reader), or use their &#8220;parasitic mode&#8221; where they use power from the same wire as data. To wire them this way you need to wire pins 1 and 3 (ground and Vcc) from the DS18B20 both to ground. Pin 2 goes to your Arduino (any digital I/O pin), and also 5v DC through a 4.7kΩ resistor (if you have a lot of 1-wire devices, there are reports that you may need to reduce this down to 2kΩ).  
If you have long wires you may need to start looking at dedicated power, but certainly for testing parasitic power will be fine.

Stringing multiple 1-wire sensors together is as simple as connecting all the pins up in parallel.

<span style="font-size: 13.3333px;"><a href="http://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20.png"><img class="alignnone size-full wp-image-752" title="Wiring DS18B20" src="http://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20.png" alt="Wiring DS18B20" width="500" height="250" srcset="https://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20.png 500w, https://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20-300x150.png 300w, https://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20-150x75.png 150w, https://www.strangeparty.com/wordpress/uploads/2010/12/DS18B20-400x200.png 400w" sizes="(max-width: 500px) 100vw, 500px" /></a></span>

To actually query the devices on your Arduino, you will need the [1-wire and Dallas temperature sensor libraries](http://milesburton.com/index.php?title=Dallas_Temperature_Control_Library#Latest) (unzip them to your Arduino editors&#8217; libraries/ folder).

[Examples of using the sensors](http://milesburton.com/index.php?title=Dallas_Temperature_Control_Library#Example) are [all over the place](http://arduinotronics.blogspot.com/) (also [examples of querying the ID&#8217;s of the devices](http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html)), or you can try mine below which prints to the serial connection the hex ID&#8217;s for each 1-wire device found, and the temperature of each every 10 sec.

 ``

    // OneWire and DallasTemperature libraries from
    //   http://milesburton.com/index.php?title=Dallas_Temperature_Control_Library
    // Code based on examples from above and at
    //   http://www.hacktronics.com/Tutorials/arduino-1-wire-address-finder.html
    // See also http://www.arduino.cc/playground/Learning/OneWire
    
    #include <onewire.h>
    #include <dallastemperature.h>
    
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
      for(int i=0; i < numberOfSensors; i++) {
       Serial.print("Temperature for Device ");
       Serial.print( i );
       Serial.print(" is: ");
       // Why "byIndex"? You can have more than one IC on the same bus. 0 refers to the first IC on the wire
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
        for( i = 0; i < 8; i++) {
          Serial.print("0x");
          if (addr[i] < 16) {
            Serial.print('0');
          }
          Serial.print(addr[i], HEX);
          if (i < 7) {
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
    }

 ``

I get the following output on the serial connection

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

There you have it &#8211; A very quick Arduino temperature sensor, using pretty cheap 1-wire devices. The only problem you have now is how to get the wires everywhere you might want to read the temperature of.