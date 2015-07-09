##
#  @file
#  @brief Z-Shell profile aliases
#  @author N4M3Z <https://github.com/N4M3Z>
#  @note Original version from oh-my-zsh repository

## Sublime Text Aliases
if [[ $('uname') == 'Linux' ]]; then
    local _sublime_linux_paths > /dev/null 2>&1
    _sublime_linux_paths=(
        "$HOME/bin/sublime_text"
        "/opt/sublime_text/sublime_text"
        "/usr/bin/sublime_text"
        "/usr/local/bin/sublime_text"
        "/usr/bin/subl"
    )
    for _sublime_path in $_sublime_linux_paths; do
        if [[ -a $_sublime_path ]]; then
            st_run() { $_sublime_path $@ >/dev/null 2>&1 &| }
            st_run_sudo() {sudo $_sublime_path $@ >/dev/null 2>&1}
            alias sst=st_run_sudo
            alias st=st_run
            break
        fi
    done

elif  [[ "$OSTYPE" = darwin* ]]; then
    local _sublime_darwin_paths > /dev/null 2>&1
    _sublime_darwin_paths=(
        "/usr/local/bin/subl"
        "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
        "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
        "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
        "$HOME/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
        "$HOME/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
        "$HOME/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
    )

    for _sublime_path in $_sublime_darwin_paths; do
        if [[ -a $_sublime_path ]]; then
            alias st="'$_sublime_path'"
            break
        fi
    done
fi

alias subl="st"
alias stt="st ."

export EDITOR="subl" # calling longer alias avoids various issues
export VISUAL="subl" # calling longer alias avoids various issues

export stconfig="/Users/${USER}/Library/Application Support/Sublime Text 3/Packages/User"
