"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set hidden
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""" PLUGINS

" vim-airline (Statusline at the bottom)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Trailing whitspaces
Plugin 'bronson/vim-trailing-whitespace'

" Editorconfig
Plugin 'editorconfig/editorconfig-vim'

" Ctrlspace
Plugin 'vim-ctrlspace/vim-ctrlspace'

" NERD tree
Plugin 'scrooloose/nerdtree'

" Autocompletion
Plugin 'valloric/youcompleteme'

" Markdown syntax
Plugin 'plasticboy/vim-markdown'
Plugin 'nelstrom/vim-markdown-folding'

" Python
Plugin 'tmhedberg/simpylfold'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable line numbers
set number
highlight LineNr ctermfg=grey ctermbg=black

" Ctrlspace
if executable("ag")
	let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" Python
let g:SimpylFold_docstring_preview=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" vim-airline theme
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" ============= Invisible characters
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Set invisible characters symbols
set listchars=tab:▸\ ,eol:¬,space:·

" Highlight of invisible characters
highlight NonText ctermfg=11
highlight SpecialKey ctermfg=11

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHORTCUTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" folding with spacebar
nnoremap <space> za
