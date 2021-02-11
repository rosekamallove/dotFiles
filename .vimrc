set relativenumber
set encoding=utf-8
set number
set cursorline
set laststatus=2
set ruler
set smartindent
set incsearch "search as chars are entered
set hlsearch "highligh matching searches

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
:imap ii <Esc>
noremap ter :botright vert terminal<CR>
noremap splr :botright vert split<CR>
noremap sv :w<CR>

"""""""""""""""""""""""""""""""""""""""
"CPP Snippets:
"""""""""""""""""""""""""""""""""""""""
noremap bcpp :r ~/.vim/templates/basic.cpp<CR>
noremap runc :!g++  %  ; ./a.out<CR>

"""""""""""""""""""""""""""""""""""""""
"CompetitveSnippets:
"""""""""""""""""""""""""""""""""""""""
noremap bnrsrch :r ~/.vim/templates/implementations/binarySearch.cpp<CR>


"ColorTheme:
colorscheme gruvbox
set background=dark



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"VimPluginsUsingPlug:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	Plug 'scrooloose/nerdtree'
        Plug 'vim-syntastic/syntastic'
        Plug 'Yggdroot/indentLine'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'wakatime/vim-wakatime'
	Plug 'bling/vim-airline'
	Plug 'ervandew/supertab'
	Plug 'kien/rainbow_parentheses.vim'
	Plug 'vim-scripts/cppcomplete'
	Plug 'SirVer/ultisnips'
	Plug 'ryanoasis/vim-devicons'
	Plug 'Igorjan94/codeforces.vim'
	Plug 'sainnhe/vim-color-forest-night'
	Plug 'ayu-theme/ayu-vim'
	Plug 'jistr/vim-nerdtree-tabs'
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'severin-lemaignan/vim-minimap'
        Plug 'airblade/vim-gitgutter'
        Plug 'vim-airline/vim-airline-themes'
	Plug 'neoclide/coc.nvim', {'branch':'release'}
  
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


"IndentForspecialFiles:
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 cindent




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"COC:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-vimlsp',
  \ 'coc-pairs'
  \ ]
autocmd FileType cpp let b:coc_pairs_disabled = ["<"]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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




