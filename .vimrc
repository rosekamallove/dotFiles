set relativenumber
set number
set cursorline
set nohlsearch "turn off highligh search after pressing enter
"key bindings for resizing splits
nnoremap <C-Up> :resize +2<CR> 
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize +2<CR>
nnoremap <C-Right> :vertical resize -2<CR>
"Remap ESC to ii
:imap ii <Esc>
noremap ter :botright vert terminal<CR>
noremap splr :botright vert split<CR>
noremap bcpp :r ~/.vim/templates/basic.cpp<CR>
noremap ccpp :r ~/.vim/templates/code.cpp<CR>
noremap sv :w<CR>
colorscheme gruvbox
set background=dark

"start of vim-plug manager
call plug#begin()
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	Plug 'scrooloose/nerdtree'
        Plug 'vim-syntastic/syntastic'
        Plug 'Yggdroot/indentLine'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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
  
"    Plug 'itchyny/lightline.vim'
call plug#end()
"End vim-plug manager

" Automatically install missing plugins on startup
autocmd VImEnter *
	\ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\|   PlugInstall --sync | q
	\|endif

set encoding=utf-8
let g:autoclose_on=0
" air-line Customizations
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_gruvbox_dark_hard'

let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
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

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

highlight Comment cterm=italic gui=italic

set laststatus=2
set ruler
set smartindent
set incsearch "search as chars are entered
set hlsearch "highligh matching searches

" indent for special files
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 cindent

"Compiling CPP code
autocmd FileType cpp nnoremap     <leader>rm    :!g++ -g --std=c++11 % -o %:r<CR>
" autocmd FileType cpp nnoremap   <leader>rm    :set makeprg=g++<CR>:make % -o %:r<CR>
autocmd FileType cpp nnoremap     <leader>rr    :!./%:r<CR>
autocmd FileType cpp nnoremap     <leader>rt    :!for f in %:r.*.test; do echo "TEST: $f"; ./%:r < $f; done<CR>


" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff

" Highlight currently open buffer in NERDTree

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-vimlsp'
  \ ]


" Highlight currently open buffer in NERDTree
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Trailing spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CleanExtraSpaces() "Function to clean unwanted spaces
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun




" Searching
set ignorecase " Ignore case
set smartcase  " Don't ignore case if uppercase letter present
set incsearch  " Show next match while searching


" Maximize current split horizontally and vertically
map <C-W><Space> <C-W>_<C-W>\|
map <C-W>m <C-W>_<C-W>\|



"Better line wrapping
set nowrap
set linebreak
set textwidth=0
set wrapmargin=0

