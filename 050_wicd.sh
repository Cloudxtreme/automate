# Remove network-manager if present.
sudo apt-get -y remove --purge network-manager* gir1.2-networkmanager-1.0 gir1.2-nmgtk-common libnm-*

sudo apt-get -y remove --purge libnm-gtk

sudo rm /home/user/.config/autostart/nm-applet.destop


sudo apt-get -y install wicd wicd-gtk wicd-curses

# Stop the gtk wicd client, it doesn't like files being changes under it. Even if you delette the file, when it exits it writes out its settings.
PID=`ps aux | grep python | grep wicd-client| awk {'print $2'}`
sudo kill -9 ${PID}


#sed -i 's,^\(wireless_interface = \).*,\1'wlan0',' /etc/wicd/manager-settings.conf

# Add wireless settings
sudo bash -c "cat > /etc/wicd/wireless-settings.conf" <<'EOF'
[9C:97:26:79:37:57]
dhcphostname = debian
bssid = 9C:97:26:79:37:57
ip = None
dns_domain = None
gateway = None
use_global_dns = 0
encryption = True
hidden = False
channel = 1
mode = Master
netmask = None
key = 794900B697
usedhcphostname = 0
enctype = wpa
dns3 = None
dns2 = None
dns1 = None
use_settings_globally = 0
use_static_dns = 0
encryption_method = WPA2
essid = PlusnetWireless793757
search_domain = None
beforescript = None
afterscript = None
predisconnectscript = None
postdisconnectscript = None
automatic = 1
EOF

sudo bash -c "cat >> /etc/wicd/wireless-settings.conf" <<'EOF'

[A4:B1:E9:D1:75:09]
dhcphostname = debian
bssid = A4:B1:E9:D1:75:09
ip = None
dns_domain = None
gateway = None
use_global_dns = 0
encryption = True
hidden = False
channel = 11
mode = Master
netmask = None
key = 4CEB4D7FE7
usedhcphostname = 0
enctype = wpa
dns3 = None
dns2 = None
dns1 = None
use_settings_globally = 0
use_static_dns = 0
encryption_method = WPA2
essid = PlusnetWirelessD17509
search_domain = None
beforescript = None
afterscript = None
predisconnectscript = None
postdisconnectscript = None
EOF

# reload the server
sudo /etc/init.d/wicd force-reload

# start the gtk client again
/usr/bin/python -O /usr/share/wicd/gtk/wicd-client.py &


sleep 20

sudo sed -i 's,^\(automatic = \).*,\1'1',' /etc/wicd/wireless-settings.conf
sudo sed -i 's,^\(essid = \).*,\1'PlusnetWireless793757',' /etc/wicd/wireless-settings.conf
sudo sed -i 's,^\(key = \).*,\1'794900B697',' /etc/wicd/wireless-settings.conf
sudo sed -i 's,^\(dns1 = \).*,\1'8.8.8.8',' /etc/wicd/wireless-settings.conf


