# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load powerlevel10k theme
source ~/.dotfiles/shell/zsh/powerlevel10k/powerlevel10k.zsh-theme

# Load custom aliases and functions
source ~/.dotfiles/shell/zsh/alias.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.dotfiles/shell/zsh/.p10k.zsh ]] || source ~/.dotfiles/shell/zsh/.p10k.zsh

# Docker CLI completions
fpath=(/Users/chengche/.docker/completions $fpath)
autoload -Uz compinit
compinit

# Path configurations
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Load environment variables from .env file
[[ -f ~/.config/cursor/.env ]] && source ~/.config/cursor/.env

# fnm
eval "$(fnm env --use-on-cd)"
