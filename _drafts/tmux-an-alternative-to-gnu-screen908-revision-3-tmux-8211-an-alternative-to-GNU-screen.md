---
id: 912
title: 'tmux &#8211; an alternative to GNU screen'
date: 2012-02-14T15:31:04+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2012/02/14/908-revision-3/
permalink: /2012/02/14/908-revision-3/
---
tmux is an alternative to gnu screen. While I like screen, it annoys me that any effort you have put into splitting the screen and arranging panes is not preserved when you detach and reattach to a session. tmux allows this quite easily, and there is a shortcut key to toggle through various automatic layouts which makes it quite powerful to work with. One thing I have been trying to get going for a while is a script which starts a tmux session with multiple split panes, each with an application running in them so that I can start up several things at once and have them all available to watch on the same screen.

The one annoyance I have with tmux is that it appears there is no way to take a window and pull it into a pane. This can be rather annoying, so I tend to try and only use new panes in my session rather than multiple windows (only one window can be viewed at a time, though each window can have multiple panes)

I had problems setting the tmux option to stop windows and panes closing after the program exits (If my program exits, I want to see the error it wrote, and probably restart it). So instead I wrote a script to split the window into panes as desired and then send the commands to each pane to start the program I wanted running in it.

The following is my script for starting tmux, hopefully it is useful to others. It either connects to the existing session or creates a new session, starting several applications. It splits the window into four panes, each of the same size and arranged in each corner, but you can use the shortcut &#8220;^b <space>&#8221; to cycle through the predefined layouts to get, for example, 4 vertical columns of panes.

> `#!/bin/bash<br />
SESSION=house</p>
<p>#Connect to existing session if it exists<br />
if [[ $(tmux attach -t $SESSION) ]]<br />
then<br />
  exit;<br />
fi</p>
<p>#Otherwise start new session<br />
tmux new-session -d -s $SESSION</p>
<p>#First command<br />
tmux send-keys '~/bin/read_power.sh' C-m \;</p>
<p>#Horizontal split and second command<br />
tmux split-window -h -t $SESSION<br />
tmux send-keys '~/arduino/FC/FC.py' C-m \;</p>
<p>#vertical split and third command (in bottom right pane)<br />
tmux split-window -t $SESSION<br />
tmux send-keys '~/bin/lcd-controller.py' C-m \;</p>
<p>#Select left pane, split vertical and fourth command in bottom left<br />
tmux select-pane -L<br />
tmux split-window -t $SESSION<br />
tmux send-keys 'net-mqtt-sub \#' C-m \;</p>
<p>#Attach to new session<br />
tmux attach -t $SESSION<br />
` 

</space>