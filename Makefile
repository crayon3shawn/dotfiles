.PHONY: help install update clean push

# 顯示幫助信息
help:
	@echo "使用方法:"
	@echo "  make install    - 執行安裝腳本"
	@echo "  make update     - 更新 Brewfile 並提交"
	@echo "  make clean      - 清理系統（Homebrew 和 Conda）"
	@echo "  make push       - 提交並推送更改"

# 執行安裝腳本
install:
	./install.sh

# 更新 Brewfile
update:
	brew bundle dump --describe --force
	git add Brewfile
	git commit -m "chore: 更新 Brewfile"
	git push

# 清理系統
clean:
	brew cleanup
	@if command -v conda >/dev/null 2>&1; then \
		echo "🧹 清理 Conda..."; \
		conda clean --all --yes; \
	fi

# 提交並推送更改
push:
	git push 