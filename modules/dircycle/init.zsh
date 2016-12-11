##
# @file
#     dircycle/init.zsh
#
# @brief
#     Enables cycling through the directory stack using [shift + left/right]
#
# @author
#     Martin Zeman <https://github.com/N4M3Z>
#

# NO_PUSHD_MINUS syntax:
#   pushd +N: start counting from left of `dirs' output
#   pushd -N: start counting from right of `dirs' output

insert-cycledleft ()
{
	emulate -L zsh
	setopt NO_PUSHD_MINUS

	builtin pushd -q +1 &>/dev/null || true
	zle reset-prompt
}

insert-cycledright ()
{
	emulate -L zsh
	setopt NO_PUSHD_MINUS

	builtin pushd -q -0 &>/dev/null || true
	zle reset-prompt
}

##
# Key Bindings
#
source ${0:h}/bindings.zsh
