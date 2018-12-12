## bashrc file

## -----------------------------------------------------------------------------
## History parameters
## -----------------------------------------------------------------------------

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

## -----------------------------------------------------------------------------
## Layout options
## -----------------------------------------------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

STYLE_OFF='00'
STYLE_BOLD='01'
COLOR_BLACK='30'
COLOR_RED='31'
COLOR_GREEN='32'
COLOR_YELLOW='33'
COLOR_BLUE='34'
COLOR_PURPLE='35'
COLOR_CYAN='36'
COLOR_WHITE='37'

STYLE_RESET='\[\e[00m\]' # No Color
STYLE_USERNAME="\[\e[${STYLE_OFF};${COLOR_GREEN}m\]"
STYLE_HOSTNAME="\[\e[${STYLE_OFF};${COLOR_GREEN}m\]"
STYLE_WORKING_DIR="\[\e[${STYLE_OFF};${COLOR_CYAN}m\]"
STYLE_ROOT="\[\e[${STYLE_OFF};${COLOR_PURPLE}m\]"
STYLE_TEXT="\[\e[${STYLE_OFF};${COLOR_WHITE}m\]"

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1="${STYLE_USERNAME}\u${STYLE_TEXT}@${STYLE_HOSTNAME}\h${STYLE_TEXT}:[${STYLE_WORKING_DIR}\w${STYLE_TEXT}]${STYLE_ROOT}\\$ ${STYLE_RESET}"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## -----------------------------------------------------------------------------
## Alias
## -----------------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## -----------------------------------------------------------------------------
## completion
## -----------------------------------------------------------------------------
# bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# git autocompletion
# to update : wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
git_autocompletion_file="${HOME}/.git-completion.bash"
if [ -f ${git_autocompletion_file} ]; then
    . ${git_autocompletion_file}
fi

## -----------------------------------------------------------------------------
## local env variable
## -----------------------------------------------------------------------------
local_env_file="${HOME}/.local_env"
if [ -f ${local_env_file} ]; then
    . ${local_env_file}
fi
