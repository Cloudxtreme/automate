## Docker likes kernel swappiness support (on reboot)
bash -c `perl -p -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/g'  /etc/default/grub`

#Now that your server supports swap limit capabilities in your docker run command you can use --memory-swappiness=0 and set --memory-swap equal to --memory. You also need to set -Des.bootstrap.mlockall=true on the docker run commandline.

# eg.
# https://stefanprodan.com/2016/elasticsearch-cluster-with-docker/

# docker run -d -p 9200:9200 \
#	--name es-t0 \
#	--network es-net \
#	-v "$PWD/storage":/usr/share/elasticsearch/data \
#	--cap-add=IPC_LOCK --ulimit nofile=65536:65536 --ulimit memlock=-1:-1 \
#	--memory="2g" --memory-swap="2g" --memory-swappiness=0 \
#	-e ES_HEAP_SIZE="1g" \
#	es-t \
#	-Des.bootstrap.mlockall=true \
#	-Des.network.host=_eth0_ \
#	-Des.discovery.zen.ping.multicast.enabled=false
