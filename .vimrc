if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug plugins
call plug#begin('~/.vim/plugged')
Plug 'gmarik/vundle'
Plug 'bling/vim-airline'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'digitaltoad/vim-pug'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/taglist.vim'
" Plug 'StanAngeloff/php.vim'
" Plug '2072/PHP-Indenting-for-VIm'
" Plug 'shawncplus/phpcomplete.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'othree/xml.vim'
Plug 'Townk/vim-autoclose'
Plug 'elzr/vim-json'
Plug 'tobyS/vip'
" Plug 'mattn/emmet-vim'
Plug 'vim-scripts/svg.vim'
Plug 'nono/vim-handlebars'
Plug 'tomtom/tcomment_vim'
Plug 'iloginow/vim-stylus'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'rking/ag.vim'
Plug 'lepture/vim-jinja'
Plug 'othree/html5.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" normally php plugins are commented
Plug 'StanAngeloff/php.vim'
" Plug 'shawncplus/phpcomplete.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
endif

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

set encoding=utf-8
set nocompatible
set term=xterm-256color
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
autocmd BufRead,BufNewFile *.go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd BufRead,BufNewFile *.jack set filetype=c
" autocmd BufRead,BufNewFile *.md setlocal textwidth=80
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
