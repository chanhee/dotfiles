alias sublime='open -a "Sublime Text"'
alias ls='ls -alvGF'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
source $(brew --prefix)/etc/bash_completion.d/brew_bash_completion.sh
# define colors
c_black=`tput setaf 0`
c_red=`tput bold;tput setaf 1`
c_green=`tput bold;tput setaf 2`
c_yellow=`tput bold;tput setaf 3`
c_blue=`tput bold;tput setaf 4`
c_pink=`tput bold;tput setaf 5`
c_cyan=`tput bold;tput setaf 6`
c_sgr0=`tput sgr0`
 
show_repository()
{
  echo -e "$(VCPROMPT_FORMAT=($(tput bold;tput setaf 3)%P$(tput sgr0)@$(tput bold;tput setaf 6)%b$(tput setaf 5)%u$(tput bold;tput setaf 1)%a$(tput bold;tput setaf 2)%m$(tput sgr0)) vcprompt)"
}

PS1='\[${c_green}\]\w\[${c_sgr0}\] $(show_repository)\n\[${c_yellow}\]\$\[${c_sgr0}\] '

# show_repository ()
# {
# 	echo -e "$(VCPROMPT_FORMAT=($(tput setaf 5)%s$(tput sgr0):$(tput sgr0)@$(tput setaf 2)%b$(tput sgr0)) vcprompt)"
# }
# export PS1='\u@\h\w $(show_repository)\n\$'
export CLICOLOR=1
export LSCOLORS=CxFxBxDxGxegedabagacad