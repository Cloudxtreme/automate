cat > /etc/apt/sources.list-available/jitsi-stable.list << 'EOF'
 # wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -
deb http://download.jitsi.org  stable/
EOF

cat > /etc/apt/sources.list-available/jitsi-testing.list << 'EOF'
 # wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -
deb http://download.jitsi.org  testing/
EOF

# Nightly
cat > /etc/apt/sources.list-available/jitsi-unstable.list << 'EOF'
 # wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -
deb http://download.jitsi.org  unstable/
EOF

ln -sf /etc/apt/sources.list-available/jitsi-unstable.list /etc/apt/sources.list.d/jitsi-unstable.list

wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -

# jitsi unstable GPG error: NO_PUBKEY C697D823EB0AB654 
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C697D823EB0AB654


# Update your package list:

apt-get -y update

# Install the full suite:

apt-get -y install jitsi-meet

# or only the packages you need like for example:

#apt-get install -y jicofo
#apt-get install -y jigasi
#apt-get install -y jitsi
#apt-get install -y jitsi-archive-keyring
#apt-get install -y jitsi-meet
#apt-get install -y jitsi-meet-prosody
#apt-get install -y jitsi-meet-tokens
#apt-get install -y jitsi-meet-web
#apt-get install -y jitsi-meet-web-config
#apt-get install -y jitsi-videobridge

