export TEXT_EDITOR="atom"
export PROJECTS_PATH="$HOME/projects"
export EDITOR="$TEXT_EDITOR -w"
export GIT_EDITOR=$EDITOR
export HISTCONTROL=ignoredups
export LANG=pt_BR.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/mysql55/5.5.49/bin:$PATH
export PATH=$PATH:$HOME/dotfiles/bin

COLOR1="\[\033[0;36m\]"
COLOR2="\[\033[0;32m\]"
COLOR3="\[\033[0;36m\]"
COLOR4="\[\033[0;39m\]"

if [ "$UID" = "0" ]; then
  COLOR2="\[\033[1;31m\]"
fi

PS1="$COLOR2($COLOR3\u$COLOR2:$COLOR1\W$COLOR2\$(__git_ps1))$COLOR1\\$ $COLOR4$EOP"
export PS1=$PS1
