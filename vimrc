scriptencoding utf-8
set encoding=utf-8

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

" LaTex
Plugin 'lervag/vimtex'
Plugin 'matze/vim-tex-fold'

" Python
Plugin 'tmhedberg/simpylfold'

" Syntax checking
Plugin 'vim-syntastic/syntastic'

" Extended % matching
Plugin 'matchit.zip'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrlspace
if executable("ag")
	let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" Python
let g:SimpylFold_docstring_preview=1
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" Auto-completion
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Disable vimtex callback warning
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Vimtex-youcompleteme autocompletion
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Word line wrapping
set wrap lbr

" 5 lines of content
set so=5

" No delay on escape key
set timeoutlen=1000 ttimeoutlen=0

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
nmap <leader>h :set list!<CR>

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

" Toggle nerd-tree
map <C-n> :NERDTreeToggle<CR>
