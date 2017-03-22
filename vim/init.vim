" Initialization {{{1

set nocompatible

" General Preferences {{{1
" Plugin options {{{2

" Set up vundle...
filetype off
set rtp+=~/.vim/bundle/vundle
silent! call vundle#rc()

if exists(':Bundle')
  Bundle 'kana/vim-textobj-user'
  Bundle 'glts/vim-textobj-comment'
  Bundle 'michaeljsmith/vim-indent-object'
  Bundle 'tpope/vim-commentary'
  Bundle 'tpope/vim-repeat'
  Bundle 'junegunn/fzf'
  Bundle 'junegunn/fzf.vim' 
    " binds to fzf, note that system executable is used
  Bundle 'godlygeek/tabular'
  Bundle 'SirVer/ultisnips'
  Bundle 'honza/vim-snippets'
  Bundle 'tpope/vim-characterize'
  Bundle 'tpope/vim-eunuch'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-rsi'
  Bundle 'tpope/vim-speeddating'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-tbone'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'Shougo/context_filetype.vim'
  Bundle 'Konfekt/FastFold'
  Bundle 'airblade/vim-gitgutter'
  Bundle 'christoomey/vim-tmux-navigator'
  Bundle 'gmarik/vundle'

  " Bundle 'Valloric/YouCompleteMe'
  " Bundle 'rdnetto/YCM-Generator'
  " Bundle 'bitc/vim-hdevtools.git'
  " Bundle 'LaTeX-Box-Team/LaTeX-Box'
  " Bundle 'scrooloose/syntastic.git'
  " Bundle 'terryma/vim-multiple-cursors'
  Bundle 'tpope/vim-sensible'
  Bundle 'Twinside/vim-haskellConceal'
  Bundle 'wlangstroth/vim-haskell'
endif

filetype plugin indent on
syntax on

" Support file locations {{{2

if has('unix')
  " increases startup times
  if !isdirectory($XDG_CACHE_HOME . "/vim")
    call mkdir($XDG_CACHE_HOME . "/vim","p")
  endif
    " swap file location
  set directory=$XDG_CACHE_HOME/vim,.,~/tmp,/var/tmp,/tmp
    " viminfo location
  set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
    " persistent undo location
  set undodir=$XDG_CACHE_HOME/vim,.,~/tmp,/var/tmp,/tmp
    " dictionary for spell check
  set dictionary+=/usr/share/dict/words
endif

