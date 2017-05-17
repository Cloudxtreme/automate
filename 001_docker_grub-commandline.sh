## Docker likes kernel swappiness support (on reboot)
#sudo bash -c `perl -p -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/g'  /etc/default/grub`

Now that your server supports swap limit capabilities in your docker run command you can use --memory-swappiness=0 and set --memory-swap equal to --memory. You also need to set -Des.bootstrap.mlockall=true.
