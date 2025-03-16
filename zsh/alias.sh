#!/bin/zsh

# System maintenance
update(){
  # echo 'gs221221' | sudo -S softwareupdate -i -a;
  # mas upgrade;
  brew update; brew upgrade; #brew cu --cleanup -a -y -f;
  # conda update -n base conda --yes; conda update --all --yes;
}

cleanup(){
  brew cleanup;
  conda clean --all --yes;
}

# File operations
alias hidden="chflags hidden"

# Shell
alias reload="source ~/.zshrc"

# Homebrew
alias bundle="brew bundle dump --describe --force --file=Brewfile"

# Man pages
manpdf() {
  man -t "$1" | open -f -a /System/Applications/Preview.app/
} 