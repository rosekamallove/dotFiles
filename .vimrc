source $HOME/.vim/plugConfig/coc.vim
au FocusGained,BufEnter * :checktime
set relativenumber
set encoding=utf-8
set number
set cursorline
set laststatus=2
set ruler
set smartindent
set incsearch "search as chars are entered
set hlsearch "highligh matching searches
set path=.,,**
inoremap { {<CR>}<Esc>ko

"let g:solarized_termcolors=256

" Searching:
set ignorecase " Ignore case
set smartcase  " Don't ignore case if uppercase letter present


"BetterLineWrapping:
set nowrap
set linebreak
set textwidth=0
set wrapmargin=0
set nohlsearch "turn off highligh search after pressing enter

"""""""""""""""""""""""""""""""""""""
"KeyBindingsForResizingSplits:
"""""""""""""""""""""""""""""""""""""
nnoremap <C-Up> :resize +2<CR> 
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize +2<CR>
nnoremap <C-Right> :vertical resize -2<CR>

""""""""""""""""""""""""""""""""""""""
"KeyMaps:
""""""""""""""""""""""""""""""""""""""
:imap kj <Esc>
noremap ter :botright vert terminal<CR>
noremap splr :botright vert split<CR>
noremap spl :split<CR>
noremap sv :w<CR>

"""""""""""""""""""""""""""""""""""""""
"CPP Snippets:
"""""""""""""""""""""""""""""""""""""""
noremap cpp :r ~/.vim/templates/basic.cpp<CR>
noremap bcpp :r ~/.vim/templates/code.cpp<CR>
noremap ccpp :r ~/.vim/templates/cp.cpp<CR>
noremap runc :!g++  %  ; ./a.out<CR>
noremap rnc :silent exec "!g++  %  ; ./a.out" <CR>

"""""""""""""""""""""""""""""""""""""""
"CompetitveSnippets:
"""""""""""""""""""""""""""""""""""""""
noremap bnrsrch :r ~/.vim/templates/implementations/binarySearch.cpp<CR>


"ColorTheme:
set background=dark
colorscheme gruvbox



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"VimPluginsUsingPlug:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
	Plug 'Igorjan94/codeforces.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'scrooloose/nerdtree'
	Plug 'dense-analysis/ale'
  Plug 'Yggdroot/indentLine'
  Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'wakatime/vim-wakatime'
	Plug 'bling/vim-airline'
	Plug 'ervandew/supertab'
	Plug 'kien/rainbow_parentheses.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'djoshea/vim-autoread'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'airblade/vim-gitgutter'
	Plug 'neoclide/coc.nvim'
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'kevinhwang91/rnvimr', {'do' : 'make sync'}
  Plug 'vim-airline/vim-airline-themes'
	Plug 'joshdick/onedark.vim'
  
"    Plug 'itchyny/lightline.vim'
call plug#end()
"End vim-plug manager

" Automatically install missing plugins on startup
autocmd VImEnter *
	\ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\|   PlugInstall --sync | q
	\|endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:autoclose_on=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"AirlineConfig:

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Unicode Symbols:
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Airline Symbols:
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight Comment cterm=italic gui=italic
autocmd FileType cpp let b:coc_pairs_disabled = ["<", "{"]


"NERDTreeToggle:
map <C-n> :NERDTreeToggle<CR>

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

set encoding=utf-8
set wildmenu
