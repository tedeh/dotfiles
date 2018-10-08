" Vundle setup
filetype off

set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/plugged')
Plug 'gmarik/vundle'
Plug 'bling/vim-airline'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'digitaltoad/vim-jade'
Plug 'cakebaker/scss-syntax.vim', {'for': ['sass']}
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/L9'
"Plug 'vim-scripts/taglist.vim'
"Plug 'StanAngeloff/php.vim'
"Plug '2072/PHP-Indenting-for-VIm'
" Plug 'shawncplus/phpcomplete.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/xml.vim', {'for': ['xml']}
Plug 'Townk/vim-autoclose'
Plug 'elzr/vim-json', {'for': ['json']}
Plug 'myusuf3/numbers.vim'
Plug 'tobyS/vip'
" Plug 'mattn/emmet-vim'
Plug 'vim-scripts/svg.vim', {'for': ['svg']}
Plug 'valloric/MatchTagAlways'
Plug 'othree/html5.vim'
"Plug 'kchmck/vim-coffee-script'
Plug 'nono/vim-handlebars'
Plug 'tomtom/tcomment_vim'
Plug 'iloginow/vim-stylus', {'for': ['stylus']}
Plug 'chase/vim-ansible-yaml'
Plug 'fatih/vim-go', {'for': ['go']}
Plug 'leafgarland/typescript-vim'
"Plug 'rking/ag.vim'
Plug 'lepture/vim-jinja'
Plug 'mxw/vim-jsx', {'for': ['javascript.jsx']}
Plug 'junegunn/fzf.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" Vundle bundle
" Bundle 'gmarik/vundle'
" Bundle 'bling/vim-airline'
" Bundle 'tpope/vim-markdown'
" Bundle 'tpope/vim-surround'
" Bundle 'digitaltoad/vim-jade'
" Bundle 'cakebaker/scss-syntax.vim'
" Bundle 'vim-scripts/FuzzyFinder'
" Bundle 'vim-scripts/L9'
" "Bundle 'vim-scripts/taglist.vim'
" "Bundle 'StanAngeloff/php.vim'
" "Bundle '2072/PHP-Indenting-for-VIm'
" " Bundle 'shawncplus/phpcomplete.vim'
" Bundle 'pangloss/vim-javascript'
" Bundle 'othree/xml.vim'
" Bundle 'Townk/vim-autoclose'
" Bundle 'elzr/vim-json'
" Bundle 'myusuf3/numbers.vim'
" Bundle 'tobyS/vip'
" " Bundle 'mattn/emmet-vim'
" Bundle 'vim-scripts/svg.vim'
" Bundle 'valloric/MatchTagAlways'
" Bundle 'othree/html5.vim'
" "Bundle 'kchmck/vim-coffee-script'
" Bundle 'nono/vim-handlebars'
" Bundle 'tomtom/tcomment_vim'
" Bundle 'iloginow/vim-stylus'
" Bundle 'chase/vim-ansible-yaml'
" Bundle 'fatih/vim-go'
" Bundle 'leafgarland/typescript-vim'
" "Bundle 'rking/ag.vim'
" Bundle 'lepture/vim-jinja'
" Bundle 'mxw/vim-jsx'
" Bundle 'junegunn/fzf.vim'
" Bundle 'prabirshrestha/async.vim'
" Bundle 'prabirshrestha/vim-lsp'

filetype plugin on
filetype indent on

" Syntax highlighting
syntax enable

" fzf
" map <C-f> :Files<CR>

" paste mode
map <C-p> :set invpaste paste?<CR>

" fuzzyfinder
map <C-g> :FufRenewCache<CR>:FufFile<CR>

" Switch pane with Ctrl + h/j/k/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch tab with Ctrl + left/right
map <C-Left> :tabp<CR>
map <C-Right> :tabn<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

set nocompatible
set term=xterm-256color
set softtabstop=2
set tabpagemax=40
set tabstop=2
set shiftwidth=2
set expandtab
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
set relativenumber " 2017-08-14 ??? -> Will be back to this when it WORKS

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let c_no_comment_fold = 1
let g:javascript_plugin_jsdoc = 1

" disable quote concealing for elzr/vim-json
let g:vim_json_syntax_conceal = 0

let g:deoplete#enable_at_startup = 1

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/Users/tedeh/.config/yarn/global/node_modules/.bin/javascript-typescript-stdio'],
    \ }

" fatih/vim-go settings
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_version_warning = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 0
let g:go_highlight_methods = 1
let g:go_highlight_structs = 0
let g:jsx_ext_required = 1
" let g:fzf_layout = { 'up': '~40%' }
" let g:user_emmet_install_global = 0
" au FileType html,css EmmetInstall
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Autocmds for specific files
autocmd BufRead,BufNewFile Capfile set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufRead,BufNewFile Dockerfile set filetype=conf
autocmd BufRead,BufNewFile .babelrc set filetype=json
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile *.plist set filetype=xml
autocmd BufRead,BufNewFile * set foldmethod=manual
autocmd BufRead,BufNewFile *.go set filetype=go
autocmd BufRead,BufNewFile *.go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd BufRead,BufNewFile *.jack set filetype=c
"autocmd BufRead,BufNewFile *.js set foldmethod=syntax
"autocmd BufWritePost,BufLeave,WinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

" for hex editing of .bin files
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" Prevent delay when exiting insert mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Use tabs for indentation when editing Makefiles and Gofiles
autocmd FileType make setlocal noexpandtab
autocmd FileType go setlocal noexpandtab
" autocmd FileType html setlocal cursorcolumn
