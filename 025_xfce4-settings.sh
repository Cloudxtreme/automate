# Changes to xfce4 settings

#Window tiling
xfconf-query -c xfwm4 -p /general/tile_on_move -s true

# Power management - sleep/suspend on power bad, resume takes special ordering of module removal before suspend

xfconf-query -c xfce4-power-manager -l -v
#xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac -n -t int -s 0
#xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/dpms-on-ac-off -n -t int -s 0
#xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/dpms-on-ac-sleep -n -t int -s 0
#xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-ac -n -t int -s 14

#xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac -n -t string -s 0
#xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/dpms-on-ac-off -n -t string -s 0
#xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/dpms-on-ac-sleep -n -t string -s 0
#xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-ac -n -t string -s 14

xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac -n -s 0
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/dpms-on-ac-off -n -s 0
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/dpms-on-ac-sleep -n -s 0

# Disable xfce4-power-manager putting the PC to sleep (any value < 15 disables XFCE put-to-sleep)
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-on-ac -n -s 14
xfconf-query -c xfce4-power-manager -l -v

# Focus settings
xfconf-query --channel xfwm4 --property /general/click_to_focus -n -t bool -s false
xfconf-query --channel xfwm4 --property /general/focus_delay -n -t int -s 250
xfconf-query --channel xfwm4 --property /general/focus_hint -n -t bool -s true
xfconf-query --channel xfwm4 --property /general/focus_new -n -t bool -s false
xfconf-query --channel xfwm4 --property /general/prevent_focus_stealing -n -t bool -s true
xfconf-query --channel xfwm4 --property /general/raise_on_focus -n -t bool -s false

# Increase the number of desktops
#xfconf-query -c xfwm4 -p /general/workspace_count -n -t int -s 8
xfconf-query -c xfwm4 -p /general/workspace_count -n -s 8

# Keyboard layouts plugins doesn't use xfconf remove and just use the main 
# selector which does.
#set uk keyboard
#sed -i 's,^\(layouts=\).*,\1'gb',' ~/.config/xfce4/panel/xkb-plugin-18.rc
sudo apt-get -y  remove xfce4-xkb-plugin 
sudo kill -HUP `ps aux | grep -v grep | grep xfce4-xkb-plugin | awk {'print $2'}`
xfconf-query -c keyboard-layout -p /Default/XkbLayout -n -t string -s gb
xfconf-query -c keyboard-layout -p /Default/XkbDisable -n -t bool -s false