" set tags+="~/.vim/commontags"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" Appearance {{{2

if has('gui_running')
  silent! colorscheme wombat      " Set the colorscheme
else
  silent! colorscheme wombat
endif

if has('gui_win32')
  set guifont=courier_new:h11
endif

" Tabbing {{{2
set shiftwidth=2        " Number of spaces to use in auto(indent)
set softtabstop=2       " Just to be clear
set expandtab           " Insert tabs as spaces
set smarttab

" Searching {{{2
set wrapscan            " Wrap searches
set ignorecase          " Ignore search term case...
set smartcase           " ... unless term contains an uppercase character
set incsearch           " Highlight search...
set hlsearch            " ... as you type

" Wrapping {{{2
set textwidth=80        " Hard-wrap text at nth column
set linebreak           " Break existing lines at sane places
set wrap                " Wrap long lines

" General {{{2
set ttyfast
set ruler               " Show [line,col] number (in status bar)
set history=1000        " Number of ":" commands and searches to remember
set wildmenu            " dmenu style menu for commands
set wildmode=list:longest " complete longest word part
set fillchars=""        " Remove characters in window split
set encoding=utf-8      " Default encoding
set scrolloff=3         " 3 lines of context
set hidden              " allow fast switching of files w/o saving
set nostartofline       " dont reset to start of line for large movements
set showcmd             " show partial commands
" set mouse-=a            " disable mouse
set backspace=indent,eol,start " Allow backspacing on the given values
set undofile            " Use a persistent undo file
" set formatoptions+=a    " auto format
set formatoptions+=1    " dont auto line break after one letter word if possible
set formatoptions+=j    " all sensible joining of comments
set lazyredraw          " dont redraw screen during macro execution
set exrc                " allow project local vimrc/exrc files
set secure              " but maintain security for the above
set splitbelow
set splitright

" makes mistakes if there are numbers in a block of text and one ends up at the
" beginning of a line
" set formatoptions+=n    " format numbered lists correctly


" ignore files for tab completion and ctrlp
set wildignore+=*.o,*.pdf,*.log,*.aux

" set default commentstring
" set commentstring=#%s

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='✗'
let g:syntastic_style_warning_symbol='⚠'

" Search runtimepath in forward order to be more efficient
let g:UltiSnipsDontReverseSearchPath=0

let g:tex_flavor = "latex"

let g:ycm_autoclose_preview_window_after_completion = 0

" this option causes vim to flicker, perhaps can disable when syntastic is
" updated
" let g:ycm_allow_changing_updatetime=0
" let g:ycm_register_as_syntastic_checker=0
" let g:ycm_seed_identifiers_with_syntax

" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/global_ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = 0

" Mappings {{{1
let mapleader="-"

" Normal/Visual modes {{{2
" Movement {{{3

" navigate by display lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" make scrolling more convenient
" noremap <c-j> <c-e>
" noremap <c-k> <c-y>
noremap <Del> <C-e>
noremap <Insert> <C-y>

" make forward line searches easier to reach
noremap ; ,
noremap , ;

noremap <Tab> %

" Editing {{{3

" make Y consistent with other capital maps
nnoremap Y y$

" select last edited text
nnoremap gV `[v`]

noremap <silent> <leader><space> :noh<cr>

" File Navigation {{{3

" emulate CtrlP
nnoremap <C-p> :Files<cr>

" make tabs, windows, and buffers easier
"   only in normal mode because in visual these lose the selection
nnoremap <leader>j :bn<cr>
nnoremap <leader>k :bp<cr>

" "me" - make current workspace large
nnoremap <leader>m :resize<cr>:vertical resize<cr>
nnoremap <leader>M <C-w>=

" Leader Mappings {{{3

" use x-mode maps when mapping printible characters in visual mode
nmap     <leader>es V<leader>es
xnoremap <leader>es !sage -q \| sed '$d' \| sed '$d' \| cut -c7-<cr>
nnoremap <silent> <leader>ee cc<c-r>=pyeval(getreg("\""))<cr><esc>
xmap     <leader>ee J<leader>ee
xnoremap <leader>tt :Twrite<cr>
nnoremap <leader>tt :Twrite<cr>
nnoremap <leader>ev :exec getline('.')<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gg :Ggrep 
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>o  :RangerOpen<cr>
nnoremap <leader>r  :%s/<c-r>//
xnoremap <leader>r  :s/\%V<c-r>/\%V/
nnoremap <leader>t= :Tabularize /=
nnoremap <leader>t& :Tabularize /&

" Misc Mappings {{{3

" disable help key (especially important in gui)
map <F1> <nop>

" disable key which takes us away from buffer
map Q <nop>

nnoremap coS :SyntasticToggleMode<cr>
" todo toggle completion
" nnoremap cop :Ycm ...

" Insert Mode {{{2
inoremap jj <Esc>

" insert mode commands I care about:
" CTRL-r insert register
" CTRL-h backspace
" CTRL-w delete back word
" CTRL-v insert literal

" imap <c-u> <c-x>
" imap <c-l> <c-x><c-l>
" imap <c-]> <c-x><c-]>
" imap <c-t> <c-x><c-]>

inoremap <silent><expr> <c-p>
\ pumvisible() ? "\<C-p>" :
\ deoplete#mappings#manual_complete()

inoremap <silent><expr> <c-n>
\ pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Command mode {{{2

" sudo write
command -nargs=* -complete=file Sw SudoWrite <args>
command -nargs=* -complete=file SW SudoWrite <args>

command -bar Gc Gwrite|Gcommit -m "updates"
command Gcq Gc|q

"Alias ex commands easily capitalized
" command -nargs=* -complete=file -bang W w<bang> <args>
command -bang Q q<bang>
command -bang Bd bd<bang>
command -nargs=* -complete=file -bang Make make<bang> <args>

" Todo {{{1
" fix sagemath eval
" evaluate and map other fzf uses
" visual paren matching plugin (what was that one called again?)

" vim: fdm=marker
