cat > /etc/udev/rules.d/99-saleae-logic.rules << 'EOF'
# Rules for the Saleae Logic analyzer to allow to run the programs a normal user
# being part of the plugdev group. Simply copy the file to /etc/udev/rules.d/
# and plug the device

#BUS!="usb", ACTION!="add", SUBSYSTEM!=="usb_device", GOTO="saleae_logic_rules_end"
SUBSYSTEM!="usb", GOTO="saleae_logic_rules_end"

# Saleae Logic analyzer (USB Based)
# Bus 006 Device 006: ID 0925:3881 Lakeview Research
# Bus 001 Device 009: ID 21a9:1004 Product: Logic S/16, Manufacturer: Saleae LLC

ATTRS{idVendor}=="0925", ATTRS{idProduct}=="3881", MODE="664", GROUP="plugdev"
ATTRS{idVendor}=="21a9", ATTRS{idProduct}=="1004", MODE="664", GROUP="plugdev"

LABEL="saleae_logic_rules_end"
EOF

cat > /etc/udev/rules.d/99-xf2-logic.rules << 'EOF'
SUBSYSTEM!="usb", GOTO="fx2-probe--programming_rules_end"

ATTRS{idVendor}=="04b4", ATTRS{idProduct}=="8613", MODE="0664", GROUP="plugdev"

LABEL="fx2-probe--programming_rules_end"
EOF

echo 'blacklist usbtest' >> /etc/modprobe.d/blacklist.conf

cat > /etc/udev/rules.d/60-blackmagic-probe.rules << 'EOF'
SUBSYSTEM!="usb", GOTO="blackmagic-probe-programming_rules_end"

ATTRS{idVendor}=="1d50", ATTRS{idProduct}=="6017", MODE="0666", GROUP="plugdev"

LABEL="blackmagic-probe-programming_rules_end"
EOF

cat > /etc/udev/rules.d/60-st-linkv2.rules << 'EOF'
## Now in stlink-utils 49-stlinkv2.rules
#SUBSYSTEM!="usb", GOTO="st-link-v2-programming_rules_end"
#
#ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", MODE="0666", GROUP="plugdev"
#
#LABEL="st-link-v2-programming_rules_end"
EOF

cat > /etc/udev/rules.d/60-cp210x.rules << 'EOF'
# udev rules file for CP210x device to be programmable py
# cp210x-program

SUBSYSTEM!="tty", GOTO="cp210x-programming_rules_end"

ATTRS{idVendor}=="10C4", ATTRS{idProduct}=="EA60", MODE="0666", GROUP="plugdev"
ATTRS{idVendor}=="10C4", ATTRS{idProduct}=="EA61", MODE="0666", GROUP="plugdev"

LABEL="cp210x-programming_rules_end"
EOF

cat > /etc/udev/rules.d/81-thinkpad-dock.rules << 'EOF'
KERNEL=="dock.0", ACTION=="change", RUN+="/usr/local/sbin/thinkpad-dock.sh"
EOF

cat > /etc/udev/rules.d/51-android.rules << 'EOF'
SUBSYSTEM!="usb", GOTO="android_rules_end"

ATTR{idVendor}=="18d1", ATTR{idProduct}=="4ee7", MODE="0666", GROUP="plugdev", SYMLINK+="android_adb", OWNER="default"

LABEL="android_rules_end"
EOF
