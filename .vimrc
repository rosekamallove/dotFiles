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
"set noshowmode
set t_Co=16
" -- Searching -----------------------------------------------
set ignorecase " Ignore case
set smartcase  " Don't ignore case if uppercase letter present
" -- BetterLineWrapping --------------------------------------
set nowrap
set linebreak
set textwidth=0
set wrapmargin=0
"set nohlsearch 

" -- VimPluginsUsingPlug -----------------------------------------
call plug#begin()

" -- WebDev ------------------
Plug 'gko/vim-coloresque'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'

" -- LooksAndFeel ------------
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-rooter'

" -- NERDTree ----------------
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" -- Coc ---------------------
Plug 'neoclide/coc.nvim',   {'branc':'release'}

" -- LightLine ---------------
"Plug 'itchyny/lightline.vim'

" -- Productivity ------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'djoshea/vim-autoread'
Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'wakatime/vim-wakatime'
"Plug 'codota/tabnine-vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'mcchrish/nnn.vim'
Plug 'voldikss/vim-floaterm'


" -- SyntaxAndColorSchemes ---- 
Plug 'sheerun/vim-polyglot'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'sainnhe/everforest'
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'

" -- CustomOperators ------------
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-system-copy'

" -- CompetitiveProgramming -----
Plug 'p00f/cphelper.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

autocmd VImEnter *
			\ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
			\|   PlugInstall --sync | q
			\|endif
let g:autoclose_on=0

" -- CPPColor ----------------------------------------------------
let g:cpp_simple_highlight = 0
let g:cpp_member_highlight = 0
let g:cpp_attributes_highlight = 0
let g:cpp_no_function_highlight = 0

" -- ColorScheme -------------------------------------------------
set termguicolors     
set background=dark
colorscheme one
let g:lightline = {'colorscheme':'one'} 
let g:everforest_background = 'soft'
nnoremap LIT :colorscheme everforest <bar> set background=light<CR>
nnoremap SO :so ~/.vimrc<CR>
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'medium'


" -- KeyBindingsForResizingSplits -----------------------------
nnoremap <C-Up> :resize +2<CR> 
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize +2<CR>
nnoremap <C-Right> :vertical resize -2<CR>

" -- TabToNextBuffer ------------------------------------------
nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprevious<CR>

" -- BetterTabbing --------------------------------------------
vnoremap < <gv
vnoremap > >gv

" -- KeyMaps --------------------------------------------------
:imap kj <Esc>
noremap ter  :bot terminal<CR>
noremap splr :botright vert split<CR>
noremap spl  :split<CR>
nnoremap sv	 :w<CR>
nnoremap FF :%!astyle<CR>

" -- Window Nav -----------------------------------------------
nnoremap <C-H> <C-w>h
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
nnoremap <C-L> <C-w>l

" -- CPP Snippets ---------------------------------------------
set autoread 
au CursorHold * checktime

noremap cpp :0r ~/.vim/templates/basic.cpp<CR>
noremap ccpp :0r ~/.vim/templates/code.cpp<CR> 

nnoremap cpb :
			\!clear;
			\cpb test %<CR>

noremap RR : 
			\	!clear; 
			\ echo "$(tput bold)Compiling... ";
			\	g++ -Wall -std=c++17 % -o .a.out; 
			\ echo "$(tput bold)Running...";
			\	./.a.out; 
			\ echo "\n";
			\ echo "Deb:";
			\	cat .deb.txt
			\<CR>

noremap RT :
			\!clear;
			\ echo "$(tput bold)Compiling... ";
			\g++  -Wall -std=c++17 % -o .Z.out;
			\./.Z.out < .zin.txt > .zot.md;
			\diff .zex.txt .zot.md > .zdf.txt<CR>



" -- IndentLines -------------------------------------------------
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0


" -- AleConfig -------------------------------------------------------------
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

" -- COCConfig -------------------------------------------------------------
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
			\ ]

autocmd FileType cpp let b:coc_pairs_disabled = ["<"]

au BufNewFile,BufRead *.js,*.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2 |
			\ set textwidth=120 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix |

au BufNewFile,BufRead *.cpp,*.py,.html
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=120 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix |

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

nmap <F2> <Plug>(coc-rename)


" -- CTRLPConfig ----------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }

" -- NerdTree ----------------------------------------------------------------
let g:nerdtree_tabs_open_on_console_startup = 2
map <space>e <plug>NERDTreeTabsToggle<CR>

"-- Save Text Folding --------------------------------------------------------
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


" -- NNN ---------------------------------------------------------------------
" Disable default mappings
let g:nnn#set_default_mappings = 0

" Start n³ in the current file's directory
nnoremap <space>n :NnnPicker %:p:h<CR>

" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

let g:nnn#action = {
			\ '<c-t>': 'tab split',
			\ '<c-x>': 'split',
			\ '<c-v>': 'vsplit' }

let g:floaterm_keymap_toggle = '<F12>'
