export EDITOR=vim;
export VISUAL=vim;
#bindkey -v

#Exports:

# Bat as a manpager
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#vim a a manpager
#export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'


#Enable Colors:
autoload -U colors && colors

#Baisc auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#Aliases

#Ls
alias ls="exa --icons --group-directories-first"
alias ll="exa -l --icons --group-directories-first -h"
alias lt="exa -T --icons"
alias la="exa -a -l --icons --group-directories-first -h"

#Ranger
alias rr="ranger"

#Git
alias ga="git add"
alias gcm="git commit -m"
alias gp="git push"
alias gs="git status"

#Controls
alias wall="nitrogen --set-zoom-fill --random ~/Wallpapers"
alias lower="light -U"
alias incrs="light -A"

#Competitve
alias chef="cd ~/Documents/Competitve/CC/Contests"
alias forces="cd ~/Documents/Competitve/CF/Contests"
alias txt="touch .zin.txt .zot.txt .zdf.txt .zex.txt"
#alias contest="cp -a ~/.vim/templates/base/. ./;
#							 ll;
#							 vim -S cp.vim"
alias vimz="vim -S .cp.vim"


#Startup:
pfetch
eval "$(starship init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
