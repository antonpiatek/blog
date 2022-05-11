---
id: 330
title: PIC Microchip programming under debian
date: 2008-05-31T14:12:16+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=330
permalink: /2008/05/31/pic-microchip-programming-under-debian/
categories:
  - Debian
  - Linux
  - Technology
tags:
  - 16f690
  - Debian
  - Linux
  - microchip
  - pic
  - programmer
  - sdcc
---
A while ago I bought a [PICkit2 programmer](http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=1406&dDocName=en023805), including 16f690 PIC. I installed piklab and sdcc (in Debian repositories) and got it working pretty easily. I did play with the programmer that came with it (mplab, windows only), which upgraded my firmware. piklab cannot use the new firmware, so if you need to get an old firmware, then try the [old firmware downloads page  
](http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=1406&dDocName=en023073) 

There is quite a difference in programming between mplab and piklab. Although there is support for a large number of chips in piklab, they are not supported as well as mplab. The big problem is that in mplab most special bits (i.e. each bit for an output port, one per pin) have a defined name so you can set them on or off individually. Piklab on the other hand has support for only a few of these, so if you want to turn on a pin, you have to set a value on the whole port (byte). Saying that, I prefer the piklab editor as it seems to do a better job with syntax highlighting etc.

Below is some code examples to help you get started if you are finding the learning curve steep

<!--more-->

Some macros that may be useful to put in a header file are

<pre style="padding-left: 30px;">#define ZERO    0x00  // 0000 0000
#define BIT0    0x01  // 0000 0001
#define BIT1    0x02  // 0000 0010
#define BIT2    0x04  // 0000 0100
#define BIT3    0x08  // 0000 1000
#define BIT4    0x10  // 0001 0000
#define BIT5    0x20  // 0010 0000
#define BIT6    0x40  // 0100 0000
#define BIT7    0x80  // 1000 0000
// macros to manipulate the bits
//set bit Y on byte X
#define SET_BIT(x,y) (x |= y)
//unset bit Y on byte X
#define UNSET_BIT(x,y) (x &= ~y)
//toggle bit Y on byte X
#define TOGGLE_BIT(x,y) (x ^= y)
//test bit Y is set on byte X
#define IS_BIT_SET(x,y)  (x & y)</pre>

These can make coding much easier, as then you can just worry about setting the bits and not about conversions to binary.

For anyone not sure how to get anything working, the following code will get you started with the PICKit2 development board and the included 16f690. This is the code to light up different LED&#8217;s on the test board depending on what the variable resistor is set to

<pre style="padding-left: 30px;">/* Configuration bits */
typedef unsigned int word;
word at 0x2007 CONFIG = _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF
  & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _IESO_OFF & _FCMEN_OFF & _BOD_OFF ;

void main(){
  while(1==1){
  PORTA = 0;//?
  TRISA = BIT0; //Set RA0 input
  ANSEL = BIT0;//  Just RA0 is an Analog Input
  TRISC=0;//Set All PORTC as output

  ADCON0 = BIT0;  //  Turn on the ADC 0000 0001
                  //   Bit 7   - ADFM,Left Justified Sample (0)
                  //   Bit 6   - Use VDD (0)
                  //   Bit 5:2 - Select AN0 channel (0000)
                  //   Bit 1   - GO/DONE - set separately (0)
                  //   Bit 0   - Enable ADC (1)

  ADCON1 = BIT4;//Set AD Control 0001 0000
                // Bit 7   - res
                // Bit 6:4 - Select the Clock as Fosc/8 (001)
                // Bit 3:0 - res

  SET_BIT(ADCON0, BIT1);//GO/DONE to start conversion
  while( IS_BIT_SET( ADCON0,BIT1 ) ){}//Wait until sample is done

  //Set 4 highest bits to write direct to led's. Ignore 4 LSB
  //ADRESH contains bits 9:2 of result
  PORTC = ADRESH &gt;&gt; 4;
  /*
    //Could also make ACDValue only contain upper 4 bytes
    ADCValue &gt;&gt;= 4;
    ADCValue &= (BIT0 | BIT1 | BIT2 | BIT3); // could also do this with 0xF0 (i think)
    //And then set only those bytes
    PORTC |= ADCValue
    //This would mean other bits of portC would still be same
  */
}
}</pre>

The datasheets for the pics can be hard to get started with, so hopefully that helps a bit. The examples I saw for doing similar things were ridiculously complicated and without good reason. Of course this code is specific to the 16f690, but it should be easy enough to convert.