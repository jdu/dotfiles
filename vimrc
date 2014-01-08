set shell=/bin/bash

set nocompatible
set laststatus=2
set incsearch
set ttimeout
set ttimeoutlen=10
set ruler
syntax on
set nu
set encoding=utf-8
set t_Co=256
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set gcr=a:blinkon0
set visualbell
set autoread


" Line Endings
set showbreak=~
set modeline

" File Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos

" Line Numbers
set number
set numberwidth=2

set hidden

let mapleader=","

set rtp+=~/vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

execute pathogen#infect()

" Clkose vim when the only active window left is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Send more characters for redraws
set ttyfast

" Turn off Swap files
set noswapfile
set nobackup
set nowb

" Persistent Undo
silent !mkdir ~/vim/backups > /dev/null 2>&1
set undodir=~/vim/backups
set undofile

filetype plugin indent on

" Use the `brew install ctags` version of ctags instead of the normal mac osx
" library
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
nnoremap <silent> <Leader>t :TlistToggle<CR>

let Tlist_Exit_OnlyWindow = 1 " Exit vim when the only pane left open is the taglist window
let Tlist_Show_One_File = 1   " Only show the tags for the currently buffered file
let Tlist_enable_Fold_column = 0 " no fold column
let tlist_sql_settings = 'sql;P:package;t:table' " SQL specific settings

" Line autocompletion
inoremap <Leader>v <C-x><C-o>
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#Complete
autocmd FileType html setlocal omnifunc=htmlcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" Indentation
set shiftwidth=2
set tabstop=2

" Display extra whitespace at the end of the line
" set list listchars=tab:»·,trail:·
set list listchars=tab:\ \ ,trail:·

set nowrap
set linebreak

" Folds
set foldmethod=indent
set foldlevelstart=99

" Completion

set wildmode=longest:full,full
set wildmenu
set wildignore+=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap <leader>q :nohlsearch<CR>

" Scrolling

if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif

set display+=lastline

" set scrolloff=8
" set sidescrolloff=15
set sidescroll=8

" Powerline Settings
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
set laststatus=2

let g:Powerline_symbols = 'fancy'

" NERDTree Mapping
map <Leader>e :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$']

" Highlight bad whitespace
highlight BadWhitespace ctermbg=red guibg=red

" CtrlP Buffer Explorer Key Mapping
let g:ctrl_p_working_path_mode=2
set wildignore+=*/.hg/*,*/.svn/*,*/vendor/cache/*,*/public/system/*,*/ymp/*,*/log/*,*/.git/*,*/.jhw-cache/*,*/solr/data/*,*/node_modules/*,*/.DS_Store
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']
" map <Leader>b :CtrlPBuffer<CR>
map <Leader>a :CtrlPBuffer<CR>

" Unite Mappings "
nnoremap <Leader>g :Unite file_rec/async<cr>
nnoremap <Leader>f :Unite grep:.<cr>
nnoremap <Leader>d :Unite history/yanks<cr>
nnoremap <Leader>s :Unite -quick-match buffer<cr>

" Reselect Visual Block after indende/outdent "
vnoremap < <gv
vnoremap > >gv

" Better up/down on wrapped lines "
nmap j gj
nmap k gk

" Force saving of fiels that require root permissions "
cmap w!! %!sudo tee > /dev/null %

" Clear search higlights "
noremap <silent><Leader>/ :nohls<CR>

" Automatically reload vimrc when it's saved "
if has("autocmd")
	autocmd BufWritePost .vimrc so ~/.vimrc
endif

