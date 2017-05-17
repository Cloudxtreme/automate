cat > /etc/sysctl.d/01-elastic.conf << 'EOF'
vm.max_map_count=262144
vm.swappiness = 1
EOF
