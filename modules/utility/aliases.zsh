##
#  @file
#      utility/aliases.zsh
#
#  @brief
#       Aliases for the 'utility' module
#
#  @author
#       Robby Russell <robby@planetargon.com>
#       Suraj N. Kurapati <sunaku@gmail.com>
#       Sorin Ionescu <sorin.ionescu@gmail.com>
#       Martin Zeman <martin.zeman@protonmail.ch>
#
#  @note
#       Relevant sources:
#       http://zshwiki.org/home/examples/aliasglobal
#       http://zshwiki.org/home/examples/aliasnormal
#       http://zshwiki.org/home/examples/aliassuffix
#

# Disable correction. Do not overwrite previous aliases.
alias ack="nocorrect ${aliases[ack]:-ack}"
alias cd="nocorrect ${aliases[cd]:-cd}"
alias cp="nocorrect ${aliases[cp]:-cp}"
alias ebuild="nocorrect ${aliases[ebuild]:-ebuild}"
alias gcc="nocorrect ${aliases[gcc]:-gcc}"
alias gist="nocorrect ${aliases[gist]:-gist}"
alias grep="nocorrect ${aliases[grep]:-grep}"
alias heroku="nocorrect ${aliases[heroku]:-heroku}"
alias ln="nocorrect ${aliases[ln]:-ln}"
alias man="nocorrect ${aliases[man]:-man}"
alias mkdir="nocorrect ${aliases[mkdir]:-mkdir}"
alias mv="nocorrect ${aliases[mv]:-mv}"
alias mysql="nocorrect ${aliases[mysql]:-mysql}"
alias rm="nocorrect ${aliases[rm]:-rm}"

# Disable globbing. Do not overwrite previous aliases.
alias bower="noglob ${aliases[bower]:-bower}"
alias fc="noglob ${aliases[fc]:-fc}"
alias find="noglob ${aliases[find]:-find}"
alias ftp="noglob ${aliases[ftp]:-ftp}"
alias history="noglob ${aliases[history]:-history}"
alias locate="noglob ${aliases[locate]:-locate}"
alias rake="noglob ${aliases[rake]:-rake}"
alias rsync="noglob ${aliases[rsync]:-rsync}"
alias scp="noglob ${aliases[scp]:-scp}"
alias sftp="noglob ${aliases[sftp]:-sftp}"

# Define general aliases.
alias _='sudo'
alias sr='source'
alias b='${(z)BROWSER}'
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias p='${(z)PAGER}'
alias type='type -a'

# Grep
zstyle -s ':dotzsh:module:utility:grep' color 'COLOR'
if [[ ! -z $COLOR ]]
then
  export GREP_COLOR="$COLOR"          # BSD.
  export GREP_COLORS="mt=$GREP_COLOR" # GNU.

  alias grep="${aliases[grep]:-grep} --color=auto"
fi

# Mac OS X Everywhere
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
elif [[ "$OSTYPE" == cygwin* ]]; then
  alias o='cygstart'
  alias pbcopy='tee > /dev/clipboard'
  alias pbpaste='cat /dev/clipboard'
else
  alias o='xdg-open'

  if (( $+commands[xclip] )); then
    alias pbcopy='xclip -selection clipboard -in'
    alias pbpaste='xclip -selection clipboard -out'
  elif (( $+commands[xsel] )); then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  fi
fi

alias pbc='pbcopy'
alias pbp='pbpaste'

# File Download
if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif (( $+commands[wget] )); then
  alias get='wget --continue --progress=bar --timestamping'
fi

# Resource Usage
alias df='df -kh'
alias du='du -kh'
alias dud='du -d 1 -h'
alias duf='du -sh *'

if (( $+commands[htop] )); then
  alias top=htop
else
  if [[ "$OSTYPE" == (darwin*|*bsd*) ]]; then
    alias topc='top -o cpu'
    alias topm='top -o vsize'
  else
    alias topc='top -o %CPU'
    alias topm='top -o %MEM'
  fi
fi

# Miscellaneous

# Serves a directory via HTTP.
alias http-serve='python -m SimpleHTTPServer'

## Suffix aliases

autoload -U is-at-least
if is-at-least 4.2.0 ; then
    # documents
    if [[ "$OSTYPE" == darwin* ]]; then
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
        browser_fts=(
                          htm html de org net com at cx nl se dk dk php
                     )
        for ft in $browser_fts ; do alias -s $ft=$BROWSER ; done

        # text files
        editor_fts=(
                        cpp cxx cc c hh h inl asc txt TXT tex
                    )
        for ft in $editor_fts ; do alias -s $ft=$EDITOR ; done

        # images
        image_fts=(
                        jpg jpeg png gif mng tiff tif xpm
                    )
        for ft in $image_fts ; do alias -s $ft=$XIVIEWER; done

        # media files
        media_fts=(
                       ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm
                   )
        for ft in $media_fts ; do alias -s $ft=$PLAYER ; done

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

## Global aliases

# Note: Global aliases can be evil! Using combinations that have limited number of uses is a good choice.
# A general good option is ] as it will rarely be needed without a preceding [ and you don't need to press shift to type it.
# You might also use !, ~, ^ or = as a suffix as they tend to only be special as a prefix.

alias -g '!H'='| head'
alias -g '!T'='| tail'
alias -g '!L'='| less'
alias -g '!M'='| most'
alias -g '!G'='| egrep'
alias -g '!C'='| wc -l'
alias -g '!S'='| sort -u'
alias -g '!A'='| awk'
alias -g '!P'='2>&1| pygmentize -g'
alias -g '!TL'='| tail -20'
alias -g '!LE'="2>&1 | less"
alias -g '!NE'="2> /dev/null"
alias -g '!NUL'="> /dev/null 2>&1"

# Smart grep
# R - recursive, n - line numbers, H - always print filename headers, C - print 5 lines of surrounding context, exclude versioning directories
alias sgrep="${aliases[grep]:-grep} -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} "

# Smart find
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias findf='fd'
alias findd='ff'
