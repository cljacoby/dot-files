# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/bin":$PATH
export EDITOR='/usr/local/bin/nvim'
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# setup some aliases 
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias hist="history"
alias v="/usr/local/bin/nvim"
alias vi="/usr/local/bin/nvim"
alias vim="/usr/local/bin/nvim"
alias vlc="open /Applications/VLC.app"
alias postman="open /Applications/Postman.app"
# ranger file browser
alias ranger="$HOME/clones/ranger/ranger.py"
alias rr="$HOME/clones/ranger/ranger.py"
# Exa aliases
alias e="exa -l"
alias k="exa -l"
alias kk="exa -l"

# This will run fzf in the current dir, and open the file in vim upon
# hitting enter
# alias f="fzf | xargs $EDITOR"
# This starts vim and runs ':Rg', which searches the text in each file
# of the current dir using fzf
alias f="vim -c ':Rg'"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rust cargo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh

alias wasm-pack-new="cargo generate --git https://github.com/rustwasm/wasm-pack-template"


# PROMT THEME STUFF
PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
#ZSH_THEME_GIT_PROMPT_PREFIX="("
#ZSH_THEME_GIT_PROMPT_SUFFIX=")"
#ZSH_THEME_GIT_PROMPT_DIRTY=""
#ZSH_THEME_GIT_PROMPT_CLEAN=""

#RPROMPT='$(git_prompt_status)%{$reset_color%}'

#ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
#ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} ✱"'

# I think this does something to the docker terminal line
prompt_docker_host() {
  if [[ ! -z "$DOCKER_MACHINE_NAME" ]]; then
    echo "docker machine"
    #prompt_segment red default "\xF0\x9F\x90\xB3: '$DOCKER_MACHINE_NAME'"
  elif [[ ! -z "$DOCKER_HOST" ]]; then
    echo "docker host"
    #prompt_segment red default "\xF0\x9F\x90\xB3: '$DOCKER_HOST'"
  fi
}
prompt_docker_host

# man file colored syntax
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}
# Source a script for cargo auto-completion.
# Obtained from: https://github.com/rust-lang/rustup/issues/1821
fpath+=~/.zsh/completions
autoload -U compinit && compinit

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
[ -f "/Users/chris/.ghcup/env" ] && source "/Users/chris/.ghcup/env" # ghcup-env
