bash -c 'cat > /etc/apt/apt.conf.d/02proxy' << 'EOF'
Acquire::http { Proxy "http://192.168.1.50:3142"; };
#Acquire::http { Proxy "http://192.168.1.65:3142"; };
EOF
 
