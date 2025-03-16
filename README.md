# Dotfiles

我的個人 dotfiles 配置，使用 GNU Stow 管理。這個倉庫包含了我的開發環境配置文件，可以快速在新的機器上設置相同的環境。

## 包含的配置

- **Zsh**
  - `.zshrc` - Zsh 主要配置
  - `.zprofile` - 登入 shell 的配置
  - `.p10k.zsh` - Powerlevel10k 主題配置
  - Powerlevel10k 主題（作為 git submodule）

- **Git**
  - `.gitconfig` - Git 全局配置

- **SSH**
  - `config` - SSH 配置（不含私鑰）

- **Shell**
  - `.hushlogin` - 關閉登入訊息

## 安裝

### 前置需求

- Git
- GNU Stow（如果沒有安裝，安裝腳本會自動安裝）

### 快速安裝

```bash
git clone https://github.com/crayon3shawn/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### 手動安裝

如果您想手動控制安裝過程：

```bash
# 克隆倉庫
git clone https://github.com/crayon3shawn/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 初始化和更新 git submodules（例如 powerlevel10k）
git submodule update --init --recursive

# 使用 stow 建立符號連結
stow zsh    # 安裝 Zsh 配置
stow git    # 安裝 Git 配置
stow ssh    # 安裝 SSH 配置
stow shell  # 安裝其他 shell 配置
```

## 目錄結構

```
.
├── .gitignore          # Git 忽略規則
├── README.md           # 本文件
├── install.sh          # 安裝腳本
├── zsh/                # Zsh 相關配置
│   ├── .zshrc
│   ├── .zprofile
│   ├── .p10k.zsh
│   └── powerlevel10k/  # Powerlevel10k 主題（submodule）
├── git/                # Git 配置
│   └── .gitconfig
├── ssh/                # SSH 配置
│   └── config
└── shell/             # 其他 shell 相關設定
    └── .hushlogin
```

## 更新

要更新 dotfiles：

```bash
cd ~/dotfiles
git pull
git submodule update --remote  # 更新 submodules
```

## 注意事項

- 安裝腳本會自動備份現有的 dotfiles 到 `~/.dotfiles_backup`
- 敏感資訊（如 SSH 私鑰、API 金鑰等）不會被包含在此倉庫中
- 如果您想要自定義配置，建議先 fork 此倉庫

## 授權

MIT License 