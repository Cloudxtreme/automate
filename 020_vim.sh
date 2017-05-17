set -x
#sudo apt-get install vim-gtk

sudo sed -i -e 's/"syntax on/syntax on/' /etc/vim/vimrc
sudo sed -i -e 's/"set background=dark/set background=dark/' /etc/vim/vimrc

# vimrc additions
cat > ~/.vimrc << 'EOF'

" enable syntax highlighting
syntax enable

set encoding=utf-8

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" add the proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1
syntax on


" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
 
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
EOF

# Xresources-hybrid-reduced-contrast
cat > ~/.Xresources << 'EOF'
! Hybrid Terminal Colours. Uses the palette from Tomorrow-Night:
! https://github.com/chriskempson/tomorrow-theme/blob/master/vim/colors/Tomorrow-Night.vim
! and the reduced contrast background color from Codecademy's online editor:
! https://www.codecademy.com/learn
! vim: ft=xdefaults

*background: #232C31
*foreground: #C5C8C6
! black
*color0: #2D3C46
*color8: #425059
! red
*color1: #A54242
*color9: #CC6666
! green
*color2: #8C9440
*color10: #B5BD68
! yellow
*color3: #DE935F
*color11: #F0C674
! blue
*color4: #5F819D
*color12: #81A2BE
! magenta
*color5: #85678F
*color13: #B294BB
! cyan
*color6: #5E8D87
*color14: #8ABEB7
! white
*color7: #6C7A80
*color15: #C5C8C6
EOF

cd ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Prepend to the .vimrc

rm ~/.vimrc_pending
touch ~/.vimrc_pending

cat > ~/.vimrc_pending << 'EOF'
set nocompatible              " be iMproved, required
filetype off                  " required

set clipboard=unnamed
set relativenumber
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
#Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'w0ng/vim-hybrid'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'will133/vim-dirdiff'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mhinz/vim-startify'
"Plugin 'mhinz/vim-signify'
Plugin 'airblade/vim-gitgutter'
Plugin 'edkolev/tmuxline.vim'
Plugin 'terryma/vim-multiple-cursors'


" toggleable panels
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'saltstack/salt-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'fatih/vim-go'

" Python
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'fisadev/vim-isort'	 " Automatically sort python imports
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
.


if has('gui_running')
  set background=dark
  colorscheme hybrid
else
  let g:hybrid_custom_term_colors = 1
  let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
  colorscheme hybrid
endif

call togglebg#map("<F5>")

" Airline customizations
let g:airline#extensions#tabline#enabled = 1



" Nerdcommenter customizations
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Nertree customizations
" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']

" YouCompleteMe customizations
" close autocomplete window
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Python docstrings for folded code.
let g:SimplyFold_docstring_preview=1

" Flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/lib


EOF
cat ~/.vimrc_pending

cat ~/.vimrc >> ~/.vimrc_pending
cp ~/.vimrc_pending ~/.vimrc	
#mv ~/.vimrc_pending ~/.vimrc	

cat ~/.vimrc
#vim +PluginInstall +qall

# Install YouCompleteMe support
apt-get install build-essential cmake
apt-get install python-dev python3-dev

# semantic support for C-family
#cd ~/.vim/bundle/YouCompleteMe/ && ./install.py --clang-completer

# Python should work automatically 
#cd ~/.vim/bundle/YouCompleteMe/ && ./install.py

# Go support -
#cd ~/.vim/bundle/YouCompleteMe/ && ./install.py --gocode-code --clang-completer 

# ycmd update
#cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd && git submodule update --init --recursive \
#./build.py --all

# jedi-vim (since youcompleteme seems to just crash)
apt-get install pip3 
pip install jedi

