" Created by: Mr Coxall
" Created on: Sep 2020
" Baisc Vim configurations

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'valloric/youcompleteme'
call plug#end()

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" Basic configurations
set nocompatible        " don't try to be vi compatible
set number              " turn on line numbers
set relativenumber      " turn on relative numbers
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set showmatch           " highlight matching parentheses / brackets [{()}]
set ruler               " show line and column number of the cursor on right side of statusline
set noerrorbells        " turn off bell sound
set visualbell          " blink cursor on error, instead of beeping!
set colorcolumn=80      " set a line down on column 80
set textwidth=79        " so you do not go over 80 character max
set wrap                " wrap lines
set scrolloff=5         " show 5 lines above and below cursor
syntax on               " turn on syntax highlighting
set showmatch           " highlight matching parentheses / brackets [{()}]
colorscheme koehler     " set the color scheme

" Tab configuration
set tabstop=4           " set tabs to 4 spaces
set expandtab           " replace the tab, with actual spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces
set autoindent          " turn on auto indent
set smartindent         " even better autoindent (e.g. add indent after '{')
set smarttab            " be smart when using tabs

" Search configuration
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when searching
set smartcase           " when searching try to be smart about cases
set magic               " for regular expressions turn magic on

" Auto close for brackets and stuff
inoremap "  ""<ESC>hli
inoremap '  ''<ESC>hli
inoremap (  ()<ESC>hli
inoremap [  []<ESC>hli
inoremap {  {}<ESC>hli


" Spell checking
" ==> Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Miscellaneous settings
set background=dark     " configure Vim to use brighter colors
set autoread            " autoreload the file in Vim if it has been changed outside of Vim
filetype off            " Helps force plugins to load correctly when it is turned back on below

" Add Vim native plugin support
packloadall             " turn on Vim native plugin support

" Swift plugin
map <C-I> :pyf ~/.vim/plugin/swift-format.py
imap <C-I> <c-o>:pyf ~/.vim/plugin/swift-format.py
