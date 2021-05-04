let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/Competitve/CF/Contests/719-3
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd .
edit 1.cpp
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 94 + 62) / 125)
exe '2resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 2resize ' . ((&columns * 30 + 62) / 125)
exe '3resize ' . ((&lines * 30 + 32) / 65)
exe 'vert 3resize ' . ((&columns * 30 + 62) / 125)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/Documents/Competitve/CF/Contests/719-3
wincmd w
argglobal
if bufexists("~/Documents/Competitve/CF/Contests/719-3/output.txt") | buffer ~/Documents/Competitve/CF/Contests/719-3/output.txt | else | edit ~/Documents/Competitve/CF/Contests/719-3/output.txt | endif
balt ~/Documents/Competitve/CF/Contests/719-3/input.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/Documents/Competitve/CF/Contests/719-3
wincmd w
argglobal
if bufexists("~/Documents/Competitve/CF/Contests/719-3/input.txt") | buffer ~/Documents/Competitve/CF/Contests/719-3/input.txt | else | edit ~/Documents/Competitve/CF/Contests/719-3/input.txt | endif
balt ~/Documents/Competitve/CF/Contests/719-3/1.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/Documents/Competitve/CF/Contests/719-3
wincmd w
exe 'vert 1resize ' . ((&columns * 94 + 62) / 125)
exe '2resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 2resize ' . ((&columns * 30 + 62) / 125)
exe '3resize ' . ((&lines * 30 + 32) / 65)
exe 'vert 3resize ' . ((&columns * 30 + 62) / 125)
tabnext 1
badd +1 ~/Documents/Competitve/CF/Contests/719-3/1.cpp
badd +1 ~/Documents/Competitve/CF/Contests/719-3/input.txt
badd +0 ~/Documents/Competitve/CF/Contests/719-3/output.txt
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOSA
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
