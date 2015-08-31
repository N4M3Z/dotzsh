##
#  @file
#
#  @brief
#      Integrates StackExchange/blackbox.
#
#  @author
#      Martin Zeman <https://github.com/N4M3Z>
#

pmodload 'environment'

# Determine if command exists
if (( $+commands[pygmentize] ))
then
    # Warning: Do not alias `cat` itself or you will be getting token errors (try with ^C)
    alias ccat="pygmentize -g"
    alias -g '§P'='2>&1| pygmentize -l'
    # if pygmentize fails for utf-8, use "-O encoding=UTF-8"
else
    echo "Pygmentize not found on your system, please install it, e.g.:"
    echo "> pip install Pygments"
fi
