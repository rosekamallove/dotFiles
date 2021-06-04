au FocusGained,BufEnter * :checktime
set relativenumber
set clipboard=unnamedplus
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

" Searching:
set ignorecase " Ignore case
set smartcase  " Don't ignore case if uppercase letter present

"BetterLineWrapping:
set nowrap
set linebreak
set textwidth=0
set wrapmargin=0
"set nohlsearch 

"""""""""""""""""""""""""""""""""""""
"KeyBindingsForResizingSplits:
"""""""""""""""""""""""""""""""""""""
nnoremap <C-Up> :resize +2<CR> 
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize +2<CR>
nnoremap <C-Right> :vertical resize -2<CR>


"TabToNextBuffer:
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>


"BetterTabbing:
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""
"KeyMaps:
""""""""""""""""""""""""""""""""""""""
:imap kj <Esc>
noremap ter :bot terminal<CR>
noremap splr :botright vert split<CR>
noremap spl :split<CR>
noremap sv	:w<CR>

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
noremap cpp :0r ~/.vim/templates/basic.cpp<CR>
noremap ccpp :0r ~/.vim/templates/code.cpp<CR>

noremap runc :!g++  -std=c++17 %  ; ./a.out<CR>
noremap runt :!g++  -std=c++17 % -o .Z.out ; ./.Z.out < .zin.txt > .zot.txt; diff .zex.txt .zot.txt > .zdf.txt<CR><CR>

set autoread "Auto reloads the output file or any file that is changed while running in vim
au CursorHold * checktime

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ColorScheme:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ayu:
set termguicolors     
set background=dark
colorscheme everforest
let g:everforest_background = 'hard'

"IndentLines:
let g:indentLine_first_char = '|'
let g:indentLine_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VimPluginsUsingPlug:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'skammer/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'wakatime/vim-wakatime'
Plug 'ervandew/supertab'
Plug 'djoshea/vim-autoread'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim',   {'branc':'release'}
Plug 'kevinhwang91/rnvimr', {'do' : 'make sync'}
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gko/vim-coloresque'
"ColorSchemes:
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'wojciechkepka/vim-github-dark'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'rakr/vim-one'
Plug 'octol//vim-cpp-enhanced-highlight'
Plug 'shinchu/lightline-gruvbox.vim'
"LighlineStyling:
Plug 'sainnhe/artify.vim'
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"COCConfig:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-python',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-json',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-clangd',
			\ ]

autocmd FileType cpp let b:coc_pairs_disabled = ["<"]

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=120 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix |


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CTRLPConfig:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NerdTree:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
			\ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

nnoremap <space>e :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FZFConfig:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space>f :Files<CR>

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"LightlineConfig:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
let g:lightline = {'colorscheme':'everforest'}

"Hides stuff in split mode.
function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif

    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction
