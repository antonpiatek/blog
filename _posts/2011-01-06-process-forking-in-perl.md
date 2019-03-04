---
id: 771
title: process forking in perl
date: 2011-01-06T10:14:19+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=771
permalink: /2011/01/06/process-forking-in-perl/
aktt_notify_twitter:
  - 'yes'
aktt_tweeted:
  - "1"
openid_comments:
  - 'a:1:{i:0;s:5:"32557";}'
wp-syntax-cache-content:
  - |
    a:1:{i:1;s:7160:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="line_numbers"><pre>1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22
    23
    24
    25
    26
    27
    28
    29
    30
    31
    32
    33
    34
    35
    36
    37
    38
    39
    40
    41
    42
    43
    44
    45
    </pre></td><td class="code"><pre class="perl" style="font-family:monospace;"><span style="color: #666666; font-style: italic;">#!/usr/bin/perl </span>
    <span style="color: #000000; font-weight: bold;">use</span> strict<span style="color: #339933;">;</span>
    <span style="color: #000000; font-weight: bold;">use</span> warnings<span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #000000; font-weight: bold;">sub</span> main
    <span style="color: #009900;">&#123;</span>
    <span style="color: #b1b100;">my</span> <span style="color: #0000ff;">@children</span><span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #b1b100;">foreach</span> <span style="color: #b1b100;">my</span> <span style="color: #0000ff;">$i</span> <span style="color: #009900;">&#40;</span> <span style="color: #000066;">reverse</span><span style="color: #009900;">&#40;</span><span style="color: #cc66cc;">1</span><span style="color: #339933;">..</span><span style="color: #cc66cc;">3</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#41;</span>
    <span style="color: #009900;">&#123;</span>
    <span style="color: #b1b100;">my</span> <span style="color: #0000ff;">$pid</span> <span style="color: #339933;">=</span> <span style="color: #000066;">fork</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    &nbsp;
    <span style="color: #b1b100;">if</span><span style="color: #009900;">&#40;</span> <span style="color: #0000ff;">$pid</span> <span style="color: #009900;">&#41;</span>
    <span style="color: #009900;">&#123;</span>
    <span style="color: #666666; font-style: italic;">#If $pid is non zero, then the parent is running</span>
    <span style="color: #000066;">print</span> <span style="color: #ff0000;">&quot;PID $pid forked ($i)<span style="color: #000099; font-weight: bold;">\n</span>&quot;</span><span style="color: #339933;">;</span>
    <span style="color: #000066;">push</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">@children</span><span style="color: #339933;">,</span> <span style="color: #0000ff;">$pid</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #b1b100;">else</span>
    <span style="color: #009900;">&#123;</span>
    <span style="color: #666666; font-style: italic;"># Else we are a child process ($pid == 0)</span>
    <span style="color: #b1b100;">my</span> <span style="color: #0000ff;">$rc</span> <span style="color: #339933;">=</span> child<span style="color: #009900;">&#40;</span><span style="color: #0000ff;">$i</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #000066;">exit</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">$rc</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #b1b100;">foreach</span> <span style="color: #b1b100;">my</span> <span style="color: #0000ff;">$n</span> <span style="color: #009900;">&#40;</span><span style="color: #0000ff;">@children</span><span style="color: #009900;">&#41;</span>
    <span style="color: #009900;">&#123;</span>
    <span style="color: #b1b100;">my</span> <span style="color: #0000ff;">$pid</span> <span style="color: #339933;">=</span> <span style="color: #000066;">waitpid</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">$n</span><span style="color: #339933;">,</span><span style="color: #cc66cc;">0</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span> <span style="color: #666666; font-style: italic;"># waitpid returns the pid that finished, see perldoc -f waitpid</span>
    <span style="color: #b1b100;">my</span> <span style="color: #0000ff;">$rc</span> <span style="color: #339933;">=</span> <span style="color: #0000ff;">$?</span> <span style="color: #339933;">&gt;&gt;</span> <span style="color: #cc66cc;">8</span><span style="color: #339933;">;</span> <span style="color: #666666; font-style: italic;"># remove signal / dump bits from rc</span>
    <span style="color: #000066;">print</span> <span style="color: #ff0000;">&quot;PID $pid finished with rc $rc<span style="color: #000099; font-weight: bold;">\n</span>&quot;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    <span style="color: #000000; font-weight: bold;">sub</span> child
    <span style="color: #009900;">&#123;</span>
    <span style="color: #b1b100;">my</span> <span style="color: #009900;">&#40;</span><span style="color: #0000ff;">$arg</span><span style="color: #009900;">&#41;</span> <span style="color: #339933;">=</span> <span style="color: #0000ff;">@_</span><span style="color: #339933;">;</span>
    <span style="color: #000066;">print</span> <span style="color: #ff0000;">&quot;$arg: start<span style="color: #000099; font-weight: bold;">\n</span>&quot;</span><span style="color: #339933;">;</span>
    <span style="color: #000066;">sleep</span> <span style="color: #0000ff;">$arg</span><span style="color: #339933;">;</span>
    <span style="color: #000066;">print</span> <span style="color: #ff0000;">&quot;$arg: end<span style="color: #000099; font-weight: bold;">\n</span>&quot;</span><span style="color: #339933;">;</span>
    <span style="color: #000066;">return</span> <span style="color: #0000ff;">$arg</span><span style="color: #339933;">*</span><span style="color: #cc66cc;">2</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
    &nbsp;
    main<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #000066;">exit</span><span style="color: #339933;">;</span></pre></td></tr></table><p class="theCode" style="display:none;">#!/usr/bin/perl
    use strict;
    use warnings;
    
    sub main
    {
    my @children;
    
    foreach my $i ( reverse(1..3) )
    {
    my $pid = fork();
    
    if( $pid )
    {
    #If $pid is non zero, then the parent is running
    print &quot;PID $pid forked ($i)\n&quot;;
    push(@children, $pid);
    }
    else
    {
    # Else we are a child process ($pid == 0)
    my $rc = child($i);
    exit($rc);
    }
    }
    
    foreach my $n (@children)
    {
    my $pid = waitpid($n,0); # waitpid returns the pid that finished, see perldoc -f waitpid
    my $rc = $? &gt;&gt; 8; # remove signal / dump bits from rc
    print &quot;PID $pid finished with rc $rc\n&quot;;
    }
    }
    
    sub child
    {
    my ($arg) = @_;
    print &quot;$arg: start\n&quot;;
    sleep $arg;
    print &quot;$arg: end\n&quot;;
    return $arg*2;
    }
    
    main();
    exit;</p></div>
    ";}
categories:
  - Programming
tags:
  - perl
  - Programming
---
This is a very geeky topic, but I was having a conversation at work today with someone who was trying to do several really simple things in parallel in perl because they didn&#8217;t want to wait several minutes for each one to finish. They had knocked up a change to the existing perl, but had tried to do it using perl threads. Normally, that would be fine for most boxes, but when you are running rather old perl on various unixes, including under USS on the IBM z/OS Mainframe, you tend to find out that perl was not compiled with thread support (and recompiling perl for the mainframe is not the easiest thing in the world).

I suggested that they simply use fork() to do the same thing with multiple perl processes, and having not done this in quite a while I tried to search for a good example but couldn&#8217;t find anything that looked both complete and simple enough to explain quickly &#8211; Hence this post&#8230;

<pre lang="perl" line="1">#!/usr/bin/perl 
use strict;
use warnings;

sub main
{
  my @children;

  foreach my $i ( reverse(1..3) )
  {
    my $pid = fork();

    if( $pid )
    {
      #If $pid is non zero, then the parent is running
      print "PID $pid forked ($i)\n";
      push(@children, $pid);
    }
    else
    {
      # Else we are a child process ($pid == 0)
      my $rc = child($i);
      exit($rc);
    }
  }

  foreach my $n (@children)
  {
    my $pid = waitpid($n,0); # waitpid returns the pid that finished, see perldoc -f waitpid
    my $rc = $? >> 8; # remove signal / dump bits from rc
    print "PID $pid finished with rc $rc\n";
  }
}

sub child
{
  my ($arg) = @_;
  print "$arg: start\n";
  sleep $arg;
  print "$arg: end\n";
  return $arg*2;
}

main();
exit;</pre>

And the output of running the above code is as follows:

<pre>PID 16767 forked (3)
PID 16768 forked (2)
PID 16769 forked (1)
3: start
2: start
1: start
1: end
2: end
3: end
PID 16767 finished with rc 6
PID 16768 finished with rc 4
PID 16769 finished with rc 2
</pre>

It is worth remembering that because each process gets an entire copy of the memory, you have to do more clever things to actually get the processes to talk to each other &#8211; but if all you want to do is run something and get a return code back, the above example should get you going pretty quickly.

For what it is worth, the example at <https://wiki.bc.net/atl-conf/pages/viewpage.action?pageId=20548191> isn&#8217;t too bad actually, and compares perl threads with process forking, and a php example.