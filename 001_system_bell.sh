# kill the beep
# https://wiki.archlinux.org/index.php/Disable_PC_speaker_beep
# bash shell
#echo 'set bell-style none' >> ~/.inputrc
#echo 'set bell-style none' >> /etc/inputrc

# ~/.screenrc
#vbell on

# system console
#sudo echo "setterm -blength 0" > /etc/profile.d/disable-beep.sh

# X11
xset b off

# .inputrc
sudo bash -c `echo "set bell-style visible" > /etc/inputrc`

#all - /etc/modprobe.d/blacklist
sudo modprobe -r pcspkr
sudo bash -c `"echo 'blacklist pcspkr'" >> /etc/modprobe.d/nobeep.conf`
