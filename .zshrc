# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 補全快捷鍵重設
bindkey ',' autosuggest-accept

# source your own bash_profile if exists
[ -f ~/.bash_profile ] && source ~/.bash_profile
# source your own zsh file if exists
[ -f ~/.zsh.sh ] && source ~/.zsh.sh
# source your own alias file if exists
[ -f ~/.alias.sh ] && source ~/.alias.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zinit
source ~/.zinit/bin/zinit.zsh
# load powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# fzf文字增強工具
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
zinit light Aloxaf/fzf-tab

# 快速目錄跳轉
zinit ice lucid wait='1'
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# 載入 OMZ 框架及部分外掛
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
export PATH="/usr/local/sbin:$PATH"
