" prevent vim from emulating vi
set nocompatible    " enabled when (g)vimrc is found
" -- configure vundle and load plugins {
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"add all plugins here"
Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'godlygeek/tabular'
"Plugin 'takac/vim-hardtime'
Plugin 'chazmcgarvey/vimcoder'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tommcdo/vim-exchange'
"Plugin 'elzr/vim-json'

call vundle#end()
filetype plugin indent on
"}
filetype on

" easier to reach than \
let mapleader = " "
" easier to reach than Esc or Ctrl-[
inoremap jk <Esc>

set backspace=start,indent,eol  " make backspace work like 'normal' text editors

" --history
set history=500    " history of commands and searches
set undolevels=500 " changes to be remembered

" --interface appearance
syntax enable    " enable syntax highlighting and allow custom highlighting
set title        " set title to filename and modification status
set number       " show line numbers
set ruler        " always show current position
set showcmd      " show the command being typed
set showmode     " show current mode (insert, visual, etc.)
set laststatus=2 " always show status line
set nowrap

" --searching
set ignorecase " ignore case when searching
set smartcase  " case sensitive only when capital letter in expression
set hlsearch   " highlight search terms
set incsearch  " show matches as they are found

" --feedback
set showmatch   " show matching braces when text indicator is over them
set matchtime=2 " length of time for 'showmatch'

" --redrawing / warnings
set lazyredraw   " don't redraw screen when executing macros
set noerrorbells " no bell for error messages
set visualbell   " use whatever 't_vb' is set to as a bell
set t_vb=        " set to nothing (disable)

" restore 't_vb' since it is reset after the GUI starts
if has("gui_running")
    augroup disable_gui_visualbell
        autocmd!
        autocmd GUIEnter * set t_vb=
    augroup end
endif

" --command-line completion
set wildmenu       " enhanced command-line completion

" --visual theme and appearance
" preferred colorscheme
colorscheme molokai
" makes vim somewhat transparent"
"hi Normal ctermbg=none

if has("gui_running")
    " place gVim settings here (instead of in .gvimrc)
endif

" --navigation
set scrolloff=5 " scrolling starts 5 lines before window border

" easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" auto-expand path to parent of current file; for windows, (v)splits, and tabs
nnoremap <Leader>ew :edit <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>es :split <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>ev :vsplit <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>et :tabedit <C-R>=expand("%:p:h") . "/" <CR>

" window split shortcuts
nnoremap <Leader>swh :topleft vnew<CR>
nnoremap <Leader>swl :botright vnew<CR>
nnoremap <Leader>swk :topleft new<CR>
nnoremap <Leader>swj :botright new<CR>
nnoremap <Leader>sh :leftabove vnew<CR>
nnoremap <Leader>sl :rightbelow vnew<CR>
nnoremap <Leader>sk :leftabove new<CR>
nnoremap <Leader>sj :rightbelow new<CR>

" --filetype detection
filetype plugin indent on   " let vim detect filetype and load appropriate scripts
runtime macros/matchit.vim  " able to jump tag using % sign

" --character encoding
set encoding=utf-8                             " encoding used within vim
set fileencodings=ucs-bom,utf-8,default,latin1 " encodings to try when editing a file

" --buffer management
set hidden    " allow buffer to be changed without writing to disk
set autoread  " update file when externally modified

" --indenting
set fileformats=unix,dos,mac " try recognizing line endings in this order
set tabstop=4                " width of a tab character in spaces
set softtabstop=4            " defines number of spaces for when adding/removing tabs
set shiftwidth=4             " number of spaces to use for autoindent
set cindent                  " automatic indenting; see ':h C-indenting' for comparison
set expandtab                " use spaces instead of tab characters; to insert real tab, use <C-v><Tab>

" --code folding
set foldmethod=manual       "can create code folds using v{motion}zf

" --copying / pasting
" allow vim commands to copy to system clipboard (*)
" for X11:
"   + is the clipboard register (Ctrl-{c,v})
"   * is the selection register (middle click, Shift-Insert)
set clipboard=unnamed

" set paste to prevent unexpected code formatting when pasting text
" toggle paste and show current value ('pastetoggle' doesn't)
nnoremap <Leader>p :set paste! paste?<CR>
"set pastetoggle=<Leader>p

" --custom settings
" -- settings for indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

let g:ctrlp_use_caching=0

let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

let g:acp_behaviorSnipmateLength = 1 
let g:NERDChristmasTree = 1
let g:hardtime_default_on = 1

function! PrettifyXML()
	set ft=xml
	:%s/></>\r</g
	:0
	:norm =G
endfunction

nnoremap <Leader>n :NERDTreeToggle<CR>
" maps ,h to toggle highlighting after you search something
nnoremap <Leader>h :set hlsearch! hlsearch?<CR>
nnoremap <Leader>ls :ls<CR>:buffer<Space>
nnoremap <Leader>evi :e $MYVIMRC<CR>
nnoremap <F5> :source $MYVIMRC<CR>
nnoremap <Leader>a :Ack<Space>
nnoremap <c-p> :CtrlP<CR>
nnoremap <Leader>did :g/"id"/normal! V%d<CR>ggV%y
