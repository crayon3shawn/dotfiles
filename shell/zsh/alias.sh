# System maintenance
update() {
    echo "🔄 更新 Homebrew..."
    brew update
    brew upgrade
    echo "✅ 更新完成"
}

cleanup() {
    echo "🧹 清理 Homebrew..."
    brew cleanup
    
    if command -v conda >/dev/null 2>&1; then
        echo "🧹 清理 Conda..."
        conda clean --all --yes
    fi
    
    echo "✅ 清理完成"
}

# File operations
alias hidden="chflags hidden"

# Shell
alias reload="source ~/.zshrc"

# Homebrew
alias bundle="brew bundle dump --describe --force --file=Brewfile"

# Man pages
manpdf() {
    if [ -z "$1" ]; then
        echo "使用方式: manpdf <command>"
        return 1
    fi
    man -t "$1" | open -f -a /System/Applications/Preview.app/
} 