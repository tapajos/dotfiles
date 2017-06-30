alias f="cd $HOME/projects/FreeAgent"

DEVKIT_RUBY="2.3.4"
alias devkit="chruby-exec $DEVKIT_RUBY -- $HOME/.gem/ruby/$DEVKIT_RUBY/bin/devkit"

set_fa_work() {
  if [ "$PWD" != "$MYOLDPWD" ]; then
    MYOLDPWD="$PWD";
    if [ `echo "$MYOLDPWD" | grep 'FreeAgent'` ] ; then
        if [ -z ${FREEAGENT_CACHE_STORE} ]; then
          eval "$(devkit env vars)"
        fi
    fi
  fi
}

export PROMPT_COMMAND=set_fa_work
