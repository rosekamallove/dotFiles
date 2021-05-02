# Created by newuser for 5.8
export EDITOR=vim;
export VISUAL=vim;
#bindkey -v

#Enable Colors:
autoload -U colors && colors

#Baisc auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#Aliases
alias ls="exa --icons --group-directories-first"
alias ll="exa -l --icons --group-directories-first -h"
alias lt="exa -T --icons"
alias la="exa -a -l --icons --group-directories-first"
alias rr="ranger"
alias ga="git add"
alias gcm="git commit -m"
alias aud="pavucontrol"
alias wall="nitrogen --set-zoom-fill --random ~/Downloads/gruvboxWallpaper"
alias lower="light -U"
alias incrs="light -A"
alias chef="cd ~/Documents/CodeChef/Contests"
alias contest="touch {1..6}.cpp input.txt output.txt ; vim ."

#Startup:
pfetch
eval "$(starship init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
