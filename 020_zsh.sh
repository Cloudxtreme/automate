apt-get -y install zsh nodejs-legacy

# compaudit
# There are insecure directories: /usr/local/share/zsh/site-functions
# compaudit | xargs chmod g-w
# compaudit 2>&1 | sed -n '1d; p'
 
mkdir -p /usr/local/share/zsh/site-functions
chmod g-w /usr/local/share/zsh/site-functions

cd ~
chsh -s $(which zsh) ${USER}

apt-get install -y git
# Install zgen plugin manager and zsh quicktart to get a default setup for zsh
git clone http://github.com/tarjoilija/zgen # available with apt-get install zgen which installs to /usr/share/zgen
git clone http://github.com/unixorn/zsh-quickstart-kit # FIXME: needs to be packaged
mkdir -p ~/.zgen/robbyrussell/oh-my-zsh-master/
git clone http://github.com/robbyrussell/oh-my-zsh ~/.zgen/robbyrussell/oh-my-zsh-master/

ln -sf ~/zsh-quickstart-kit/zsh/.zshrc ~/.zshrc
ln -sf ~/zsh-quickstart-kit/zsh/.zsh_functions ~/.zsh_functions
ln -sf ~/zsh-quickstart-kit/zsh/.zsh_aliases ~/.zsh_aliases
ln -sf ~/zsh-quickstart-kit/zsh/.zgen-setup ~/.zgen-setup
#ln -sf ~/zsh-quickstart-kit/zsh/.zsh_completions ~/.zsh-completions
mkdir -p ~/.zshrc.d
echo "setopt PROMPT_SUBST" >> ~/.zshrc


echo "NVIM_PYTHON_LOG_FILE=/var/tmp/nvim_python.log" >> ~/.zshrc.d/008_nvim.zsh
echo "NVIM_PYTHON_LOG_LEVEL=DEBUG" >> ~/.zshrc.d/008_nvim.zsh
touch /var/tmp/nvim_python.log

# fix path error in .zshrc
sed -i 's|pushd $(dirname "${HOME}/$(readlink ~/.zshrc)")|pushd $(dirname "$(readlink ~/.zshrc)")|' ~/zsh-quickstart-kit/zsh/.zshrc

# debians locate db locate
# sed -i 's,^\(export LOCATE_PATH=\).*,\1'/var/lib/mlocate/mlocate.db',' ~/.zshrc
echo "export LOCATE_PATH=/var/lib/mlocate/mlocate.db" > ~/.zshrc.d/005-locatedb

# add plugins to the load-starter-plugin-list() function in ~/.zgen-setup ~/zsh-quickstart-kit/zsh/.zgen-setup
# FIXED: create a file named .zgen-local-plugins and add your zgen load commands there. 
# Don't forget to run `zgen save` at the end of your .zgen-local-plugins file.
# Warning: .zgen-local-plugins REPLACES the starter list setup, it doesn't add to it.
#sed -i -e "s|zgen load srijanshetty/docker-zsh|# zgen load srijanshetty/docker-zsh|" ~/zsh-quickstart-kit/zsh/.zgen-setup
#sed -i '/\# zgen load srijanshetty\/docker-zsh/a\ \ zgen load oh-my-zsh plugins\/docker\n\ \ zgen load oh-my-zsh plugins\/docker-compose' ~/zsh-quickstart-kit/zsh/.zgen-setup

# The contents of the starter plugin function with changes above, pulling from upstream git with now not squash local changes.
cat > ~/.zgen-local-plugins << 'EOF'
  echo "creating a zgen save"
  ZGEN_LOADED=()
  ZGEN_COMPLETIONS=()

  # Load oh-my-zsh base
  zgen oh-my-zsh

  # .zgen-local-plugins is sourced during startup *instead* of running .zgen-setup load-starter-plugin-list function,
  # so make sure to include everything from this function that you want to keep.

  # If zsh-syntax-highlighting is bundled after zsh-history-substring-search,
  # they break, so get the order right.
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search

  # Set keystrokes for substring searching
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down

  # Tab complete rakefile targets
  #zgen load unixorn/rake-completion.zshplugin

  # Automatically run zgen update and zgen selfupdate every 7 days
  zgen load unixorn/autoupdate-zgen

  zgen load unixorn/jpb.zshplugin

  # Colorize the things if you have grc installed. Well, some of the
  # things, anyway.
  zgen load unixorn/warhol.plugin.zsh

  # OS X helpers
  zgen load unixorn/tumult.plugin.zsh

  # Warn you when you run a command that you've got an alias for
  zgen load djui/alias-tips

  # Add my collection of git helper scripts
  zgen load unixorn/git-extra-commands

  # Add my bitbucket git helpers plugin
  zgen load unixorn/bitbucket-git-helpers.plugin.zsh

  # A collection of scripts that might be useful to sysadmins
  zgen load skx/sysadmin-util

  # Adds aliases to open your current repo & branch on github.
  zgen load peterhurford/git-it-on.zsh

  # Tom Limoncelli's tooling for storing private information (keys, etc)
  # in a repository securely by encrypting them with gnupg
  zgen load StackExchange/blackbox

  # Load some oh-my-zsh plugins
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/aws
  #zgen oh-my-zsh plugins/chruby
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/github
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/rsync
  zgen oh-my-zsh plugins/tmux
  zgen oh-my-zsh plugins/screen
  zgen oh-my-zsh plugins/vagrant

  if [ $(uname -a | grep -ci Darwin) = 1 ]; then
    # Load OSX-specific plugins
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/osx
  fi

  # A set of shell functions to make it easy to install small apps and
  # utilities distributed with pip.
  zgen load sharat87/pip-app

  zgen load chrissicool/zsh-256color

  # Load more completion files for zsh from the zsh-lovers github repo
  zgen load zsh-users/zsh-completions src

  # Docker completion
  # zgen load srijanshetty/docker-zsh
  zgen load akarzim/zsh-docker-aliases
  #zgen load robbyrussell/oh-my-zsh plugins/docker
  #zgen load robbyrussell/oh-my-zsh plugins/docker-compose

  # Load me last
  GENCOMPL_FPATH=$HOME/.zsh/complete

  # Very cool plugin that generates zsh completion functions for commands
  # if they have getopt-style help text. It doesn't generate them on the fly,
  # you'll have to explicitly generate a completion, but it's still quite cool.
  zgen load RobSis/zsh-completion-generator

  # Add Fish-like autosuggestions to your ZSH
  zgen load zsh-users/zsh-autosuggestions

  # k is a zsh script / plugin to make directory listings more readable,
  # adding a bit of color and some git status information on files and directories
  zgen load rimraf/k

  # Bullet train prompt setup
  #zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
  zgen load robbyrussell/oh-my-zsh themes/agnoster

  ## Load Prezto
  # zgen prezto

  ## Load prezto plugins
  # zgen prezto <modulename> <option> <value(s)>
  # zgen prezto <modulename>

  ## prezto options
  # zgen prezto editor key-bindings 'emacs'
  # zgen prezto prompt theme 'sorin'

  ## prezto and modules
  #zgen prezto
  # zgen prezto git
  # zgen prezto command-not-found
  # zgen prezto syntax-highlighting

  ## plugins
  # zgen load /path/to/super-secret-private-plugin

  # Save it all to init script
  zgen save
