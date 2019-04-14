cd ~
tmux new -d -s ddt 

tmux rename-window 'today'
tmux send-keys 'nvim ~/Dropbox/today.txt' C-m

tmux new-window -n 'work'
tmux  send-keys '1' C-m 
tmux  send-keys 'ranger' C-m 

tmux new-window -n 'mocp'
tmux   send-keys 'mocp' C-m 

tmux new-window -n 'files'
tmux   send-keys 'ranger' C-m

tmux new-window -n 'upd'
tmux  split-window -h
tmux  split-window -v
tmux  select-pane -t 1
tmux  split-window -v
  
tmux new-window -n 'yt'
tmux  split-window -h
tmux  split-window -v
tmux  select-pane -t 1
tmux  split-window -v

tmux new-window -n 'misc0'
tmux   split-window -h

tmux new-window -n 'bib'
tmux  send-keys 'nvim ~/Dropbox/docs/latex/uni.bib ' C-m

tmux new-window -n 'htop'
tmux   send-keys 'sudo htop' C-m

