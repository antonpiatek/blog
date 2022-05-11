---
id: 960
title: 'tmux &#8211; an alternative to GNU screen'
date: 2012-02-14T15:36:08+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2012/02/14/908-revision-5/
permalink: /2012/02/14/908-revision-5/
---
tmux is an alternative to gnu screen. While I like screen, it annoys me that any effort you have put into splitting the screen and arranging panes is not preserved when you detach and reattach to a session. tmux allows this quite easily, and there is a shortcut key to toggle through various automatic layouts which makes it quite powerful to work with. One thing I have been trying to get going for a while is a script which starts a tmux session with multiple split panes, each with an application running in them so that I can start up several things at once and have them all available to watch on the same screen.

The one annoyance I have with tmux is that it appears there is no way to take a window and pull it into a pane. This can be rather annoying, so I tend to try and only use new panes in my session rather than multiple windows (only one window can be viewed at a time, though each window can have multiple panes)

I had problems setting the tmux option to stop windows and panes closing after the program exits (If my program exits, I want to see the error it wrote, and probably restart it). So instead I wrote a script to split the window into panes as desired and then send the commands to each pane to start the program I wanted running in it.

The following is my script for starting tmux, hopefully it is useful to others. It either connects to the existing session or creates a new session, starting several applications. It splits the window into four panes, each of the same size and arranged in each corner, but you can use the shortcut &#8220;^b <space>&#8221; to cycle through the predefined layouts to get, for example, 4 vertical columns of panes.

> <code lang="bash">#!/bin/bash&lt;br />
SESSION=house&lt;/p>
&lt;p>#Connect to existing session if it exists&lt;br />
if [[ $(tmux attach -t $SESSION) ]]&lt;br />
then&lt;br />
  exit;&lt;br />
fi&lt;/p>
&lt;p>#Otherwise start new session&lt;br />
tmux new-session -d -s $SESSION&lt;/p>
&lt;p>#First command&lt;br />
tmux send-keys '~/bin/read_power.sh' C-m \;&lt;/p>
&lt;p>#Horizontal split and second command&lt;br />
tmux split-window -h -t $SESSION&lt;br />
tmux send-keys '~/arduino/FC/FC.py' C-m \;&lt;/p>
&lt;p>#vertical split and third command (in bottom right pane)&lt;br />
tmux split-window -t $SESSION&lt;br />
tmux send-keys '~/bin/lcd-controller.py' C-m \;&lt;/p>
&lt;p>#Select left pane, split vertical and fourth command in bottom left&lt;br />
tmux select-pane -L&lt;br />
tmux split-window -t $SESSION&lt;br />
tmux send-keys 'net-mqtt-sub \#' C-m \;&lt;/p>
&lt;p>#Attach to new session&lt;br />
tmux attach -t $SESSION&lt;br />
</code>

</space>