apt-get install djmount

DJMOUNT_DIR=~/dlna
mkdir -p ${DJMOUNT_DIR}

bash -c "cat > ~/.config/autostart/djmount.desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Version=0.71
Type=Application
Name=djmount
Comment=UPNP/DLNA mount 
Exec=sh -c "/usr/bin/djmount ${DJMOUNT_DIR}"
StartupNotify=false
Terminal=false
Hidden=false
EOF
chmod +x ~/.config/autostart/djmount.desktop

bash -c "cat > /usr/share/applications/djmount.desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Version=0.71
Type=Application
Name=djmount
Comment=UPNP/DLNA 
Exec=sh -c "/usr/bin/djmount ${DJMOUNT_DIR}"
StartupNotify=false
Terminal=false
Hidden=false
EOF
#chmod +x /usr/share/applications/djmount.desktop

bash -c "cat > ~/.local/share/applications/djmount.desktop"  <<EOF
[Desktop Entry]
Encoding=UTF-8
Version=0.71
Type=Application
Name=djmount
Comment=UPNP/DLNA 
Exec=sh -c "/usr/bin/djmount ${DJMOUNT_DIR}"
StartupNotify=false
Terminal=false
Hidden=false
EOF
chmod +x ~/.local/share/applications/djmount.desktop

