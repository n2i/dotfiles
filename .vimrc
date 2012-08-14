"%=============================================================================
" File Name: .vimrc
" Creation Date:
" Last Modified:  Mon 30 Jul 2012 07:33:32 PM ICT
" Creator: xuansamdinh
" Email: xuansamdinh.n2i@gmail.com
" Description:
"%=============================================================================

"==============================================================================
" {{{ => GENERAL SETTINGS
"------------------------------------------------------------------------------
set nocompatible

set nu
set nuw=4

"set cuc 	"cursorcolumn
"set cul 	"cursorline
set sc 		"showcmd
set ru 		"ruler

au WinLeave * set nocursorcolumn nocursorline
au WinEnter * set cursorline cursorcolumn

set cc=+1 		"colorcolumn
set showmatch
set showmode

set smartcase

set autoindent
set smartindent
set cindent

set autoread
set autowrite

set browsedir=current

set smarttab

set tabstop=4
set shiftwidth=4
set textwidth=78

set wrap

set ignorecase
set hlsearch
set incsearch

"set clipboard

set history=50

"set backup
"set backupdir=~/backup/vimfiles

"set patchmode=.orig

set wildignore=*.bak,*.o,*.e,*~
set wildmenu

set visualbell

set backspace=indent,eol,start

set list
"set listchars=tab:>-,eol:\$,trail:+
set listchars=tab:▸–,eol:¶,trail:❖,nbsp:¬


set mouse=a

set foldmethod=marker
"set foldlevel=99
"}}}
"==============================================================================
" => MAGIC for REGULAR EXPRESSIONS
"------------------------------------------------------------------------------
set magic

"==============================================================================
" => ENCODING & FILEENCODING
"------------------------------------------------------------------------------
"if has("multi_byte")
"    if &termencoding == ""
"        let &termencoding = &encoding
"    endif
set enc=utf-8                  " better default than latin1
setglobal fenc=utf-8           " change default file encoding when writing new files
"endif

"==============================================================================
" => COLORSCHEME
"------------------------------------------------------------------------------
colorscheme zenburn

"==============================================================================
" =>  ENABLE PATHOGEN
"------------------------------------------------------------------------------
filetype off
"call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

"==============================================================================
" {{{ => Vundle
"------------------------------------------------------------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"------------------------------------------------------------------------------
"" let Vundle manage Vundle
"" required
"------------------------------------------------------------------------------
Bundle 'gmarik/vundle'
"------------------------------------------------------------------------------
"" Bundles here:
"------------------------------------------------------------------------------
Bundle 'mileszs/ack.vim'
Bundle 'wincent/Command-T'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'sjl/gundo.vim'
"Bundle 'reinh/vim-makegreen'
Bundle 'msanders/snipmate.vim'
Bundle 'sontek/minibufexpl.vim'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'The-NERD-tree'
"Bundle 'notes'
"Bundle 'pep8'
Bundle 'fs111/pydoc.vim'
"Bundle 'mitechie/pyflakes-pathogen'
Bundle 'alfredodeza/pytest.vim'
Bundle 'orenhe/pylint.vim'
"Bundle 'sontek/rope-vim'
"Bundle 'xolox/vim-session'
"Bundle 'tpope/vim-surround'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-rails'
Bundle 'docunext/closetag.vim'
Bundle 'Kris2k/matchit'
"Bundle 'pangloss/vim-javascript'
Bundle 'TaskList.vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" }}}
"==============================================================================
" => Syntax Highlighting & Validation
"------------------------------------------------------------------------------
"filetype on
syntax on
filetype plugin indent on
let g:pyflakes_use_quickfix = 0

"==============================================================================
" => OMMI COMPLETION
"------------------------------------------------------------------------------
set ofu=syntaxcomplete#Complete
let python_highlight_all = 1
"au FileType python syn keyword pythonDecorator True None False self
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
"set completeopt-=preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"==============================================================================
" => MiniBufExplorer
"------------------------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"==============================================================================
" => TAB COMPLETION & DOC
"------------------------------------------------------------------------------
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<C-X><C-P>"
"autocmd FileType *
"    \ if &omnifunc != '' |
"    \   call SuperTabChain(&omnifunc, "<c-p>") |
"    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"    \ endif
" Completion options
"==============================================================================
" => Tasklist
"------------------------------------------------------------------------------
map <leader>td <Plug>TaskList

"==============================================================================
" => TagList
"------------------------------------------------------------------------------
"map <leader>t :TlistToggle<CR>

"==============================================================================
" => GUNDO
"------------------------------------------------------------------------------
map <leader>g :GundoToggle<CR>

"==============================================================================
" => PEP8
"------------------------------------------------------------------------------
let g:pep_map='<leader>8'


"==============================================================================
" => Pydoc preview
" Enable the menu and pydoc preview
"------------------------------------------------------------------------------
let g:pydoc_cmd = "/usr/bin/pydoc"

"==============================================================================
" => FILE BROWSER
"------------------------------------------------------------------------------
 noremap <silent> <F3> <Esc><Esc>:NERDTreeToggle<CR>
inoremap <silent> <F3> <Esc><Esc>:NERDTreeToggle<CR>

"==============================================================================
" => REFACTORING & GOTO DEFINITION
"------------------------------------------------------------------------------
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"==============================================================================
" => SEARCHING
"------------------------------------------------------------------------------
nmap <leader>a <Esc>:Ack!

"==============================================================================
" => MAP WINDOWS SPLITS
"------------------------------------------------------------------------------
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"==============================================================================
" => STATUSLINE
" file location [fileformat] [filetype] [current line number, current collum]
" [lines percent of file] [total line]
"------------------------------------------------------------------------------
set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\ [%l,%v][%p%%]\ [%L]
set laststatus=2

"==============================================================================
" => Integration with Git
"------------------------------------------------------------------------------


"==============================================================================
" => Test Integration
"------------------------------------------------------------------------------

"==============================================================================
" => DJANGO NOSE
"------------------------------------------------------------------------------
"map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>
map <Leader>] <Plug>MakeGreen " change from <Leader>t to <Leader>]

"==============================================================================
" => PY.TEST
"------------------------------------------------------------------------------
" Execute the tests
"------------------------------------------------------------------------------
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
"------------------------------------------------------------------------------
" Cycle through test errors
"------------------------------------------------------------------------------
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

"==============================================================================
" => Virtualenv
"------------------------------------------------------------------------------
" Add the virtualenv's site-packages to vim path
"------------------------------------------------------------------------------
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

"==============================================================================
" => Django
"------------------------------------------------------------------------------
"" export DJANGO_SETTINGS_MODULE=project.settings

"==============================================================================

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"==============================================================================
" => REMOVE TRAILING SPACES: Useful for Python
"------------------------------------------------------------------------------
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"==============================================================================
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
"------------------------------------------------------------------------------
function! AppendModeline()
  let l:modeline = printf(" vim: set ff=%s ft=%s fenc=%s ts=%d sw=%d tw=%d :",
          \ &ff, &ft, &fenc, &tabstop, &shiftwidth, &textwidth)
            let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
"==============================================================================
" {{{ => AUTO INSERT HEADER
"------------------------------------------------------------------------------
"autocmd BufNewFile *.tex so ~/.vim/headertemp/latex.tex
"autocmd BufNewFile *.py so ~/.vim/headertemp/python.py
"autocmd BufNewFile *.c so ~/.vim/headertemp/c.c
"autocmd BufNewFile *.sh so ~/.vim/headertemp/bash.sh
"autocmd BufNewFile *.c,*.tex,*.sh,*.py exe "1," . 8 .
"            \ "g/File Name:.*/s//File Name: " .expand("%")
"autocmd BufNewFile *.c,*.tex,*.sh,*.py exe "1," . 8 .
"            \ "g/Creation Date:.*/s//Creation Date:
"            \ " .strftime("%T %d-%m-%Y %Z")
"autocmd BufWritePre,FileWritePre *.c,*.tex,*.sh,*.py execute "normal ma"
"autocmd BufWritePre,FileWritePre *.c,*.tex,*.sh,*.py exe "1," . 8 .
"            \ "g/Last Modified:.*/s//Last Modified:
"            \ " .strftime("%a %B %d, %T %Z %Y")
"autocmd BufWritePost,FileWritePost *.c,*.tex,*.sh,*.py execute "normal `a"
"}}}
"==============================================================================
" {{{ Fast edit vimrc, saving & quit
"------------------------------------------------------------------------------
nmap <F2> :w!<cr>
"
" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>
"
" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source $HOME/.vimrc
" Open file under corsor
"nmap <F4> :tabe **/<cfile><cr>
" Ctrl - Q to quit Vim, save all buffers before and exit
nmap  <C-q>    :wqa<CR>
"}}}
"==============================================================================
" {{{ Autocomplete parenthesis, brackets and braces
"------------------------------------------------------------------------------
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
"
vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%
"
"==============================================================================
" Autocomplete quotes (visual and select mode)
"------------------------------------------------------------------------------
xnoremap  '  s''<Esc>P<Right>
xnoremap  "  s""<Esc>P<Right>
xnoremap  `  s``<Esc>P<Right>
"
"------------------------------------------------------------------------------
" }}}
"==============================================================================
" {{{ Change the working directory to the directory containing the current file
"------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif " has("autocmd")
"------------------------------------------------------------------------------
" }}}
"==============================================================================
" {{{ Taglist
"------------------------------------------------------------------------------
" taglist.vim : toggle the taglist window
" taglist.vim : define the title texts for make
" taglist.vim : define the title texts for qmake
"------------------------------------------------------------------------------
 noremap <silent> <F11>  <Esc><Esc>:TlistToggle<CR>
inoremap <silent> <F11>  <Esc><Esc>:TlistToggle<CR>

let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select         = 1

let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_qmake_settings = 'qmake;t:SystemVariables'

if has("autocmd")
  " ----------  qmake : set filetype for *.pro  ----------
  autocmd BufNewFile,BufRead *.pro  set filetype=qmake
endif " has("autocmd")
" }}}
"==============================================================================
" TagBar
"------------------------------------------------------------------------------
  noremap <silent> <F8> <Esc><Esc>:TagbarToggle<CR>
 inoremap <silent> <F8> <Esc><Esc>:TagbarToggle<CR>

"==============================================================================
" Insert current date
"------------------------------------------------------------------------------
map <leader>di <Esc><Esc>:s/$/\=' '.strftime('%c')<CR>
"map <leader>\id <Esc><Esc>:exe "." "nomarl A" strftime("%c")

"==============================================================================
" {{{ Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

"function! StripWhitespace ()
"    exec ':%s/ \+$//gc'
"endfunction
"map ,s :call StripWhitespace ()<CR>
" }}}
"==============================================================================
" => Clear last search highlighting
"------------------------------------------------------------------------------
nnoremap <Space> :nohls<CR>

" =>Insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>
"==============================================================================
" vim: set ff=unix ft=vim fenc=utf-8 ts=4 sw=4 tw=79 :
"------------------------------------------------------------------------------
