# Run 025_mimetypes.sh first
bash ./025_mimetypes.sh

# Copy from default user to /etc/skel
ROX_USER=default
mkdir -p  /etc/skel/.config
cp -a /home/${ROX_USER}/.config/rox.sourceforge.net /etc/skel/.config/


