" Vundle setup
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle bundle
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'digitaltoad/vim-jade'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/taglist.vim'
Bundle 'StanAngeloff/php.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/xml.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'leshill/vim-json'
Bundle 'myusuf3/numbers.vim'
Bundle 'tobyS/vip'
Bundle 'vim-scripts/svg.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'othree/html5.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'tomtom/tcomment_vim'
Bundle 'wavded/vim-stylus'
Bundle 'chase/vim-ansible-yaml'

filetype plugin indent on

" Syntax highlighting
syntax enable

" Bindings for the F-buttons
map <F1> :FufRenewCache<CR>
map <F2> :set invpaste paste?<CR>
map <F3> :FufFile<CR>
map <F4> :FufBufferTag<CR>
map <F5> :tabp<CR>
map <F6> :tabn<CR>

" Switch pane with Ctrl + h/j/k/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set nocompatible
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
"set foldlevelstart=99
set foldnestmax=1
set noshowmatch
set noshowmode
set scrolloff=4
set backspace=2
set t_Co=256
set laststatus=2
set tags=./tags,/
" set relativenumber Will be back to this when it WORKS

let g:airline_powerline_fonts = 1
let c_no_comment_fold = 1

" Autocmds for specific files
autocmd BufRead,BufNewFile Capfile set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufRead,BufNewFile Dockerfile set filetype=conf
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile *.plist set filetype=xml
autocmd BufRead,BufNewFile * set foldmethod=manual
"autocmd BufRead,BufNewFile *.js set foldmethod=syntax
"autocmd BufWritePost,BufLeave,WinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

" Prevent delay when exiting insert mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Use tabs for indentation when editing Makefiles
autocmd FileType make setlocal noexpandtab