EOF

# example .d file use unset to prevent update
echo '# Use unset 'QUICKSTART_KIT_REFRESH_IN_DAYS' to disable.' > ~/.zshrc.d/001-quickstart_refresh.zsh
echo 'QUICKSTART_KIT_REFRESH_IN_DAYS=30' >> ~/.zshrc.d/001-quickstart_refresh.zsh
echo 'ZGEN_PLUGIN_UPDATE_DAYS=30' > ~/.zshrc.d/001-zgen_refresh.zsh

apt-get install -y fonts-powerline powerline
# sed -i 's,^\(export LOCATE_PATH=\).*,\1'/var/lib/mlocate/mlocate.db',' ~/.zshrc

# Use powerline-daemon to speedup the prompt.
echo 'powerline-daemon -q' > ~/.zshrc.d/006-powerline-daemon.zsh


sed -i 's,^\(CHARMAP=\).*,\1'\"UTF-8\"',' /etc/default/console-setup

# set theme for zsh
cat > ~/.zshrc.d/002-theme.zsh << 'EOF'
# https://zshthem.es/browse-zsh-themes/
ZSH_THEME="agnoster" # powerline based theme	
#ZSH_THEME="3den"
#ZSH_THEME="Pure"
EOF

#git clone https://github.com/bhilburn/powerlevel9k.git ~/.zgen/robbyrussell/oh-my-zsh-master/themes/powerlevel9k

## add a separate zsh aliases directory
#echo > ~/.zshrc << 'EOF'
## Make it easy to append your own aliases
## loading all files from .zsh_aliases.d directory
#mkdir -p ~/.zsh_aliases.d
#if [ -n "$(ls ~/.zsh_aliases.d)" ]; then
#  for dotfile in ~/.zsh_aliases.d/*
#  do
#    if [ -r "${dotfile}" ]; then
#      source "${dotfile}"
#    fi
#  done
#fi
#EOF 

# alias python version
mkdir -p ~/.zsh_aliases.d

# tell bash to check the next word after the alias (i.e sudo) by adding a space to the end of the alias value.
echo "# tell bash to check the next word after the alias (i.e sudo) by adding a space to the end of the alias value." > ~/.zsh_aliases.d/002_sudo.zsh
echo 'alias sudo="sudo "' >>  ~/.zsh_aliases.d/002_sudo.zsh

cat > ~/.zsh_aliases.d/003-py_aliases.zsh << 'EOF'
_py_version() {
  PY_VERSIONS=(2 3)

  LINE=(${(s: :)history[$HISTCMD]})
  COMMAND=${LINE[1]}
  ARGS=${(j: :)LINE[2,-1]}

  while (( 1 )) {
    read -s -k1 VERSION"?$COMMAND [${PY_VERSIONS[1]}]: "
    if [[ $VERSION == $'\n' ]]; then
      VERSION=${PY_VERSIONS[1]}
      break
    elif (( ${PY_VERSIONS[(I)$VERSION]} )); then
      echo $VERSION
      break
    fi
    echo "$VERSION is not supported (${(j:, :)PY_VERSIONS})"
  }

  if [[ -x $(which $COMMAND$VERSION) ]]; then
    COMMAND=$COMMAND$VERSION
  else
    COMMAND="python$VERSION $(which -a $COMMAND | grep -v aliased | head -n 1)"
  fi
  eval $COMMAND $ARGS
}

# versioned python commands
alias python="_py_version"
alias pip="_py_version"
alias pydoc="_py_version"
alias idle="_py_version"
alias ipython="_py_version"
alias jupyter="_py_version"
EOF

