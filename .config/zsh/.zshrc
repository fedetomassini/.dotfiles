export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fwalch"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/home/fedetomassini/.spicetify

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
[ -s "/home/fedetomassini/.bun/_bun" ] && source "/home/fedetomassini/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
