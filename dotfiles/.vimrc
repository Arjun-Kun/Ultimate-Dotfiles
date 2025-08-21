" by Arjun Bohara

" Basic settings
set number
set relativenumber
set syntax=on
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

" Colorscheme
colorscheme desert
set background=dark

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

" Status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" Auto commands
autocmd BufWritePre * :%s/\s\+$//e

echo "✨ Vim configuration loaded - by Arjun Bohara"
