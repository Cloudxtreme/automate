# Merges upstream debian repos with devuan. Amprolla3 should include filters to spot systemd deps
# Since other upstream repos can be included we should be able to use amprolla to report on other
# systemd distro repos when wishing to import to devuan. Other packages such as pulseaudio could 
# also be included in the filters (config.py:banpkgs = {'systemd', 'systemd-sysv', 'pulseaudio'})

# Edit /usr/src/amprolla/lib/config.py before running amprolla_init.py


# other distros:
# ubuntu / ppa
# http://kxstudio.linuxaudio.org/Repositories
## http://ppa.launchpad.net/kxstudio-debian/libs/ubuntu lucid main
## http://ppa.launchpad.net/kxstudio-debian/music/ubuntu lucid main
## http://ppa.launchpad.net/kxstudio-debian/plugins/ubuntu lucid main
## http://ppa.launchpad.net/kxstudio-debian/apps/ubuntu lucid main
## http://ppa.launchpad.net/kxstudio-debian/kxstudio/ubuntu lucid main
## http://kxstudio.linuxaudio.org/repo/ stable free
## http://kxstudio.linuxaudio.org/repo/ stable non-free


# config.py:
#repos = {
#    'kxstudio': {
#        'name': 'KXSTUDIO',
#        'host': 'http://ppa.launchpad.net/kxstudio-debian/kxstudio/ubuntu',
#        'dists': 'dists',
#        'pool': 'pool',
#        'aliases': False,
#        'skipmissing': False,
#    },
#        'kxstudio-apps': {
#        'name': 'KXSTUDIO-APPS',
#        'host': 'http://ppa.launchpad.net/kxstudio-debian/apps/ubuntu',
#        'dists': 'dists',
#        'pool': 'pool',
#        'aliases': False,
#        'skipmissing': False,
#    },
#        'kxstudio-plugins': {
#        'name': 'KXSTUDIO-PLUGINS',
#        'host': 'http://ppa.launchpad.net/kxstudio-debian/apps/ubuntu',
#        'dists': 'dists',
#        'pool': 'pool',
#        'aliases': False,
#        'skipmissing': False,
#    },
#        'kxstudio-music': {
#        'name': 'KXSTUDIO-PLUGINS',
#        'host': 'http://ppa.launchpad.net/kxstudio-debian/music/ubuntu',
#        'dists': 'dists',
#        'pool': 'pool',
#        'aliases': False,
#        'skipmissing': False,
#    },
#        'kxstudio-libs': {
#        'name': 'KXSTUDIO-LIBS',
#        'host': 'http://ppa.launchpad.net/kxstudio-debian/apps/ubuntu',
#        'dists': 'dists',
#        'pool': 'pool',
#        'aliases': False,
#        'skipmissing': False,
#    },
#}

apt-get install gnupg2 python3-requests rsync

cd /usr/src/
git clone https://github.com/parazyd/amprolla

cd /usr/src/amprolla
cp lib/config.def.py lib/config.py
