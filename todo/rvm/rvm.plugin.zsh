#!/bin/zsh

##
#  @file
#  @brief Node Version Manager
#
#  @author N4M3Z <https://github.com/N4M3Z>
#
#  @note From https://github.com/creationix/nvm

if [[ -s ~/.rvm/scripts/rvm ]]
then
	source ~/.rvm/scripts/rvm
	fpath=($rvm_path/scripts/zsh/Completion $fpath)
fi

function rvm.install()
{
	# Install mpapis public key (might need `gpg2` and or `sudo`)
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

	# Download the installer (\curl calls original curl command, skipping aliases)
	\curl -O https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer
	\curl -O https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer.asc

	# Verify the installer signature (might need `gpg2`), and if it validates...
	gpg --verify rvm-installer.asc

	# Run the installer
	bash rvm-installer stable

	rvm info
}

function rvm.requirements()
{
    # Install missing packages
	if [ -n "${BREWPATH}" ] ; then
		rvm autolibs homebrew
	fi

	rvm requirements
}

function rvm.update()
{
	rvm get head
}

alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'

ruby18='ruby-1.8.7'
ruby19='ruby-1.9.3'
ruby20='ruby-2.0.0'
ruby21='ruby-2.1.2'
ruby22='ruby-2.2.0'

function rb18()
{
	if [ -z "$1" ]; then
		rvm use "$ruby18"
	else
		rvm use "$ruby18@$1"
	fi
}

_rb18() { compadd `ls -1 $rvm_path/gems | grep "^$ruby18@" | sed -e "s/^$ruby18@//" | awk '{print $1}'` }
compdef _rb18 rb18

function rb19()
{
	if [ -z "$1" ]; then
		rvm use "$ruby19"
	else
		rvm use "$ruby19@$1"
	fi
}

_rb19() { compadd `ls -1 $rvm_path/gems | grep "^$ruby19@" | sed -e "s/^$ruby19@//" | awk '{print $1}'` }
compdef _rb19 rb19

function rb20()
{
	if [ -z "$1" ]; then
		rvm use "$ruby20"
	else
		rvm use "$ruby20@$1"
	fi
}

_rb20() { compadd `ls -1 $rvm_path/gems | grep "^$ruby20@" | sed -e "s/^$ruby20@//" | awk '{print $1}'` }
compdef _rb20 rb20

function rb21()
{
	if [ -z "$1" ]; then
		rvm use "$ruby21"
	else
		rvm use "$ruby21@$1"
	fi
}

_rb21() { compadd `ls -1 $rvm_path/gems | grep "^$ruby21@" | sed -e "s/^$ruby21@//" | awk '{print $1}'` }
compdef _rb21 rb21

function rb22()
{
	if [ -z "$1" ]; then
		rvm use "$ruby22"
	else
		rvm use "$ruby22@$1"
	fi
}

_rb22() { compadd `ls -1 $rvm_path/gems | grep "^$ruby22@" | sed -e "s/^$ruby22@//" | awk '{print $1}'` }
compdef _rb22 rb22

# TODO: Make this usable w/o rvm.
function gems
{
	local current_ruby=`rvm-prompt i v p`
	local current_gemset=`rvm-prompt g`

	gem list $@ | sed \
		-Ee "s/\([0-9, \.]+( .+)?\)/$fg[blue]&$reset_color/g" \
		-Ee "s|$(echo $rvm_path)|$fg[magenta]\$rvm_path$reset_color|g" \
		-Ee "s/$current_ruby@global/$fg[yellow]&$reset_color/g" \
		-Ee "s/$current_ruby$current_gemset$/$fg[green]&$reset_color/g"
}

# oh-my-zsh supports an rvm prompt by default get the name of the rvm ruby version
function rvm_prompt_info()
{
	[ -f $HOME/.rvm/bin/rvm-prompt ] || return 1
	local rvm_prompt
	rvm_prompt=$($HOME/.rvm/bin/rvm-prompt ${=ZSH_THEME_RVM_PROMPT_OPTIONS} 2>/dev/null)
	[[ "${rvm_prompt}x" == "x" ]] && return 1
	echo "${ZSH_THEME_RVM_PROMPT_PREFIX:=(}${rvm_prompt}${ZSH_THEME_RVM_PROMPT_SUFFIX:=)}"
}

# use this to enable users to see their ruby version, no matter which version management system they use
function ruby_prompt_info()
{
  echo $(rvm_prompt_info || rbenv_prompt_info || chruby_prompt_info)
}

function _rvm_completion
{
	source $rvm_path"/scripts/zsh/Completion/_rvm"
}
compdef _rvm_completion rvm
