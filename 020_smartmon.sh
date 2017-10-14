#!/bin/bash
set +x

apt-get install -y smartmontools gsmartcontrol

sed -i '/^#enable_smart=.*/ s/.*/&\nenable_smart=\"\"/' /etc/default/smartmontools

sed -i '/^#start_smartd=.*/ s/.*/&\nstart_smartd=yes/' /etc/default/smartmontools

sed -i '/^#smartd_opts=.*/ s/.*/&\nsmartd_opts=\"\"/' /etc/default/smartmontools

# smartd must run with the --savestates option as the disks themselves usually do not keep track of the last region tested.
for i in "--interval=1800" "--savestates=/var/lib/smartd/"; 
do 
	echo ${i};
	sed -i "s|^smartd_opts=\"[ ]*\(.*\)\"|smartd_opts=\"\1 ${i}\"|" /etc/default/smartmontools
done

for i in $(smartctl --scan-open | awk {'print $1'})

do 
	echo ${i};
	sed -i "s|^enable_smart=\"[ ]*\(.*\)\"|enable_smart=\"\1 ${i}\"|" /etc/default/smartmontools
done

EMAIL=root
#EMAIL=admin@my_domain.com

# Selective self test progressively tests the disks rather than having to wait for several hours for smartctl -t long to complete. 
# You must initiate the first selective self test manually (-t select,0-${SIZE}) so smartd will know the slice size to test each day. 
# To setup a full test of a 1TB disk within 20 days (one 50GB span each day), run this command once: 
SIZE=99999999
for i in $(smartctl --scan-open | awk {'print $2'}); 
do 
	echo ${i};
	smartctl -t select,0-${SIZE} ${i}
done

# To run the next test spans on Monday-Friday between 12-13am, run smartd with this directive: 
RUNNER_OPT="n/../../[1-5]/12"
sed -i "s|^DEVICESCAN[ ]*\(.*\)|DEVICESCAN -d removable -n standby -m ${EMAIL} -M exec /usr/share/smartmontools/smartd-runner -s ${RUNNER_OPT}|" /etc/smartd.conf
