apt-get install lxc dnsmasq

# lxc-net configuration sourced from /usr/lib/x86_64-linux-gnu/lxc/lxc-net which contains the default values which means your bridge will be given a subnet of 10.0.3.0.

# The defaults, lets explicitly put them in /etc/default/lxc-net so we know where and what to change.
cat > /etc/default/lxc-net << 'EOF'
USE_LXC_BRIDGE="true"
LXC_BRIDGE="lxcbr0"
LXC_BRIDGE_MAC="00:16:3e:00:00:00"
LXC_ADDR="10.0.3.1"
LXC_NETMASK="255.255.255.0"
LXC_NETWORK="10.0.3.0/24"
LXC_DHCP_RANGE="10.0.3.2,10.0.3.254"
LXC_DHCP_MAX="253"
LXC_DHCP_CONFILE=""
LXC_DOMAIN=""

LXC_IPV6_ADDR=""
LXC_IPV6_MASK=""
LXC_IPV6_NETWORK=""
LXC_IPV6_NAT="false"
EOF

# Create template for new containers
# NB. For some reason lxc.network* will be replaced by lxc.net* in the configuration files below

# The /etc/lxc/default.conf only has one line at install:
## lxc.network.type = empty
# Just to make sure we don't squash future additions let change and append 
sed -i 's,^\(lxc.network.type = \).*,\1'veth',' /etc/lxc/default.conf

# Newly created containers will be using the lxcbr0 bridge created by the lxc-net service. 
cat >> /etc/lxc/default.conf << 'EOF'
lxc.network.link = lxcbr0
lxc.network.flags = up
lxc.network.hwaddr = 00:16:3e:xx:xx:xx
lxc.network.ipv4 = 0.0.0.0/24
EOF

#Uncomment net.ipv4.ip_forward
sed -i -- 's/#net.ipv4.ip_forward/net.ipv4.ip_forward/g' /etc/sysctl.conf
#Change value of net.ipv4.ip_forward if not already 1
sed -i 's,^\(net.ipv4.ip_forward=\).*,\1'1',' /etc/sysctl.conf
#Activate on current system
echo 1 > /proc/sys/net/ipv4/ip_forward


/etc/init.d/lxc-net restart

# Other configuration in:
## /usr/share/lxc/config/

## /usr/share/lxm/config/common.conf.d
# This directory can be used by packages and users to dump LXC
# configuration snippets which will then be used by all containers using
# the common.conf configuration file (directly or indirectly).
#
#Configuration files must end with the .conf suffix and LXC will include
#those in alphabetical order.

# Needed for live migrate
sudo apt-get install criu

## then you can:
# lxc launch ubuntu $somename
# sleep 5s # let the container get to an interesting state
# lxc move host1:$somename host2:$somename

# But it would be nicer to use zfs features

# Add devuan template
# https://git.devuan.org/gregolsen/lxc-devuan
cd /var/tmp
git clone https://git.devuan.org/gregolsen/lxc-devuan.git
cp /var/tmp/lxc-devuan/templates/* /usr/share/lxc/templates/
cp /var/tmp/lxc-devuan/config/* /usr/share/lxc/config/
rm -rf /var/tmp/lxc-devuan

# LXC ZFS backingstore (amd64)
# no mount point need on create as it is created on init
#  zfs create -o ${POOL_NAME}/lxc

POOL_NAME=rpool
echo "lxc.bdev.zfs.root = ${POOL_NAME}/lxc" >> /etc/lxc/lxc.conf 

# Now you can use -B zfs	
# lxc-create -t devuan -n devuan-jessie-box2 -B zfs
