# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load powerlevel10k theme
source ~/dotfiles/zsh/powerlevel10k/powerlevel10k.zsh-theme

# Load custom aliases and functions
source ~/dotfiles/zsh/alias.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Docker CLI completions
fpath=(/Users/chengche/.docker/completions $fpath)
autoload -Uz compinit
compinit