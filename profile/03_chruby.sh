if [ -f /usr/local/bin/brew ]; then
  if [[ -e `brew --prefix`/share/chruby ]]; then
    # Load chruby
    source `brew --prefix`/share/chruby/chruby.sh
    chruby 2.6.3
    # Automatically switch rubies
    source `brew --prefix`/share/chruby/auto.sh
  fi
fi
