## PREREQUISITES:
## 1. zfs-auto-snapshot or equivalent package installed locally and regular 
## snapshots enabled (hourly, daily, etc.)
# NB now available in ascii with:
# apt-get install zfs-auto-snapshot
# or:
## Make ZFS Snapshots work on Debian
## A .deb package can be created for zfs-auto-snapshot:
apt-get -y install git build-essential zfsnap 
apt-get -y install zfs-auto-snapshot
#ZSH_BUILD_HOME=/var/tmp/zfs-auto-snapshot
#mkdir -p ${ZSH_BUILD_HOME} && \
#	cd ${ZSH_BUILD_HOME} && \
#	git clone https://github.com/zfsonlinux/zfs-auto-snapshot.git && \
#	cd ${ZSH_BUILD_HOME}/zfs-auto-snapshot &&\
#	git merge origin/debian && \
#	dpkg-buildpackage -b -uc -us && \
#	dpkg -i ../zfs-auto-snapshot_*.deb

# Without --fast the zfs list command regularly takes too long, 100% i/o.
sed -i 's|-q|--quiet|g' /etc/cron.d/zfs-auto-snapshot
sed -i 's|-g|--syslog|g' /etc/cron.d/zfs-auto-snapshot

for i in $(find /etc/cron.*/zfs-auto-snapshot); do
	sed -i 's|--quiet|--quiet --fast|g' "${i}"
done

## 2. home directory set for zfssnap role (the user taking snapshots and 
## doing the sending):
# rolemod -d /path/to/home zfssnap
## 3. ssh keys set up between zfssnap@localhost and remuser@remhost:
# su - zfssnap
# ssh-keygen
## Copy the contents of .ssh/id_rsa.pub into ~remuser/.ssh/authorized_keys on remhost.  Test that key-based ssh works:
# ssh remuser@remhost
## 4. zfs allow done for remuser on remhost:
# zfs allow remuser atime,create,destroy,mount,mountpoint,receive,rollback,snapshot,userprop backuppool/fs
## This can be done on a top-level filesystem, and is inherited by default.
## Depending on your usage, you may need to also allow further permissions such
## as share, sharenfs, hold, etc.
## 5. an initial (full) zfs send/receive done so that remhost has the fs we 
## are backing up, and the associated snapshots -- something like:
# zfs send -R $POOL/$FS@zfs-auto-snap_daily-(latest) | ssh $REMUSER@$REMHOST zfs recv -dvF $REMPOOL
## Note: 'zfs send -R' will send *all* snapshots associated with a dataset, so 
## if you wish to purge old snapshots, do that first.
## 6. zfs allow any additional permissions needed, to fix any errors produced in
## step 5
## 7. configure the TAG/PROP/REMUSER/REMHOST/REMPOOL variables in this script or
## in a config file
## 8. zfs set $PROP={ fullpath | basename | rootfs } pool/fs
## for each FS or volume you wish to back up.
