default:
  chezmoi apply --source=.

diff:
  chezmoi diff --source=.

update:
  git pull --rebase
  chezmoi apply --source=.
