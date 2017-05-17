
bash -c "cat > /etc/apt/preferences.d/avoid-avahi.pref" << 'EOF'
Package: avahi*
Pin: origin ""
Pin-Priority: -10

Package: *bonjour*
Pin: origin ""
Pin-Priority: -10
EOF

cat > "/etc/apt/preferences.d/avoid-pulseaudio.pref"  << 'EOF'
Package: pulseaudio*
Pin: origin ""
Pin-Priority: -10
EOF

cat > "/etc/apt/preferences.d/avoid-systemd.pref" << 'EOF'
Package: *
Package: systemd
Pin: origin ""
Pin-Priority: -10

Package: systemd-sysv
Pin: origin ""
Pin-Priority: -10

Package: libsystemd0
Pin: origin ""
Pin-Priority: -10

Package: policykit-1
Pin: origin ""
Pin-Priority: -10

Package: libpam-systemd
Pin: origin ""
Pin-Priority: -10

Package: libsystemd0:i386
Pin: origin ""
Pin-Priority: -10

Package: packagekit
Pin: origin ""
Pin-Priority: -10
EOF


cat > "/etc/apt/preferences.d/avoid-mono.pref" << 'EOF'
Package: libmono*
Pin: origin ""
Pin-Priority: -10
EOF

cat > "/etc/apt/preferences.d/avoid-zeroconf.pref" << 'EOF'
Package: zeroconf*
Pin: origin ""
Pin-Priority: -10
EOF

cat > "/etc/apt/preferences.d/devuan.pref" << 'EOF'
Package: *
Pin: origin "auto.mirror.devian.org"
Pin-Priority: 1001

Package: *
Pin: origin "packages.devuan.org"
Pin-Priority: 1001

Package: *
Pin: release a=jessie
Pin-Priority:800

Package: *
Pin: release a=jessie-backports
Pin-Priority:750

Package: *
Pin: release a=ascii
Pin-Priority:100

Package: *
Pin: release a=ceres
Pin-Priority:50
EOF

cat > "/etc/apt/preferences.d/zfsonlinux.pref" << 'EOF'
# pinning, set zfs packages at 1002
Package: *
Pin: origin "archive.zfsonlinux.org"
Pin-Priority: 1002
EOF

