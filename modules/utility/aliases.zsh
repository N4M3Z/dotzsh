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

# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias ebuild='nocorrect ebuild'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias heroku='nocorrect heroku'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias rm='nocorrect rm'

# Disable globbing.
alias bower='noglob bower'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history="noglob ${aliases[history]:-history}"
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'

# Define general aliases.
alias _='sudo'
alias sr='source'
alias b='${(z)BROWSER}'
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias p='${(z)PAGER}'
alias type='type -a'

# Safety first
alias cp="${aliases[cp]:-cp} -i"
alias ln="${aliases[ln]:-ln} -i"
alias mv="${aliases[mv]:-mv} -i"
alias rm="${aliases[rm]:-rm} -i"

alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias rmdir="${aliases[rmdir]:-rmdir} -v"
alias chmod="${aliases[chmod]:-chmod} -v"
alias chown="${aliases[chown]:-chown} -v"

# ls
if is-callable 'dircolors'; then
  # GNU Core Utilities
  alias ls='ls --group-directories-first'

  if zstyle -t ':prezto:module:utility:ls' color; then
    if [[ -s "$HOME/.dir_colors" ]]; then
      eval "$(dircolors --sh "$HOME/.dir_colors")"
    else
      eval "$(dircolors --sh)"
    fi

    alias ls="${aliases[ls]:-ls} --color=auto"
  else
    alias ls="${aliases[ls]:-ls} -F"
  fi
else
  # BSD Core Utilities
  if zstyle -t ':prezto:module:utility:ls' color; then
    # Define colors for BSD ls.
    export LSCOLORS='exfxcxdxbxGxDxabagacad'

    # Define colors for the completion system.
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

    alias ls="${aliases[ls]:-ls} -G"
  else
    alias ls="${aliases[ls]:-ls} -F"
  fi
fi

alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lx='ll -XB'        # Lists sorted by extension (GNU only).
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
alias sl='ls'            # I often screw this up.

# Grep
if zstyle -t ':prezto:module:utility:grep' color; then
  export GREP_COLOR='37;45'           # BSD.
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
