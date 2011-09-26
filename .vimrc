filetype on
syntax enable
map <F3> :FufFile<CR>
map <F4> :NERDTreeTabsToggle<CR>
map <F5> :tabp<CR>
map <F6> :tabn<CR>
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
set foldlevelstart=99
set noshowmatch
set showmode
set scrolloff=4
autocmd BufRead,BufNewFile capfile set filetype=ruby
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile * set foldmethod=manual
