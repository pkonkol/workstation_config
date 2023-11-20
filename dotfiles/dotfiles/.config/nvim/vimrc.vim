syntax enable

set number
set tabstop=4
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set showmatch
set mouse=a
set showcmd
set pastetoggle=<F3>
set textwidth=100
set colorcolumn=100
set scrolloff=5
nnoremap <space> za
set t_Co=256

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'HiPhish/nvim-ts-rainbow2'
"Plug 'dense-analysis/ale'

Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
" Colorscheme plugins
Plug 'srcery-colors/srcery-vim'
Plug 'xero/miasma.nvim'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'sainnhe/gruvbox-material'
call plug#end()
colorscheme gruvbox-baby
lua require('treesitter')
