---
id: 780
title: process forking in perl
date: 2011-01-05T17:16:25+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/01/05/771-revision-9/
permalink: /2011/01/05/771-revision-9/
---
This is a very geeky topic, but I was having a conversation at work today with someone who was trying to do several really simple things in parallel in perl because they didn&#8217;t want to wait several minutes for each one to finish. They had knocked up a change to the existing perl, but had tried to do it using perl threads. Normally, that would be fine for most boxes, but when you are running rather old perl on various unixes, including under USS on the IBM z/OS Mainframe, you tend to find out that perl was not compiled with thread support (and recompiling perl for the mainframe is not the easiest thing in the world).

I suggested that they simply use fork() to do the same thing with multiple perl processes, and having not done this in quite a while I tried to search for a good example but couldn&#8217;t find anything that looked both complete and simple enough to explain quickly &#8211; Hence this post&#8230;

<pre lang="perl">#!/usr/bin/perl 
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