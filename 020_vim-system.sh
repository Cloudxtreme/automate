# Run 020_vim.sh to populate the dotfiles
VIM_USER=default

cp -a /home/${VIM_USER}/.vimrc /etc/skel
cp -a /home/${VIM_USER}/.vim /etc/skel
cp -a /home/${VIM_USER}/.Xresources /etc/skel
