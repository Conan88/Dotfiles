" ------
" PATH'S
" ------

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Set path to python3 for youcompleteme
let g:ycm_python_binary_path = '/usr/bin/python3'

" Set path to extra configs for youcompleteme
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" Setup path for ctags
let g:tagbar_ctags_bin="/usr/bin/ctags"

" ------
" /PATH'S
" ------

" -------
" PLUGINS
" -------

" Vundle
call vundle#begin()

" Vundle plugin manager
Plugin 'gmarik/Vundle.vim'

" Code folding
Plugin 'tmhedberg/SimpylFold'

" Indention for python
Plugin 'vim-scripts/indentpython.vim'

" Syntax checking
Plugin 'vim-syntastic/syntastic'

" Syntax checking for python
Plugin 'nvie/vim-flake8'

" Color scheme
Plugin 'jnurmine/Zenburn'

" Color scheme
Plugin 'altercation/vim-colors-solarized'

" Filetree
Plugin 'scrooloose/nerdtree'

" Filetree
Plugin 'jistr/vim-nerdtree-tabs'

" Powersearch
Plugin 'kien/ctrlp.vim'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Code completion
Bundle 'Valloric/YouCompleteMe'

" Code snipets
Plugin 'SirVer/ultisnips'

" Code snipets
Plugin 'honza/vim-snippets'

" Code completition C++
Plugin 'universal-ctags/ctags'

" Code structure
Plugin 'majutsushi/tagbar'

" Tmux navigation
Plugin 'christoomey/vim-tmux-navigator'

" Latex plugin
Plugin 'vim-latex/vim-latex'

" Thesaurus
Plugin 'beloglazov/vim-online-thesaurus'

" Surrond with tags, brackets, etc
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

" -------
" /PLUGINS
" -------

" ----------
" KEYMAPPING
" ----------

" Remap leaderkey
let mapleader = ","

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>

" Save and quit
inoremap <C-d> <esc>:wq!<CR>
nnoremap <C-d> :wq!<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" reformat json data
autocmd FileType json nnoremap <F2> :update<bar>%!python -m json.tool<CR> 

map <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Select next youcompleteme
let g:ycm_key_list_select_completion=['<tab>'] 

" Select prev youcompleteme
let g:ycm_key_list_previous_completion=['<S-tab>']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Toggle color schema
call togglebg#map("<F4>")

" Remove all trailing whitespace by pressing F7
nnoremap <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Tagbar shortcut
nmap<F8> :TagbarToggle<CR>

" -----------
" /KEYMAPPING
" -----------

" -----
" Color
" -----

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" ------
" /Color
" ------

" --------
" IGNORE'S
" --------

" Ignore for NERDTree python executables
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" ---------
" /IGNORE'S
" ---------

" -------
" Login's
" -------


" /Login's
" --------
" ----
" MISC
" ----

" Set pdf to standard latex compiler
"let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat='pdf'

" Set string doc to true
let g:SimpylFold_docstring_preview=1

" Close prev after completion to true
let g:ycm_autoclose_preview_window_after_completion=1

" Set encoding
set encoding=utf-8

" Detect filetype latex
au FileType tex :UltiSnipsAddFiletypes tex 

" Set python version for UltiSnips
let g:UltiSnipsUsePythonVersion = 3

" python highlighting
let python_highlight_all=1

" Syntax
syntax on

" Compatible with old vim
set nocompatible

" Enable filetype detection
filetype on

" Eliminating delay when hitting esc
set timeoutlen=1000 ttimeoutlen=0

" Set line number
set nu

" Set clipboard to default clipboard
set clipboard=unnamed

" Always display the statusline in all windows
set laststatus=2

" Always display the tabline, even if there is only one tab
set showtabline=2 

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode 

" Set tab to size 4
set tabstop=4

" Set tab to size 4
set softtabstop=4

" Autoindent next line
set autoindent

" Convert tabs to spaces
set expandtab

" Smart indent for "if" statements etc.
set smartindent

" Wrap text
set wrap

" Set dark background
set bg=dark

" ???
set is

" Set ignore casing search
set ic

" Set highlight search 
set hls

" Enable folding
set foldmethod=indent

" Set foldlevel
set foldlevel=99

" -----
" /MISC
" -----
