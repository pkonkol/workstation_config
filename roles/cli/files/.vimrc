syntax enable

set number
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set showmatch
set mouse=a
set showcmd
set pastetoggle=<F3>

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

nnoremap <space> za

if $TERM == 'alacritty'
  set ttymouse=sgr
endif

let python_highlight_all = 1

set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)
" filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
au FileType py set backspace=indent,eol,start
let g:NERDTreeWinSize=25

au BufNewFile,BufRead *.py 
    \ set foldmethod=indent
set foldlevel=99

" Colorscheme settings "
set t_Co=256

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
"Plug 'zhimsel/vim-stay'

" Code syntax helpers
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'sheerun/vim-polyglot'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'liuchengxu/vista.vim'
"Plug 'dense-analysis/ale'
"Plug 'chrisbra/csv.vim'

" Interface plugins
"Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'jreybert/vimagit'

Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'tmux-plugins/vim-tmux-focus-events'

" Colorscheme plugins
Plug 'srcery-colors/srcery-vim'
" Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'
call plug#end()

"-----vim-stay settings-----"
set viewoptions=cursor,folds,slash,unix

"-----airline configuration settings-----
"let g:airline_statusline_ontop=1
" let g:airline_theme='zenburn'
" let g:airline_powerline_fonts = 1

"-----Ale configuration settings-----
" let g:ale_linters = {
"       \   'python': ['flake8', 'pylint'],
"       \   'ruby': ['standardrb', 'rubocop'],
"       \   'javascript': ['eslint'],
"       \}
" let g:ale_fixers = {
"       \    'python': ['yapf'],
"       \}
" nmap <F10> :ALEFix<CR>
" let g:ale_fix_on_save = 0


" set statusline=
" set statusline+=%m
" set statusline+=\ %f
" set statusline+=%=
