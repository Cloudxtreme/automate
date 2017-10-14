# cgroups uses sysvinit but from 0.2.5 can replace it. ascii version currently 0.2.3
apt-get install sysvinit-core
apt-get install util-linux sysvinit-utils 
apt-get install initscripts openrc

# Reboot when done
for file in /etc/rc0.d/K*; do s=`basename $(readlink "$file")` ; /etc/init.d/$s stop; done
