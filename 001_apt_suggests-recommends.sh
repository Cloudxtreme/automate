bash -c "cat > /etc/apt/apt.conf.d/99z_suggests" << 'EOF'
APT::Install-Suggests "0";
APT::AutoRemove::SuggestsImportant "false";
EOF

cat /etc/apt/apt.conf.d/99z_suggests

bash -c "cat > /etc/apt/apt.conf.d/99z_recommends" << 'EOF'
APT::Install-Recommends "0";
APT::AutoRemove::RecommendsImportant "false"; 
EOF

# Keep apt list up to date
bash -c "cat > /etc/apt/apt.conf.d/10periodic" << 'EOF'
APT::Periodic::Update-Package-Lists "1";
#  APT::Periodic::Download-Upgradeable-Packages "1";
#  APT::Periodic::Unattended-Upgrade "1";
EOF


#bash -c "cat > /etc/apt/apt.conf.d/02proxy" << 'EOF'
#Acquire::http { Proxy "http://192.168.1.100:3142"; };
#EOF



