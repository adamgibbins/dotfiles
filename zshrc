# oh-my-zsh, simplifies a load of stuff
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="mrtazz"
export CASE_SENSITIVE="false"
export DISABLE_AUTO_UPDATE="false"
export DISABLE_LS_COLORS="false"
export REPORTTIME=5

# oh-my-zsh plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH=~/bin:/var/lib/gems/1.8/bin:${PATH}

for config_file (~/.zsh/*.zsh) source $config_file
