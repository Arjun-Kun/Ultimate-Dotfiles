" by Arjun Bohara

" Basic settings
set number
set relativenumber
set cursorline
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set ruler
set laststatus=2
set wildmenu
set wildmode=list:longest
set backspace=indent,eol,start
set hidden
set updatetime=300
set signcolumn=yes

" Enable mouse support
set mouse=a

" File encoding
set encoding=utf-8
set fileencoding=utf-8

" Backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Split settings
set splitbelow
set splitright

" Key mappings
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Indentation settings
set smarttab
set cindent
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case

" Search settings
set gdefault
set magic

" Auto commands
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.md setlocal spell

" Terminal settings
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

echo "🌟 Neovim configuration loaded - by Arjun Bohara"
