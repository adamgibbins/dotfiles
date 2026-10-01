autoload -Uz compinit
# rebuild the completion dump only once a day; trust the cache otherwise
if [[ -n $ZSH_CACHE_DIR/.zcompdump(#qN.mh+24) ]]; then
  compinit -d "$ZSH_CACHE_DIR/.zcompdump"
else
  compinit -C -d "$ZSH_CACHE_DIR/.zcompdump"
fi
# compile the dump to bytecode so zsh parses it once, not every startup
if [[ -s "$ZSH_CACHE_DIR/.zcompdump" && ( ! -s "$ZSH_CACHE_DIR/.zcompdump.zwc" || "$ZSH_CACHE_DIR/.zcompdump" -nt "$ZSH_CACHE_DIR/.zcompdump.zwc" ) ]]; then
  zcompile "$ZSH_CACHE_DIR/.zcompdump"
fi
zmodload zsh/complist
