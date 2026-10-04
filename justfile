# Apply dotfiles
default:
    chezmoi init --source=. --apply

# Show pending changes
diff:
    chezmoi diff --source=.

# Upgrade everything
upgrade:
    brew update && \
    brew bundle --global && \
    brew upgrade
    mise upgrade
    zsh -c 'source ~/.local/share/antidote/antidote.zsh && antidote update'
    ~/.local/share/tmux/plugins/tpm/bin/update_plugins all
    nvim --headless '+Lazy! sync' +qa
#   chezmoi apply --source=. --refresh-externals
#   -brew bundle cleanup --global
