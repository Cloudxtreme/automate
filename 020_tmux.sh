# https://github.com/Netherdrake/Dotfiles/tree/master/config/tmux
# wget -c --directory-prefix ~/.config/tmux/ https://raw.githubusercontent.com/Netherdrake/Dotfiles/master/config/tmux/default.sh
mkdir -p ~/.config/tmux
cat > ~/.config/tmux/default.sh << 'EOF'
# Default Theme
TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'235'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}


# Format: segment_name background_color foreground_color [non_default_separator]

# if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
#   TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
#     "tmux_session_info 24 255" \
#     # "hostname 33 0" \
#     # "ifstat_sys 30 255" \
#     "wan_ip 93 255" \
#     "ifstat_sys 64 255" \
#     "vcs_branch 29 88" \
#   )
# fi
# if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
#   TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
#     # "pwd 89 211" \
#     # "now_playing 234 37" \
#     #"cpu 240 136" \
#     "battery 64 255" \
#     "load 93 255" \
#     #"rainbarf 0 0" \
#     #"xkb_layout 125 117" \
#     "date_day 24 255" \
#     "date 24 255 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
#     "time 24 255 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
#   )
# fi

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
  TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
    "tmux_session_info 24 255" \
    # "hostname 33 0" \
    # "ifstat_sys 30 255" \
    # "lan_ip 59 255" \
    "wan_ip 59 255" \
    # "ifstat_sys 64 255" \
    "vcs_branch 64 255" \
  )
fi
if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
  TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
    # "pwd 89 211" \
    # "now_playing 234 37" \
    #"cpu 240 136" \
    "battery 64 255" \
    "load 59 255" \
    #"rainbarf 0 0" \
    #"xkb_layout 125 117" \
    "date_day 24 255" \
    "date 24 255 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
    "time 24 255 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
  )
fi
EOF

# wget -c --directory-prefix ~/.config/tmux/ https://raw.githubusercontent.com/Netherdrake/Dotfiles/master/config/tmux/tmux.conf

cat > ~/.config/tmux/tmux.conf << 'EOF'
# set-option -g default-shell /bin/fish
set-option -g default-shell "/usr/bin/fish"
# https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
set-option -g status on
set-option -g status-interval 2
# set-option -g status-utf8 on
set-option -g status-left-length 60
set-option -g status-right-length 60
set-option -g default-terminal xterm-256color

setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

set -g history-limit 15000

# decrease command delay (increases vim responsiveness)
set -sg escape-time 0

# increase repeat time for repeatable commands
set -g repeat-time 1000

# start window index at 1
set -g base-index 1

# start pane index at 1
setw -g pane-base-index 1

# re-number windows when one is closed
set -g renumber-windows on

# tmux prefix
# unbind C-b
# set -g prefix 'C-n'
bind b copy-mode

# window splitting
unbind a
bind a choose-tree
unbind %
bind v split-window -h
unbind '"'
bind s split-window -v

# resize panes
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# create 20% lower split
unbind t
bind t split-window -p 20

# quickly switch panes
unbind ^J
bind ^J select-pane -t :.+

# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# I dont know what I'm doing
unbind {
unbind }
bind H swap-pane -U
bind L swap-pane -D

# highlight navbar indication of current window
set-window-option -g window-status-current-fg colour235
set-window-option -g window-status-current-bg colour148 #064 blendin
set-window-option -g window-status-fg white
# set-window-option -g window-status-attr bold
# set-window-option -g window-status-current-attr bold

# highlight window when it has new activity
setw -g monitor-activity on
set -g visual-activity off
set-option -g window-status-activity-bg white
set-option -g window-status-activity-fg colour235

# color navbar
set -g status-bg colour235

# set color window borders
set -g pane-border-fg colour148
set -g pane-active-border-fg colour069 # 24 blue
# set -g pane-border-bg black
# set -g pane-active-border-bg black
EOF
