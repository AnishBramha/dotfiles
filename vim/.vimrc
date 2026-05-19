colorscheme desert
syntax on
set encoding=utf-8
set nu
set relativenumber
set incsearch
set hlsearch
set smartcase
set nocompatible
set backspace=indent,eol,start
set mouse=a
set autoread
set autowrite
set autowriteall
set undofile
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
set cindent
set shiftround
set copyindent
set preserveindent
set breakindent
set nowrap
set linebreak
set breakindent
set laststatus=2
set showtabline=2
set statusline=%f\ %y\ %m\ %r\ %=Line:%l/%L\ Col:%c
set termguicolors
set t_Co=256

"set complete=.,w,b,u,t
"set completeopt=menuone,noinsert,noselect
"set shortmess+=c
"
"
"autocmd InsertCharPre * call AutoComplete()
"
"function! AutoComplete()
"    let line = getline('.')
"    let start = col('.') - 1
"
"    if start < 3
"        return
"    endif
"
"    if pumvisible()
"        return
"    endif
"
"    call feedkeys("\<C-n>", 'n')
"endfunction


