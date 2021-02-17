set nocompatible              " be iMproved, required
filetype plugin indent on    " required
syntax on
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
set thesaurus+=~/.vim/spell/thesaurus.txt
set backupdir=/tmp
set showcmd
" set path+=**
set wildmenu

" Tweaks
" ----------
set hlsearch
set number
" set cursorline
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
" ----------

" tagbar
" ----------
nmap <F8> :TagbarToggle<CR>

" Nvim-R
" ----------
"  Knit Output
if $DISPLAY != ""
    let R_openpdf = 1
endif

nmap <LocalLeader>11 <Plug>RSendFile
" ----------

" Omnicomplete
" ----------
set omnifunc=syntaxcomplete#Complete
autocmd FileType python3 set omnifunc=pythoncomplete#Complete
" ----------

" KEYBINDINGS
" ----------
" Toggle relative line number
set relativenumber
nmap <C-L><C-L> :set invrelativenumber<CR>
nnoremap ; :

" ----------

" Syntastic Recommended Settings
" ----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ----------

" Vimtex Settings
" ----------
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
" ----------

" Vundle
" ----------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'arcticicestudio/nord-vim'
" language specific
Plugin 'lervag/vimtex'
Plugin 'jalvesaq/Nvim-R'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" ----------

" Appearance
" ----------
" let base16colorspace=256  " Access colors present in 256 colorspace
" set termguicolors
" set t_Co=256
" set background=dark
" colorscheme base16-nord
colorscheme nord
set cursorline
highlight CursorLineNR ctermfg=blue cterm=bold
highlight LineNr ctermfg=grey cterm=bold
" ----------

" Airline
" ----------
" let g:airline_theme='minimalist'
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'c'  : 'C',
            \ 'i'  : 'I',
            \ 'ic' : 'I',
            \ 'ix' : 'I',
            \ 'n'  : 'N',
            \ 'ni' : 'N',
            \ 'no' : 'N',
            \ 'R'  : 'R',
            \ 'Rv' : 'R',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ 't'  : 'T',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ }
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.spell = 'S'
let g:airline#extensions#wordcount#formatter#default#fmt = '%s W'
" ----------

" netrw
" ----------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
"" Load netrw at start
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
" ----------
