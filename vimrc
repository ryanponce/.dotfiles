if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" colors
syntax enable

" spaces and tabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" ui config
set number
set showcmd
filetype plugin indent on
set wildmenu
set showmatch
set laststatus=2
set nocompatible
set ttyfast
set lazyredraw
set updatetime=100
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<cr> " turn off search highlight

" movement
nnoremap j gj
nnoremap k gk
set backspace=indent,eol,start

" leader shortcuts
map <SPACE> <leader>
inoremap jk <esc>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" fzf
nnoremap <leader>p :Files<cr>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" ale
let g:ale_completion_enabled = 1
let g:ale_fixers = {'typescript': ['prettier', 'tslint', 'eslint', 'prettier_eslint'], 'javascript': ['prettier', 'eslint', 'prettier_eslint']}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '💣'
let g:ale_sign_warning = '⚠️'
