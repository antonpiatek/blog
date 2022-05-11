---
id: 913
title: 'tmux &#8211; an alternative to GNU screen'
date: 2012-02-14T15:32:48+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2012/02/14/908-revision-4/
permalink: /2012/02/14/908-revision-4/
---
tmux is an alternative to gnu screen. While I like screen, it annoys me that any effort you have put into splitting the screen and arranging panes is not preserved when you detach and reattach to a session. tmux allows this quite easily, and there is a shortcut key to toggle through various automatic layouts which makes it quite powerful to work with. One thing I have been trying to get going for a while is a script which starts a tmux session with multiple split panes, each with an application running in them so that I can start up several things at once and have them all available to watch on the same screen.

The one annoyance I have with tmux is that it appears there is no way to take a window and pull it into a pane. This can be rather annoying, so I tend to try and only use new panes in my session rather than multiple windows (only one window can be viewed at a time, though each window can have multiple panes)

I had problems setting the tmux option to stop windows and panes closing after the program exits (If my program exits, I want to see the error it wrote, and probably restart it). So instead I wrote a script to split the window into panes as desired and then send the commands to each pane to start the program I wanted running in it.

The following is my script for starting tmux, hopefully it is useful to others. It either connects to the existing session or creates a new session, starting several applications. It splits the window into four panes, each of the same size and arranged in each corner, but you can use the shortcut &#8220;^b&#8221; to cycle through the predefined layouts to get, for example, 4 vertical columns of panes.

> `#!/bin/bash<br />
SESSION=house`
> 
> #Connect to existing session if it exists  
> if [[ $(tmux attach -t $SESSION) ]]  
> then  
> exit;  
> fi
> 
> #Otherwise start new session  
> tmux new-session -d -s $SESSION
> 
> #First command  
> tmux send-keys &#8216;~/bin/read_power.sh&#8217; C-m \;
> 
> #Horizontal split and second command  
> tmux split-window -h -t $SESSION  
> tmux send-keys &#8216;~/arduino/FC/FC.py&#8217; C-m \;
> 
> #vertical split and third command (in bottom right pane)  
> tmux split-window -t $SESSION  
> tmux send-keys &#8216;~/bin/lcd-controller.py&#8217; C-m \;
> 
> #Select left pane, split vertical and fourth command in bottom left  
> tmux select-pane -L  
> tmux split-window -t $SESSION  
> tmux send-keys &#8216;net-mqtt-sub \#&#8217; C-m \;
> 
> #Attach to new session  
> tmux attach -t $SESSION

&nbsp;