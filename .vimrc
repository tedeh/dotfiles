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
autocmd BufEnter capfile set filetype=ruby
autocmd BufEnter *.scss set filetype=css
set incsearch
set hlsearch
set foldlevelstart=99
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
hi CursorColumn cterm=NONE ctermbg=38
hi CursorLine cterm=NONE ctermbg=38
