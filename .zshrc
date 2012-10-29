# The following lines were added by compinstall

# End of lines configured by zsh-newuser-install

bindkey '\e[3~' delete-char # del
bindkey ';5D' backward-word # ctrl+left
bindkey ';5C' forward-word #ctrl+right
bindkey "\e[3~" delete-char
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

autoload -U compinit promptinit
compinit
promptinit;

if [[ $EUID == 0 ]]
then
PROMPT=$'%{\e[1;31m%}[%n@%m %{\e[1;31m%}%~]#%{\e[0m%} ' # user dir %
else
PROMPT=$'[%n@%m %~]$%{\e[0m%} ' # root dir #
fi
RPROMPT=$'%{\e[1;34m%}%T%{\e[0m%}' # right prompt with time

zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


export PAGER=less
export EDITOR=vim
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export MM_CHARSET=UTF-8

alias ifstat="systat -ifstat 1"
alias grep="grep --color"
alias fa='SSH_AUTH_SOCK="$(find $(ls -ldt /tmp/ssh-* | fgrep $USER | head -1 | perl -npae '"'"'$_=$F[$#F]'"'"')/ -type s | head -1)"'
alias ss="~/scripts/ssh_screen.sh"
alias ssp="~/scripts/bashsync.sh"
alias ll="ls -lahG"
alias p="ping -s 1472 -D -i .005 -c 200 "
alias s="sudo -Es"
alias dmi="dmidecode -s baseboard-manufacturer; dmidecode -s baseboard-product-name; dmidecode -s processor-version"
alias q="exit"
alias r6="route -n get -inet6 "
alias r="route -n get "
alias ina='vtysh -c "show ip route" | grep inactive '
alias log="tail -1000 -f /var/log/messages | more"
alias vi='vim'
alias certsh='openssl x509 -noout -issuer -subject -dates -serial -in'
alias isak='tail -f /var/log/messages | grep isakmpd'
alias ipdum="tcpdump -ni $1 -c100 | sed 's/^.*\([ ][0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\).*[>]\([ ][0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\).*$/\1 \2/g'"
alias genpass='tr -dc A-Za-z0-9 < /dev/urandom | head -c 16 | xargs'


#поиск в истории команд
autoload -U predict-on
zle -N predict-on
zle -N predict-off
bindkey '^X^Z' predict-on
bindkey '^Z' predict-off
#predict-on


#Сокращённый ввод имён директорий (/u/l/p вместо /user/local/ports)
autoload -U compinit
compinit
setopt autocd

#Корректировка ошибок при вводе команды
setopt CORRECT_ALL
#SPROMPT=”Вы хотели ввести %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) ”


HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS

#export CVSROOT=karyakin@tree.yandex.ru:/opt/CVSROOT

