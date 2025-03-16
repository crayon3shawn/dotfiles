#!/bin/bash

set -e  # 遇到錯誤時停止執行

# 顏色定義
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'  # No Color

# 輔助函數
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 檢查是否已安裝 stow
check_and_install_stow() {
    if ! command -v stow >/dev/null 2>&1; then
        log_info "正在安裝 stow..."
        if [[ "$(uname)" == "Darwin" ]]; then
            if ! command -v brew >/dev/null 2>&1; then
                log_error "請先安裝 Homebrew"
                exit 1
            fi
            brew install stow
        elif [[ "$(uname)" == "Linux" ]]; then
            if command -v apt-get >/dev/null 2>&1; then
                sudo apt-get update
                sudo apt-get install -y stow
            elif command -v yum >/dev/null 2>&1; then
                sudo yum install -y stow
            else
                log_error "無法安裝 stow，請手動安裝"
                exit 1
            fi
        else
            log_error "不支援的作業系統"
            exit 1
        fi
    fi
}

# 檢查並安裝 Homebrew
check_and_install_homebrew() {
    if ! command -v brew >/dev/null 2>&1; then
        log_info "正在安裝 Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

# 安裝 Brewfile 中的包
install_brew_packages() {
    if [[ -f "Brewfile" ]]; then
        log_info "正在安裝 Brewfile 中的包..."
        brew bundle install
    else
        log_warn "找不到 Brewfile，跳過安裝包"
    fi
}

# 檢查並安裝 Ghostty
check_and_install_ghostty() {
    if ! command -v ghostty >/dev/null 2>&1; then
        log_info "正在安裝 Ghostty..."
        brew install --cask ghostty
    fi
}

# 備份現有的 dotfiles
backup_dotfiles() {
    log_info "備份現有的 dotfiles..."
    local backup_dir=~/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)
    mkdir -p "$backup_dir"
    
    local files=(
        ~/.zshrc
        ~/.p10k.zsh
        ~/.zprofile
        ~/.gitconfig
        ~/.ssh/config
        ~/.hushlogin
        ~/.config/ghostty/config
    )

    for file in "${files[@]}"; do
        if [[ -f "$file" && ! -L "$file" ]]; then
            log_info "備份: $file"
            mkdir -p "$(dirname "$backup_dir/$file")"
            cp -p "$file" "$backup_dir/$file"
            rm "$file"
        elif [[ -L "$file" ]]; then
            log_warn "跳過符號連結: $file"
        fi
    done
    
    log_info "備份完成：$backup_dir"
}

# 初始化和更新 git submodules
setup_submodules() {
    log_info "初始化和更新 git submodules..."
    git submodule update --init --recursive
}

# 使用 stow 建立符號連結
create_symlinks() {
    log_info "建立符號連結..."
    local modules=(zsh git ssh shell ghostty)
    
    for module in "${modules[@]}"; do
        if [[ -d "$module" ]]; then
            log_info "安裝 $module 配置..."
            stow "$module"
        else
            log_warn "找不到 $module 目錄，跳過"
        fi
    done
}

# 主要安裝流程
main() {
    # 設定工作目錄
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
    
    log_info "開始安裝 dotfiles..."
    
    if [[ "$(uname)" == "Darwin" ]]; then
        check_and_install_homebrew
        install_brew_packages
        check_and_install_ghostty
    fi
    
    check_and_install_stow
    backup_dotfiles
    setup_submodules
    create_symlinks
    
    log_info "安裝完成！"
    log_info "請重新啟動終端機以套用新的設定"
}

main "$@" 