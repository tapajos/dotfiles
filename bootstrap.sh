#!/bin/bash

for FILE in bash_profile pryrc tm_properties gitconfig gitconfig-decisiv irbrc gitignore_global
do
  rm -Rf "$HOME/.$FILE"
  ln -s "$(pwd)/$FILE" "$HOME/.$FILE"
  echo
done

source ~/.bash_profile
