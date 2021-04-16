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

let g:solarized_termcolors=256

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
	Plug 'codota/tabnine-vim'
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
    	Plug 'vim-airline/vim-airline-themes'
  
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
"let g:airline_theme = 'solarized'
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"CodeForcesParses:

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:CodeForcesCount = 40
let g:CodeForcesContestId = 710
let g:CodeForcesUpdateInterval = 1 
let g:CodeForcesCountOfSubmits = 10
let g:CodeForcesShowUnofficial = 1 


let g:CodeForcesUsername = 'rosekamallove'
let g:CodeForcesPassword = '0p9lhegi2q'

"CodeForcesRemaps:
nmap <leader>cfr <ESC>:CodeForcesSet_R_ound
nmap <leader>cfS <ESC>:CodeForces_S_ubmission<CR>
nmap <leader>cfp <ESC>:CodeForces_P_revStandings<CR>
nmap <leader>cfn <ESC>:CodeForces_N_extStandings<CR>
nmap <leader>cfs <ESC>:CodeForces_S_tandings<CR>
nmap <leader>cff <ESC>:CodeForces_F_riendsSet<CR>
nmap <leader>cfu <ESC>:CodeForces_U_nofficial<CR>
nmap <leader>cfl <ESC>:CodeForces_L_oadTask
nmap <leader>cfP <ESC>:CodeForces_P_ageStandings
nmap <leader>cfR <ESC>:CodeForces_R_oomStandings<CR>
nmap <leader>cfA <ESC>:CodeForcesP_a_rseContest<CR>
nmap <leader>cft <ESC>:CodeForces_T_est<CR>
nmap <leader>cfcl <ESC>:CodeForces_C_ontest_L_ist<CR>
nmap <leader>cfcn <ESC>:CodeForces_C_ontestList_N_ext<CR>
nmap <leader>cfcp <ESC>:CodeForces_C_ontestList_P_rev<CR>
nmap <leader>cfF <ESC>:CodeForcesLoad_F_riends<CR>

"ForSubmission:
noremap <S-F5> <ESC>:w<CR><ESC>:CodeForcesSubmit<CR>
noremap <S-F6> <ESC>:w<CR><ESC>:CodeForcesUserSubmissions<CR>



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
nnoremap // :noh<return>
