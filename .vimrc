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
set updatetime=50
set timeoutlen=300
set clipboard=unnamedplus
set encoding=utf-8
set wildmenu
set noshowmode

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
nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprevious<CR>

"BetterTabbing:
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""
"KeyMaps:
""""""""""""""""""""""""""""""""""""""
:imap kj <Esc>
noremap ter  :bot terminal<CR>
noremap splr :botright vert split<CR>
noremap spl  :split<CR>
noremap sv	 :w<CR>

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
"noremap ccpp :call cppTemplate

"function! cppTemplate()
" if BufRead,BufNewFile *.cpp
"	|:0r ~/.vim/templates/code.cpp<CR>
"	|/solve
"	|<CR>
"	|:noh
"	|o
"endfunction

noremap runc :!clear ; g++ -std=c++17 %  ; ./a.out ; echo "\n<=== Deb: ===>"; cat .deb.txt<CR>
noremap runt :!clear && g++  -std=c++17 % -o .Z.out ; ./.Z.out < .zin.txt > .zot.txt; diff .zex.txt .zot.txt > .zdf.txt<CR><CR>

set autoread "Auto reloads the output file or any file that is changed while running in vim
au CursorHold * checktime

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ColorScheme:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {'colorscheme':'solarized'}
set background=dark

"Everforest:
"set termguicolors     
"colorscheme everforest
"let g:lightline = {'colorscheme':'everforest'}
"let g:everforest_background = 'hard'

"Solarized:
colorscheme solarized
set t_Co=16
let g:solarized_termcolors=16


"IndentLines:
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VimPluginsUsingPlug:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

			"WebDev:
			Plug 'gko/vim-coloresque'
			Plug 'airblade/vim-gitgutter'

			"LooksAndFeel:
			Plug 'ryanoasis/vim-devicons'
			Plug 'dense-analysis/ale'
			Plug 'airblade/vim-rooter'

			"NERDTree:
			Plug 'preservim/nerdtree'
			Plug 'jistr/vim-nerdtree-tabs'

			"Coc:
			Plug 'neoclide/coc.nvim',   {'branc':'release'}

			"LightLine:
			Plug 'itchyny/lightline.vim'

			"Productivity:
			Plug 'ctrlpvim/ctrlp.vim'
			Plug 'djoshea/vim-autoread'
			Plug 'Yggdroot/indentLine'
			Plug 'ervandew/supertab'
			Plug 'jiangmiao/auto-pairs'
			Plug 'wakatime/vim-wakatime'

			"SyntaxAndColorSchemes:
			Plug 'ayu-theme/ayu-vim'
			Plug 'joshdick/onedark.vim'
			Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
			Plug 'wojciechkepka/vim-github-dark'
			Plug 'sainnhe/sonokai'
			Plug 'sainnhe/everforest'
			Plug 'sainnhe/gruvbox-material'
			Plug 'altercation/vim-colors-solarized'
			Plug 'rakr/vim-one'
			Plug 'octol/vim-cpp-enhanced-highlight'
			Plug 'shinchu/lightline-gruvbox.vim'
			Plug 'sheerun/vim-polyglot'

			"CustomOperators:
			Plug 'tpope/vim-surround'
			Plug 'tpope/vim-repeat'
			Plug 'christoomey/vim-system-copy'

call plug#end()

" Automatically install missing plugins on startup
autocmd VImEnter *
			\ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
			\|   PlugInstall --sync | q
			\|endif
" AutoCloses the install screen
let g:autoclose_on=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"AleConfig:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

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
			\ 'coc-emmet'
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
let g:nerdtree_tabs_open_on_console_startup = 2

"nnoremap <space>e :NERDTreeFind<CR>
map <space>e <plug>NERDTreeTabsToggle<CR>


