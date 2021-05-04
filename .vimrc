au FocusGained,BufEnter * :checktime
set relativenumber
set encoding=utf-8
set number
set cursorline
set laststatus=2
set ruler
set mouse=a
set smartindent
set incsearch "search as chars are entered
set hlsearch "highligh matching searches
set path=.,,**
set conceallevel=0
set smarttab
set showtabline=2
set nowritebackup
set nobackup
set updatetime=300
set timeoutlen=500
set clipboard=unnamedplus
inoremap { {<CR>}<Esc>ko
set encoding=utf-8
set wildmenu
set t_Co=256
"highlight Comment cterm=italic gui=italic
autocmd FileType cpp let b:coc_pairs_disabled = ["<", "{"]
"let g:solarized_termcolors=256

" Searching:
set ignorecase " Ignore case
set smartcase  " Don't ignore case if uppercase letter present

"BetterLineWrapping:
set nowrap
set linebreak
set textwidth=0
set wrapmargin=0
"set nohlsearch "turn off highligh search after pressing enter

"""""""""""""""""""""""""""""""""""""
"KeyBindingsForResizingSplits:
"""""""""""""""""""""""""""""""""""""
nnoremap <C-Up> :resize +2<CR> 
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize +2<CR>
nnoremap <C-Right> :vertical resize -2<CR>

""""""""""""""""""""""""""""""""""""""
"TabToNextBuffer:
""""""""""""""""""""""""""""""""""""""
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""
"KeyMaps:
""""""""""""""""""""""""""""""""""""""
:imap kj <Esc>
noremap ter :bot terminal<CR>
noremap splr :botright vert split<CR>
noremap spl :split<CR>
noremap sv :w<CR>

"""""""""""""""""""""""""""""""""""""""
" Window Nav:
"""""""""""""""""""""""""""""""""""""""
nnoremap <C-H> <C-w>h
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
nnoremap <C-L> <C-w>l

"""""""""""""""""""""""""""""""""""""""
"CPP Snippets:
"""""""""""""""""""""""""""""""""""""""
noremap cpp :r ~/.vim/templates/basic.cpp<CR>
noremap ccpp :r ~/.vim/templates/code.cpp<CR>

noremap runc :!g++  %  ; ./a.out<CR>
noremap runt :!g++  %  ; ./a.out < input.txt > output.txt<CR><CR>
"Auto reloads the output file or any file that is changed while running in vim
set autoread
au CursorHold * checktime

"ColorTheme:
set background=dark
"colorscheme gruvbox
colorscheme atom-dark-256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VimPluginsUsingPlug:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
	Plug 'Igorjan94/codeforces.vim'
	Plug 'skammer/vim-css-color'
	Plug 'sheerun/vim-polyglot'
	Plug 'dense-analysis/ale'
  Plug 'Yggdroot/indentLine'
	Plug 'wakatime/vim-wakatime'
	Plug 'ervandew/supertab'
	Plug 'kien/rainbow_parentheses.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'djoshea/vim-autoread'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'airblade/vim-gitgutter'
	Plug 'neoclide/coc.nvim'
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'kevinhwang91/rnvimr', {'do' : 'make sync'}
	Plug 'joshdick/onedark.vim'
  
call plug#end()

" Automatically install missing plugins on startup
autocmd VImEnter *
	\ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\|   PlugInstall --sync | q
	\|endif
" AutoCloses the install screen
let g:autoclose_on=0




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TrailingSpaces:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CleanExtraSpaces() "Function to clean unwanted spaces
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
