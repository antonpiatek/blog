---
id: 638
title: 'Book review: Python 3 for Absolute Beginners'
date: 2010-04-02T11:07:40+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/04/02/635-revision-3/
permalink: /2010/04/02/635-revision-3/
---
Python 3 for Absolute Beginners, Tim Hall and J-P Stacey, Apress (ISBN: 978-1-4302-1632-2)

_Disclaimer: I was asked to review this book through the Hampshire Linux User Group. I did not receive any instruction for the outcome of the review nor any payment for the review (though I did get to keep the book)._

__ I believe it is important to know something about a reviewer of a book, so that the statements made can be fully appreciated. I am a Software Developer, so spend most of my day reading and writing code. These days it is mostly Perl and Java, though some days it is all C++. I have never written Python before, though I have poked at about two scripts (and even made a fix to one), but it is probably fair to say that I have spent less than an hour looking at Python code before reading this book.

The book does actually mention that the source code examples are available for download from Apress.com however it is mentioned on the first inside page where all the copyright information is (and which you normally skip over automatically). If you want the exapmles, they are at <http://apress.com/book/downloadfile/4500﻿﻿﻿>

The book opens fairly well for a beginners book, and seems strongly aimed at someone who has never programmed before (I have heard lots of people recommending Python as a good language to teach yourself programming with and can understand why). I was pleased to an early reference to [Monty Python](http://en.wikipedia.org/wiki/Monty_Python) as well, as [this is where the name Python comes from](http://en.wikipedia.org/wiki/Python_(programming_language)#Neologisms).

The use of Python&#8217;s interactive interpreter is excellent and it makes for great examples of simple parts of the language, while also being so short that you actually want to type them into your computer and try them out! In particular the author&#8217;s use of Pythons interpreter to print out details of a data-type or variable, and even the outcome of comparisons (e.g. entering &#8220;1==2&#8221; into the Python interpreter returns &#8220;False&#8221; without having to actually use a print statement or any other debug methods which I think is fantastic for a new programmer and a real time saver)

It is a shame that the author fails to stress the differences between Python 2.x and 3.x strongly enough. While some code will work on both versions, there are very large changes and it should have been made more clear early on that Python 2.x code is unlikely to work in Python 3.x, and vice-versa, as I would expect users to also seek examples on the web and it will just be confusing if the examples don&#8217;t work because of changes between versions of Python.

By chapter two some software design principles have been introduced alongside the first actual program, which is of course &#8220;hello world&#8221;. The author spends a long time talking about Software Engineering and Design principles, which is all valuable information, but I doubt many readers will actually spend time reading this and will instead skip over it. It does cover pretty much everything from design approaches (inside-out vs top-down) all the way to code control, versioning, comments, documentation, etc so certainly tries to cover all the bases.

The book then moves on to explaining variables and datatypes, operators and precedence, integers vs floats and all the core basics of a language. I initially thought that explanations of Octal and Hexadecimal values were perhaps a little advanced for a book aimed at &#8220;Absolute Beginners&#8221;, but the author did make a good point that these are often used in file permissions and html colours and this makes them very useful to know.

The examples in the book start off short and sweet, but at some point the author had the idea to continually rework a text-based RPG game he invented for the book. The only problem with this is that you end up staring at several pages of code, and all you want to do then is skip over it, and then start skipping the explanations of this long code. I think the author was trying to teach some good refactoring techniques throughout the book by using this larger piece of code, however I feel that shorter, separate examples would have been easier to understand.

At one point the example programs start using  &#8216;#! /usr/bin/env python&#8217; as the first line of the code but without any explanation. My personal opinion is that &#8216;#!/usr/bin/python&#8217; is more common however even that has its problems. As Python 3 is still very new, pretty much all current Linux systems will have Python 2.x installed as /usr/bin/python so both of these methods would attempt to run the code with Python 2.x and not 3.x. Many of the example source files from the website are also the same, and because they do not define python3 as the interpreter via the hash-bang (#!) line they will not run if you just try to execute them, which is a real shame. Some of the downloaded source code gets very close with &#8216;#! /usr/bin/env python3.0&#8242;, however on Ubuntu Karmic the current Python 3.x version is 3.1, so this code still fails to run unless you explicitely call it with Python3.1 or edit the line to just have &#8220;#!/usr/bin/env python3&#8217; which is symlinked to 3.1 Some of the short examples, particularly around regular expressions, refer back to variables that were last shown to the reader four or give pages previously. This makes it very hard

Other than the above minor problems with the book, it makes a very thorough introduction to programming and Python 3. If you have never programmed, then this is a very good book to start with. If you have programmed, but never in Python then this book is still very good, though you will find yourself skipping sections here and there. If you already know Python 2.x then this book is probably not for you, as it only explains a few changes between version 2.x and 3, and you will probably know the rest already.

One thing to mention is that Python 3 is still very new, and in fact 2.6 is the default for the Ubuntu Lucid Lynx release as well as (at this stage) Debian Squeeze. I expect Python 3 is still a few good years from becoming the default &#8211; This is either a good thing as you have more time to learn version 3, or it can be seen as a bad thing as most existing code is based on 2.x and will need

<div id="_mcePaste">
  &#8212;&#8212;&#8212;&#8212;-
</div>

<div id="_mcePaste">
  Author suggests defining all variables in advance of use or documenting them in a data table at the top of the code. To me this is very old-school C or assember coding, and I prefer not to do be far more flexible &#8211; defining many variables just before use, especially if their use is short lived.
</div>

<div id="_mcePaste">
  Some code examples have redundant code, which makes readability harder as you sit there wondering how your are reading the code wrong because &#8220;there must be a reason that code is there, why can&#8217;t I figure out the reason?!&#8221;
</div>

<div id="_mcePaste">
  Several examples (mostly one line examples) refer to data which was defined several pages previously, which can make figuring out the actual example rather difficult &#8211; shame they didnt reprint the original variable creation/declaration
</div>