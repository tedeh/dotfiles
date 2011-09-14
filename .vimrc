filetype on
syntax enable
map <F2> :NERDTreeToggle<CR>
map <F3> :tabp<CR>
map <F4> :tabn<CR>
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
autocmd WinLeave * set nocursorline nocursorcolumn
autocmd WinEnter * set cursorline cursorcolumn
autocmd BufRead,BufNewFile capfile set filetype=ruby
autocmd BufRead,BufNewFile *.scss set filetype=scss
