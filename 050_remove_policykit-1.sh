# From the people who thought bash scripts in init.d were too complicated we get javascript snipits and xml based configuration files to set permissions, just say no. 
apt-get -y remove --purge policykit-1

# This does a number of good things, removing:
# hplip
# policykit-1
# synaptic
# colord
# policykit-1-gnome
# packagekit
# packagekit-tools
# printer-driver-postscript-hp
