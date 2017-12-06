# Install docker
set -x 
echo '#bash -c "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"' >  /etc/apt/sources.list.d/docker.list
echo "deb http://apt.dockerproject.org/repo debian-stretch main" >> /etc/apt/sources.list.d/docker.list 

bash -c "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"
apt-get update
apt-get -y install -q --no-install-recommends curl ca-certificates
apt-get -y install --force-yes docker-engine jq
#apt-get install -y --force-yes docker-engine=1.9.1-0~jessie

#mkdir -p /var/lib/docker
#umount /dev/mapper/vg_prime-varLibDockerLV 
#mount /dev/mapper/vg_prime-varLibDockerLV /var/lib/docker

bash -c 'perl -p -i -e "s/#DOCKER_OPTS=\"\"/DOCKER_OPTS=\"--restart=true\"/g"  /etc/default/docker'
bash -c 'sed -i "s|DOCKER_OPTS=\"\(.*\)\"|DOCKER_OPTS=\"\1 --storage-driver=zfs\"|" /etc/default/docker'
bash -c 'sed -i "s|DOCKER_OPTS=\"\(.*\)\"|DOCKER_OPTS=\"\1 --dns 52.174.55.168 --dns 188.165.200.156\"|" /etc/default/docker'
bash -c 'sed -i "s|DOCKER_OPTS=\"\(.*\)\"|DOCKER_OPTS=\"\1 zfs.fsname=rpool/docker\"|" /etc/default/docker'

# i2p container requires ipv6 
bash -c 'sed -i "s|DOCKER_OPTS=\"\(.*\)\"|DOCKER_OPTS=\"\1 --ipv6\"|" /etc/default/docker'

# The above can also be passed in /etc/docker/daemon.json
# For other options:
# https://github.com/moby/moby/pull/23657/files?short_path=ca4f406
# https://gist.github.com/lvdh/1f2d50ad49274413d3e501b71a59e819
mkdir -p /etc/docker
if [ ! -f /etc/docker/daemon.json ]
then
	touch /etc/docker/daemon.json
	echo "{}" > /etc/docker/daemon.json
else
	echo "/etc/docker/daemon.json exits."
fi

DOCKER_OPT[0]='.["dns"] = ["52.174.55.168","188.165.200.156"]'
DOCKER_OPT[1]='.["storage-driver"] = "zfs"'
#DOCKER_OPT[2]='.["storage-opts"] = ["zfs.fsname=rpool/docker","size=256"]'
DOCKER_OPT[2]='.["storage-opts"] = ["zfs.fsname=rpool/docker"]'

for ((i = 0; i < ${#DOCKER_OPT[@]}; ++i)); do
	OPTION="${DOCKER_OPT[$i]}"
	jq "${OPTION}" /etc/docker/daemon.json > /tmp/daemon.json.new && \
		mv -b /tmp/daemon.json.new /etc/docker/daemon.json
done

# General options
## Adding a personal registry.
#DOCKER_OPT[0]='.["insecure-registries"] = ["mydocker-registry.net:5000"]'
## Allow live restore, keep containers alive when the daemon becomes unavailable.
## Not compatible with swarm mode.
#DOCKER_OPT[1]='.["live-restore"] = ["true"]'
## Debugging on
#DOCKER_OPT[2]='.["debug"] = ["true"]'
## IPv6 for i2p container
#DOCKER_OPT[3]='.["ipv6"] = ["true"]'
## Logging options
#DOCKER_OPT[4]='.["log-driver"] = ["syslog"]'
##DOCKER_OPT[4]='.["log-opts"] = ["syslog-address","udp://1.2.3.4:1111"]'
#
#for ((i = 0; i < ${#DOCKER_OPT[@]}; ++i)); do
#	OPTION="${DOCKER_OPT[$i]}"
#	jq "${OPTION}" /etc/docker/daemon.json > /tmp/daemon.json.new && \
#		mv -b /tmp/daemon.json.new /etc/docker/daemon.json
#done

# Add tls - we keep the keys on the docker zfs dataset not /etc/docker/tls
#DOCKER_OPT[0]='.["tls"] = ["true"]'
#DOCKER_OPT[1]='.["tlscacert"] = ["/var/lib/docker/ca.pem"]'
#DOCKER_OPT[2]='.["tlscert"] = ["/var/lib/docker/server.pem"]'
#DOCKER_OPT[3]='.["tlskey"] = ["/var/lib/docker/serverkey.pem"]'
#DOCKER_OPT[4]='.["tlsverify"] = ["true"]'
#DOCKER_OPT[5]='.["hosts"] = ["tcp://192.168.59.3:2376"]' 

#for ((i = 0; i < ${#DOCKER_OPT[@]}; ++i)); do
#	OPTION="${DOCKER_OPT[$i]}"
#	jq "${OPTION}" /etc/docker/daemon.json > /tmp/daemon.json.new && \
#		mv -b /tmp/daemon.json.new /etc/docker/daemon.json
#done

## Something similar to set up a swarm
#DOCKER_OPT[0]='.["cluster-advertise"] = "192.168.1.116:12376"'
#DOCKER_OPT[1]='.["cluster-store"] = "etcd://192.168.1.116:12379"'
#DOCKER_OPT[2]='.["cluster-store-opts"] = { "kv.cacertfile" : "/var/lib/docker/discovery_certs/ca.pem", "kv.certfile" : "/var/lib/docker/discovery_certs/cert.pem", "kv.keyfile" : "/var/lib/docker/discovery_certs/key.pem" }'
#for ((i = 0; i < ${#DOCKER_OPT[@]}; ++i)); do
#	OPTION="${DOCKER_OPT[$i]}"
#	jq "${OPTION}" /etc/docker/daemon.json > /tmp/daemon.json.new && \
#		mv -b /tmp/daemon.json.new /etc/docker/daemon.json
#done

groupadd docker
#usermod -aG docker $USER
gpasswd -a $USER docker
newgrp docker

/etc/init.d/docker restart
