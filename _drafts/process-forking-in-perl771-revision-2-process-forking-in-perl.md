---
id: 773
title: process forking in perl
date: 2011-01-05T17:05:14+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/01/05/771-revision-2/
permalink: /2011/01/05/771-revision-2/
---
<pre lang="perl">﻿sub main
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
    my $rc = $? &gt;&gt; 8; # remove signal / dump bits from rc
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

https://wiki.bc.net/atl-conf/pages/viewpage.action?pageId=20548191