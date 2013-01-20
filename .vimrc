set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor
set autoindent		" always set autoindenting on
" set linebreak		" Don't wrap words by default
set textwidth=0		" Don't wrap lines by default
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=1000		" keep 1000 lines of command line history
set ruler		" show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


set gfn=Ubuntu\ Mono\ 14

" set smaller font for the laptop screen
" if has("gui_macvim")
"     source .vim/script/autores.vim
" endif

" colors torte
if has("gui_running")
    colors MyTorte
else
    colors desert
endif
" colors desert
" highlight Normal guifg=White guibg=Black "does not work, don't know why

" set encoding=UTF-8
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866


" Keep buffers around instead of discarding them
set hidden

syntax on
filetype on
filetype indent on
filetype plugin on

set expandtab
" set tabstop=2 shiftwidth=2 softtabstop=2
set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent
set wildmenu
set wildmode=longest,list

runtime! macros/matchit.vim

set completeopt+=longest
set incsearch
set ignorecase smartcase

source $VIMRUNTIME/mswin.vim

set guioptions-=T
set noswapfile
set selection=exclusive "behave like CUA GUI

set virtualedit=all     "ignore line endings, useful for block mode selections

" from http://bitbucket.org/max/rcfiles/src/tip/.vim/.vimrc
set backupdir=~/.vim/.backupdir/
set backup
set laststatus=2    " always show status line
set listchars=tab:>-,trail:-,eol:$
" set tildeop?
set nrformats=hex   " ignore octal
" stopped @ 26

set diffopt+=iwhite " ignore whitespaces for diffs

autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType python set omnifunc=pysmell#Complete
autocmd FileType python set textwidth=90 tabstop=4 shiftwidth=4 softtabstop=4" PEP-8
autocmd FileType html,js,mako,htmldjango set textwidth=0 tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType ruby set textwidth=90 tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType lex set textwidth=255 tabstop=4 shiftwidth=4 softtabstop=4

" backward-kill-world a-la Emacs
imap <A-BS> <Esc>bdwa

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on


" Configure ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir': 'env|node_modules',
    \ 'file': '\.pyc$',
    \ }

if has('gui_running')
    nmap b :CtrlPBuffer<CR>
else
    let g:loaded_ctrlp = 1
endif

" Wraps visual selection in an HTML tag
vmap ,w <ESC>:call VisualHTMLTagWrap()<CR>
function! VisualHTMLTagWrap()
  let a:tag = input( "Tag to wrap block: ")
  let a:jumpright = 2 + len( a:tag )
  normal `>
  exe "normal i</".a:tag.">"
  normal `<
  exe "normal i<".a:tag.">" 
endfunction

map <D-[> :bprevious<CR>
map <D-]> :bnext<CR>
map <D-w> :bdelete<CR>

cmap <M-BS> <C-W>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

set grepprg=ack\ --column
set grepformat=%f:%l:%c:%m
let g:fuzzy_ignore = "*.pyc, py/**, *.class, target/**"

let mapleader = ","

map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>

function! ToggleScratch()
    if expand('%') == g:ScratchBufferName
        quit
    else
        Sscratch
    endif
endfunction
map <leader>s :call ToggleScratch()<CR>

let ropevim_vim_completion=1

" source ~/Projects/vimscripts/gotofile.vim
