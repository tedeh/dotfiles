if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug plugins
call plug#begin('~/.vim/plugged')
Plug 'HerringtonDarkholme/yats.vim'
Plug 'bling/vim-airline'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'gmarik/vundle'
Plug 'hail2u/vim-css3-syntax'
Plug 'iloginow/vim-stylus'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'leafgarland/typescript-vim'
Plug 'lepture/vim-jinja'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nono/vim-handlebars'
Plug 'othree/xml.vim'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/taglist.vim'

call plug#end()

" fzf
map <C-g> :FZF<CR>

" paste mode
map <C-p> :set invpaste paste?<CR>

" Switch pane with Ctrl + h/j/k/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch tab with Ctrl + left/right
map <C-Left> :tabp<CR>
map <C-Right> :tabn<CR>

set term=xterm-256color
set encoding=utf-8
set nocompatible
set softtabstop=2
set tabpagemax=40
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number
set relativenumber
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
set tabpagemax=100

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#searchcount#enabled = 0

let c_no_comment_fold = 1
let g:javascript_plugin_jsdoc = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
inoremap <expr> <C-n>  deoplete#manual_complete()

" disable quote concealing for elzr/vim-json
let g:vim_json_syntax_conceal = 0

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
" let g:jsx_ext_required = 0 " old plugin vim-jsx
let g:fzf_layout = { 'up': '~40%' }
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
autocmd BufRead,BufNewFile *.php set shiftwidth=2 noexpandtab
autocmd BufRead,BufNewFile *.go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd BufRead,BufNewFile *.jack set filetype=c
autocmd BufRead,BufNewFile *.html set filetype=xml
autocmd BufRead,BufNewFile *.svg set filetype=xml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.md setlocal wrap textwidth=80 wrapmargin=0 linebreak colorcolumn=80
"autocmd BufRead,BufNewFile *.js set foldmethod=syntax
"autocmd BufWritePost,BufLeave,WinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

" php extension 
let g:php_html_load = 1
let g:php_html_in_heredoc = 0
let g:php_html_in_nowdoc = 0

" for hex editing of .bin files
augroup Binary
  au!
  au BufReadPre *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" Prevent delay when exiting insert mode
if !has('gui_running')
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
