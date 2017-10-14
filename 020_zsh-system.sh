# Run 020_zsh.sh to populate the files needed for /etc/skel
# assuming default user 
ZSH_USER=default

sed -i 's,^\(DSHELL=\).*,\1'/bin/zsh',' /etc/adduser.conf
#sed -i 's,^\(SHELL=\).*,\1'/bin/zsh',' /etc/default/useradd

# Copy zsh files from clean install to /etc/skel
cp -a /home/${ZSH_USER}/zgen /etc/skel
cp -a /home/${ZSH_USER}/zsh-quickstart-kit /etc/skel
cp -a /home/${ZSH_USER}/.zshrc /etc/skel
cp -a /home/${ZSH_USER}/.zshrc.d /etc/skel
cp -a /home/${ZSH_USER}/.zsh_functions /etc/skel
cp -a /home/${ZSH_USER}/.zsh_aliases /etc/skel
cp -a /home/${ZSH_USER}/.zsh_aliases.d /etc/skel
#cp -a /home/${ZSH_USER}/.zsh-completitions /etc/skel
cp -a /home/${ZSH_USER}/.zgen /etc/skel
cp -a /home/${ZSH_USER}/.zgen-setup /etc/skel
cp -a /home/${ZSH_USER}/.zgen-local-plugins /etc/skel
