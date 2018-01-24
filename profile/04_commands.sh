alias e="$TEXT_EDITOR"
alias ls="ls -h"
alias myip="curl whatismyip.akamai.com"

function mac {
  echo `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`
}

function change_mac {
  sudo ifconfig en0 ether `mac`
}
