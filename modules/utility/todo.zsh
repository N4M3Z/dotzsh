## Super user
alias _='sudo'

## Global aliases
# Note: Global aliases can be evil! Using combinations that have limited number of uses is a good choice.
# A general good option is ] as it will rarely be needed without a preceding [ and you don't need to press shift to type it.
# You might also use !, ~, ^ or = as a suffix as they tend to only be special as a prefix.
alias -g ']H'='| head'
alias -g ']T'='| tail'
alias -g ']L'='| less'
alias -g ']M'='| most'
alias -g ']G'='| egrep'
alias -g ']C'='| wc -l'
alias -g ']S'='| sort -u'
alias -g ']A'='| awk'

alias -g ']TL'='| tail -20'

#alias -g LL="2>&1 | less"
#alias -g CA="2>&1 | cat -A"
#alias -g NE="2> /dev/null"
#alias -g NUL="> /dev/null 2>&1"
#alias -g P="2>&1| pygmentize -l pytb"

## Suffix aliases
autoload -U is-at-least
if is-at-least 4.2.0 ; then
    # documents
    if [[ "$OSTYPE" = darwin* ]]; then
        # OS X can call global command "open" to open files in default application
        _filetypes=(
                       htm html de org net com at cx nl se dk dk php
                       cpp cxx cc c hh h inl asc txt TXT tex
                       jpg jpeg png gif mng tiff tif xpm
                       ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm
                       pdf ps ppt pptx doc docx xls xlsx
                   )
        for filetype in $_filetypes ; do alias -s $filetype=open ; done
    else
        # open browser on urls
        _browser_fts=(
                          htm html de org net com at cx nl se dk dk php
                     )
        for ft in $_browser_fts ; do alias -s $ft=$BROWSER ; done

        # text files
        _editor_fts=(
                        cpp cxx cc c hh h inl asc txt TXT tex
                    )
        for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

        # images
        _image_fts=(
                        jpg jpeg png gif mng tiff tif xpm
                    )
        for ft in $_image_fts ; do alias -s $ft=$XIVIEWER; done

        # media files
        _media_fts=(
                       ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm
                   )
        for ft in $_media_fts ; do alias -s $ft=mplayer ; done

        # documents
        alias -s pdf=acroread
        alias -s ps=gv
        alias -s dvi=xdvi
        alias -s chm=xchm
        alias -s djvu=djview

    fi

    # For archives list contents
    alias -s zip="unzip -l"
    alias -s rar="unrar l"
    alias -s tar="tar tf"
    alias -s tar.gz="echo "
    alias -s ace="unace l"

fi

# alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# alias t='tail -f'

# alias dud='du -d 1 -h'
# alias duf='du -sh *'
# alias fd='find . -type d -name'
# alias ff='find . -type f -name'

# alias p='ps -f'
# alias sortnr='sort -n -r'
