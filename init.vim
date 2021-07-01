"" #######################################################################################
"" #### https://github.com/VundleVim/Vundle.vim
"" #######################################################################################
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" #################################################
"" ####      Chris's Vundle Plugins      ###########
"" #################################################
Plugin 'leafgarland/typescript-vim'
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'posva/vim-vue'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'sakhnik/nvim-gdb'
Plugin 'mtdl9/vim-log-highlighting'
Plugin 'hail2u/vim-css3-syntax'
"" Plugin 'posva/vim-vue'
"" Plugin 'vim-python/python-syntax'
Plugin 'racer-rust/vim-racer'
Plugin 'jparise/vim-graphql'
Plugin 'ron-rs/ron.vim'
Plugin 'keith/swift.vim'
"" Plugin 'vim-python/python-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"" #################################################
"" #### From https://github.com/SirVer/ultisnips
"" #################################################

" " Track the engine.
" Plugin 'SirVer/ultisnips'
" 
" " Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
" 
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" 
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

"" #################################################
"" ####      Chris's Vim-Plug Plugins      #########
"" #################################################
" This installs coc.vim, which I use for rust-analyzer.
" The coc plugin is not compatible with Vundle (I think); hence
" Vim-plug.
call plug#begin('~/.vim/plugged')

" coc language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" telescope and telescope dependancies
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


call plug#end()

" These commands actuate the coc.vim install, and the associated coc plugins
" (namely rust-analyzer for me) 
" :PlugInstall
" : CocInstall coc-json coc-rust-analyzer

"" #################################################
"" ####      Chris's Additions      ################
"" #################################################

"" basic global settings (I think, I don't remember why I added this block)
set backspace=indent,eol,start
filetype plugin indent on
syntax on
set number
set nocompatible
let mapleader="\\"

"" Shortcut for quick quit and write
noremap <leader>q :q!<cr>
noremap <leader>w :w<cr>

"" Shortcut for quick write. Omitting for accidental writes.
"" noremap <leader>w :w<cr>

" Commands to yank/paste to/from the default vim register and the system clipboard.
noremap <leader>y "*y
noremap <leader>P "*p
noremap <leader>Y "+y
noremap <leader>p "+p

"" Change Rust documentaion blocks from white to red
highlight Special ctermfg=9

"" Folding/Unfolding with space bar
set foldmethod=indent
set foldlevel=99
"" set foldnestmax=2
nnoremap <space> za
vnoremap <space> zf

"" Keep visual selection after block indent/unindent
:vnoremap < <gv
:vnoremap > >gv


"" Horizontal side scrolling and horizontal line goes off screen (aka nowrapping)
set nowrap
set sidescroll=1

"" Tabbing information
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

"" HTML file indent settings
autocmd Filetype html setlocal ts=2 sw=2 expandtab

"" Create the readout for line num, column num, and percentage of file
set ruler

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Set the pop-up message font color to be black; the default is hard to read
:hi CocErrorFloat guifg=black
:hi CocInfoFloat guifg=black
:hi CocWarningFloat guifg=black

" Spell-check Markdown files and Git Commit Messages
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" Break lines at 80 characters
set tw=72
set fo+=t

" Jump to line number with leader key
:nnoremap <CR> G

"" nvim Specific Changes 
"" let g:python3_host_prog = '/usr/local/opt/python/bin/python3.7'

"" Disable syntax highlighting for TODO and NOTE. I don't like it.
"" NOTE: This doesn't perfectly, but at least gets rid of the bright yellow.
:hi clear TODO
:hi clear NOTE
