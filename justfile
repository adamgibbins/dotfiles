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
