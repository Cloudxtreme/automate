# Install docker

#sudo bash -c "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"
 
sudo apt-get update

sudo apt-get -y install --force-yes docker-engine
#sudo apt-get install -y --force-yes docker-engine=1.9.1-0~jessie

sudo mkdir -p /var/lib/docker
sudo umount /dev/mapper/vg_prime-varLibDockerLV 
sudo mount /dev/mapper/vg_prime-varLibDockerLV /var/lib/docker

sudo touch /etc
sudo bash -c `perl -p -i -e 's/#DOCKER_OPTS=""/DOCKER_OPTS="--restart=true"/g'  /etc/default/docker`
sudo bash -c `sed -i "s/DOCKER_OPTS=\"\(.*\)\"/DOCKER_OPTS=\"\1 --storage-driver=zfs\"/" /etc/default/docker`
sudo /etc/init.d/docker restart
sudo dpkg -i /var/tmp/docker-compose/docker-compose_1.11.0-1_amd64.deb 


