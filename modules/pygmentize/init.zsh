pmodload 'environment'

# Syntax highlighting for cat
if is-defined "pygmentize"; then
    # Warning: Do not alias `cat` itself or you will be getting token errors (try with ^C)
    alias ccat="pygmentize -g"
    alias -g '§P'='2>&1| pygmentize -l'
    # if pygmentize fails for utf-8, use "-O encoding=UTF-8"
else
    echo "Pygmentize not found on your system, installing ..."
    echo "> pip install Pygments"
    pip install Pygments
fi
