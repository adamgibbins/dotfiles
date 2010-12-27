# oh-my-zsh, simplifies a load of stuff
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="mrtazz"
export CASE_SENSITIVE="false"
export DISABLE_AUTO_UPDATE="false"
export DISABLE_LS_COLORS="false"

# oh-my-zsh plugins
plugins=(git github ssh-agent)

source $ZSH/oh-my-zsh.sh
export PATH=~/bin:${PATH}

for config_file (~/.zsh/*.zsh) source $config_file
