alias p="cd $PROJECTS_PATH"

function update_all {
  CURRENT_PATH=`pwd`
  cd $PROJECTS_PATH
  for i in $(find . -type d -name .git | xargs -n 1 dirname); do
    cd "$i"
    # pull repos without local changes
    if git diff --exit-code --quiet; then
      if git config branch.`git rev-parse --abbrev-ref HEAD`.remote > /dev/null; then
        echo -e "\033[1mPulling "$i"\033[0m"
        git pull --rebase --quiet > /dev/null
        if [ -e Gemfile ]; then
          echo -e "\033[1m'Bundling' "$i"\033[0m"
          source $HOME/dotfiles/profile/04_chruby.sh
          bundle --quiet
        fi
      fi
    fi
    git remote show | xargs git remote prune > /dev/null
    git gc --quiet > /dev/null
    cd - > /dev/null
  done
  cd $CURRENT_PATH
  unset CURRENT_PATH
}

function truncate_logs {
  for item in $(find $PROJECTS_PATH -name '*.log' -type f) ;do cat /dev/null > $item ;done
}
