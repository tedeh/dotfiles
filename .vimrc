filetype on
syntax enable

" Bindings for the F-buttons
map <F3> :FufFile<CR>
map <F4> :FufRenewCache<CR>
map <F5> :tabp<CR>
map <F6> :tabn<CR>

" Switch pane with Ctrl + h/j/k/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set term=xterm-256color
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set autoindent
set number
set incsearch
set hlsearch
set ignorecase
set smartcase
set foldlevelstart=99
set noshowmatch
set showmode
set scrolloff=4
set t_Co=256

" Highlight the 80:th column
" set colorcolumn=80

" Autocmds for specific file types
autocmd BufRead,BufNewFile capfile set filetype=ruby
autocmd BufRead,BufNewFile Capfile set filetype=ruby
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile * set foldmethod=manual
" Use tabs for indentation when editing Makefiles
autocmd FileType make setlocal noexpandtab
