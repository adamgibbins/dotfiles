# Apply dotfiles
default:
  chezmoi apply --source=.

# Show pending changes
diff:
  chezmoi diff --source=.

# Upgrade everything
upgrade:
  brew update && \
  brew bundle --global && \
  brew upgrade
  mise upgrade
