apt-get install -y bootchart2 pybootchartgui

sed -i "s|^GRUB_CMDLINE_LINUX=\"\(.*\)\"|GRUB_CMDLINE_LINUX=\"\1 initcall_debug printk.time=y init=/sbin/bootchartd\"|" /etc/default/grub

update-grub
