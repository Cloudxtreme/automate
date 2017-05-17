# sysctl -w vm.max_map_count=262144

if grep -q '^\(vm.max_map_count=\)' /etc/sysctl.conf
then
	sed -i 's,^\(vm.max_map_count=\).*,\1'262144',' /etc/sysctl.conf
else
	echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
fi
