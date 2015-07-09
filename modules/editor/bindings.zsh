#!/bin/zsh

##
# Beginers's guide to Zsh keyboard assignments:
#

## Grey keys:
#
# key[F1]        = '^[[[A'
# key[F2]        = '^[[[B'
# key[F3]        = '^[[[C'
# key[F4]        = '^[[[D'
# key[F5]        = '^[[[E'
# key[F6]        = '^[[17~'
# key[F7]        = '^[[18~'
# key[F8]        = '^[[19~'
# key[F9]        = '^[[20~'
# key[F10]       = '^[[21~'
# key[F11]       = '^[[23~'
# key[F12]       = '^[[24~'
#
# key[Shift-F1]  = '^[[25~'
# key[Shift-F2]  = '^[[26~'
# key[Shift-F3]  = '^[[28~'
# key[Shift-F4]  = '^[[29~'
# key[Shift-F5]  = '^[[31~'
# key[Shift-F6]  = '^[[32~'
# key[Shift-F7]  = '^[[33~'
# key[Shift-F8]  = '^[[34~'
#
# key[Insert]    = '^[[2~'
# key[Delete]    = '^[[3~'
# key[Home]      = '^[[1~'
# key[End]       = '^[[4~'
# key[PageUp]    = '^[[5~'
# key[PageDown]  = '^[[6~'
# key[Up]        = '^[[A'
# key[Down]      = '^[[B'
# key[Right]     = '^[[C'
# key[Left]      = '^[[D'
#
# key[Bksp]      = '^?'
# key[Bksp-Alt]  = '^[^?'
# key[Bksp-Ctrl] = '^H' (console only)
#
# key[Esc]       = '^['
# key[Esc-Alt]   = '^[^['
#
# key[Enter]     = '^M'
# key[Enter-Alt] = '^[^M'
#
# key[Tab]       = '^I' or '\t'  unique form! can be bound, but does not 'showkey -a'.
# key[Tab-Alt]   = '^[\t'
#
# Some common grey key combinations:
# [fn + up]    = '\e[5~' = PageUp
# [fn + down]  = '\e[6~' = PageDown
# [fn + left]  = '\e[H'  = Home
# [fn + right] = '\e[F'  = End
#
# [alt + up]    = '\e[1;9A'
# [alt + down]  = '\e[1;9B'
# [alt + left]  = '\e[1;9C'
# [alt + right] = '\e[1;9D'
#
# [shift + up]    = '\e[1;2A'
# [shift + down]  = '\e[1;2B'
# [shift + left]  = '\e[1;2D'
# [shift + right] = '\e[1;2C'

## White keys and combinations:
# White key codes are easy to undertand, each of these 'normal' printing keys has six forms:
#
# A            = 'a'    (who would have guessed?)
# A-Shift      = 'A'    (who would have guessed?)
# A-Alt        = '^[a'
#
# A-Ctrl       = '^A'
# A-Alt-Ctrl   = '^[^A'
# A-Alt-Shift  = '^[A'  (Shift has no effect)
# A-Ctrl-Shift = '^A'   (Shift has no effect)

## We can 'stack' keybindings:
# bindkey -s '^Xm' "This is a stacked keybinding."
# bindkey -s '^a^b' "This is another stacked keybinding."

## Anomalies:
# [ctrl+`] == [ctrl+2], [ctrl+1] == '1' in xterm.
# Several [ctrl + <number>] combinations are void at console, but return codes in xterm.
# On the other hand [ctrl + backspace] returns '^H' at console, but is identical to plain [backspace] in xterm.
# There are no doubt more of these little glitches however, in the main:

# Don't forget that:
# [ctrl]      == '\C' = '^'
# [alt]       == '\M' = '^[' = [+Esc] (depending on the system)

# [backspace] == '\b' == '^?' == shift + ctrl + /
# [esc]       == '\e' == '^[' == ctrl + [
# [enter]     == '\r' == '^M' == ctrl + m
# [tab]       == '\t' == '^I' == ctrl + i

# i.e. for example ^[ is just a representation of [esc] and \e is interpreted as an actual [esc] character
# (much in the same in the way that \t is interpreted as a tab and \n as a newline)

# Reset to default key bindings.
bindkey -d

# Use human-friendly identifiers.
zmodload zsh/terminfo

typeset -gA key_info

key_info=(
  'Control'      '\C-'
  'ControlLeft'  '\e[1;5D \e[5D \e\e[D \eOd'
  'ControlRight' '\e[1;5C \e[5C \e\e[C \eOc'
  'Escape'       '\e'
  'Meta'         '\M-'
  'Backspace'    "^?"
  'Delete'       "^[[3~"
  'F1'           "$terminfo[kf1]"
  'F2'           "$terminfo[kf2]"
  'F3'           "$terminfo[kf3]"
  'F4'           "$terminfo[kf4]"
  'F5'           "$terminfo[kf5]"
  'F6'           "$terminfo[kf6]"
  'F7'           "$terminfo[kf7]"
  'F8'           "$terminfo[kf8]"
  'F9'           "$terminfo[kf9]"
  'F10'          "$terminfo[kf10]"
  'F11'          "$terminfo[kf11]"
  'F12'          "$terminfo[kf12]"
  'Insert'       "$terminfo[kich1]"
  'Home'         "$terminfo[khome]"
  'PageUp'       "$terminfo[kpp]"
  'End'          "$terminfo[kend]"
  'PageDown'     "$terminfo[knp]"
  'Up'           "$terminfo[kcuu1]"
  'Left'         "$terminfo[kcub1]"
  'Down'         "$terminfo[kcud1]"
  'Right'        "$terminfo[kcuf1]"
  'BackTab'      "$terminfo[kcbt]"
)

# Set empty $key_info values to an invalid UTF-8 sequence to induce silent bindkey failure.
for key in "${(k)key_info[@]}"; do
  if [[ -z "$key_info[$key]" ]]; then
    key_info[$key]='�'
  fi
done

#
# Emacs Key Bindings
#

for key in "$key_info[Escape]"{B,b} "${(s: :)key_info[ControlLeft]}"
  bindkey -M emacs "$key" emacs-backward-word
for key in "$key_info[Escape]"{F,f} "${(s: :)key_info[ControlRight]}"
  bindkey -M emacs "$key" emacs-forward-word

# Kill to the beginning of the line.
for key in "$key_info[Escape]"{K,k}
  bindkey -M emacs "$key" backward-kill-line

# Redo.
bindkey -M emacs "$key_info[Escape]_" redo

# Search previous character.
bindkey -M emacs "$key_info[Control]X$key_info[Control]B" vi-find-prev-char

# Match bracket.
bindkey -M emacs "$key_info[Control]X$key_info[Control]]" vi-match-bracket

# Edit command in an external editor.
bindkey -M emacs "$key_info[Control]X$key_info[Control]E" edit-command-line

if (( $+widgets[history-incremental-pattern-search-backward] )); then
  bindkey -M emacs "$key_info[Control]R" \
    history-incremental-pattern-search-backward
  bindkey -M emacs "$key_info[Control]S" \
    history-incremental-pattern-search-forward
fi

#
# Vi Key Bindings
#

# Edit command in an external editor.
bindkey -M vicmd "v" edit-command-line

# Undo/Redo
bindkey -M vicmd "u" undo
bindkey -M vicmd "$key_info[Control]R" redo

if (( $+widgets[history-incremental-pattern-search-backward] )); then
  bindkey -M vicmd "?" history-incremental-pattern-search-backward
  bindkey -M vicmd "/" history-incremental-pattern-search-forward
else
  bindkey -M vicmd "?" history-incremental-search-backward
  bindkey -M vicmd "/" history-incremental-search-forward
fi

#
# Emacs and Vi Key Bindings
#

for keymap in 'emacs' 'viins'; do
  bindkey -M "$keymap" "$key_info[Home]" beginning-of-line
  bindkey -M "$keymap" "$key_info[End]" end-of-line

  bindkey -M "$keymap" "$key_info[Insert]" overwrite-mode
  bindkey -M "$keymap" "$key_info[Delete]" delete-char
  bindkey -M "$keymap" "$key_info[Backspace]" backward-delete-char

  bindkey -M "$keymap" "$key_info[Left]" backward-char
  bindkey -M "$keymap" "$key_info[Right]" forward-char

  # Expand history on space.
  bindkey -M "$keymap" ' ' magic-space

  # Clear screen.
  bindkey -M "$keymap" "$key_info[Control]L" clear-screen

  # Expand command name to full path.
  for key in "$key_info[Escape]"{E,e}
    bindkey -M "$keymap" "$key" expand-cmd-path

  # Duplicate the previous word.
  for key in "$key_info[Escape]"{M,m}
    bindkey -M "$keymap" "$key" copy-prev-shell-word

  # Use a more flexible push-line.
  for key in "$key_info[Control]Q" "$key_info[Escape]"{q,Q}
    bindkey -M "$keymap" "$key" push-line-or-edit

  # Bind Shift + Tab to go to the previous menu item.
  bindkey -M "$keymap" "$key_info[BackTab]" reverse-menu-complete

  # Complete in the middle of word.
  bindkey -M "$keymap" "$key_info[Control]I" expand-or-complete

  # Expand .... to ../..
  if zstyle -t ':prezto:module:editor' dot-expansion; then
    bindkey -M "$keymap" "." expand-dot-to-parent-directory-path
  fi

  # Display an indicator when completing.
  bindkey -M "$keymap" "$key_info[Control]I" \
    expand-or-complete-with-indicator

  # Insert 'sudo ' at the beginning of the line.
  bindkey -M "$keymap" "$key_info[Control]X$key_info[Control]S" prepend-sudo
done

# Do not expand .... to ../.. during incremental search.
if zstyle -t ':prezto:module:editor' dot-expansion; then
  bindkey -M isearch . self-insert 2> /dev/null
fi

#
# Layout
#

# Set the key layout.
zstyle -s ':prezto:module:editor' key-bindings 'key_bindings'
if [[ "$key_bindings" == (emacs|) ]]; then
  bindkey -e
elif [[ "$key_bindings" == vi ]]; then
  bindkey -v
else
  print "prezto: editor: invalid key bindings: $key_bindings" >&2
fi

unset key{,map,bindings}








# Create a zkbd compatible hash:
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Up]}"       ]] && bindkey "${key[Up]}"       up-line-or-search    # start typing + [Up-Arrow] - Fuzzy find history forward
[[ -n "${key[Down]}"     ]] && bindkey "${key[Down]}"     down-line-or-search  # start typing + [Down-Arrow] - Fuzzy find history backward

[[ -n "${key[Left]}"     ]] && bindkey "${key[Left]}"     backward-char        # [Left Arrow]  - Move cursor left
[[ -n "${key[Right]}"    ]] && bindkey "${key[Right]}"    forward-char         # [Right Arrow] - Move cursor right

[[ -n "${key[PageUp]}"   ]] && bindkey "${key[PageUp]}"   up-line-or-history   # [PageUp]   - Up a line of history
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" down-line-or-history # [PageDown] - Down a line of history

[[ -n "${key[Home]}"     ]] && bindkey "${key[Home]}"     beginning-of-line    # [Home]
[[ -n "${key[End]}"      ]] && bindkey "${key[End]}"      end-of-line          # [End]

[[ -n "${key[Insert]}"   ]] && bindkey "${key[Insert]}"   overwrite-mode       # [Insert] - Overwrite mode
[[ -n "${key[Delete]}"   ]] && bindkey "${key[Delete]}"   delete-char          # [Delete] - Delete forward

key[F1]=${terminfo[kf1]}
key[F2]=${terminfo[kf2]}
key[F3]=${terminfo[kf3]}
key[F4]=${terminfo[kf4]}
key[F5]=${terminfo[kf5]}
key[F6]=${terminfo[kf6]}
key[F7]=${terminfo[kf7]}
key[F8]=${terminfo[kf8]}
key[F9]=${terminfo[kf9]}
key[F10]=${terminfo[kf10]}
key[F11]=${terminfo[kf11]}
key[F12]=${terminfo[kf12]}

# [F1] : Read the name of an editor command and and print the listing of key sequences that invoke the specified command.
[[ -n "${key[F1]}" ]] && bindkey "${key[F1]}" where-is

## White keys and combinations:
# Defaults are given for each keybinding (emacs mode) (vi command mode) (vi insert mode):

# Enable emacs-like key bindings
bindkey -e
# Enable vi-like key bindings
# bindkey -v

# [ctrl + s] : Stop output to screen
# [ctrl + q] : Re-enable screen output
# [ctrl + c] : Terminate/kill current foreground process
# [ctrl + z] : Suspend/stop current foreground process

# [ctrl + l] : Clear screen
#    Default : (^L ESC-^L) (^L) (^L)
bindkey '\C-l' clear-screen

# [ctrl + s] : Search forward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
#    Default : (^S ^Xs) (unbound) (unbound)
# [ctrl + r] : Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
#    Default : (^R ^Xr) (unbound) (unbound)
bindkey '\C-s' history-incremental-pattern-search-forward
bindkey '\C-r' history-incremental-pattern-search-backward

# [ctrl + g] : Escape from search mode
#    Default : (^G ESC-^G) (unbound) (unbound)
bindkey '\C-g' send-break           # [ctrl + g]

# [ctrl + v] : Insert the next character typed into the buffer literally. An interrupt character will not be inserted.
#    Default : (^V) (unbound) (unbound)
bindkey '\C-v' quoted-insert

# [ctrl + a] : Go to beginning of line
#     Default: (^A) (unbound) (unbound)
# [ctrl + e] : Go to end of line (e for end)
#     Default: (^E) (unbound) (unbound)
# [ctrl + m] : Accept line - REASSIGNED
#     Default: (^J ^M) (^J ^M) (^J ^M)
bindkey '\C-a' beginning-of-line    # [ctrl + a]
bindkey '\C-e' end-of-line          # [ctrl + e]
bindkey '\C-m' accept-line          # [ctrl + m] - REASSIGNED

if is-osx; then
    bindkey "^[[H" beginning-of-line # [Home on OS X] - Go to beginning of line
    bindkey "^[[F" end-of-line       # [End on OS X] - Go to end of line
fi

# [alt + f] : Move forward one character.
#   Default : (^F ESC-[C) (unbound) (unbound)
# [alt + b] : Move backward one character.
#   Default : (^B ESC-[D) (unbound) (unbound)
bindkey '\M-f' forward-char   # [alt + f] - REASSIGNED
bindkey '\M-b' backward-char  # [alt + b] - REASSIGNED

# [ctrl + f] : Move forward one word (f for forward)
#    Default : (ESC-F ESC-f) (unbound) (unbound)
# [ctrl + b] : Move backward one word (b for backward)
#    Default : (ESC-B ESC-b) (unbound) (unbound)
bindkey '\C-f' forward-word  # [ctrl + f] - REASSIGNED
bindkey '\C-b' backward-word # [ctrl + b] - REASSIGNED

bindkey '\e[1;9C' forward-word   # [alt + right]
bindkey '\e[1;9D' backward-word  # [alt + left]

# [ctrl + d] : Delete character forward (d for delete)
#   Defaults : (^D) (unbound) (unbound)
# [ctrl + h] or [backspace] : Delete backward
#     Default : (^H ^?) (unbound) (unbound)
bindkey '\C-d' delete-char-or-list # [ctrl + d]
bindkey '\C-b' backward-delete-char # [backspace]

# [ctrl + u] : Delete the entire line
#    Default : (^U) (unbound) (unbound)
bindkey '\C-u' kill-whole-line                          # [ctrl + u]

# [ctrl + k] : Delete from character to end of line
#    Default : (^K) (unbound) (unbound)
bindkey '\C-k' kill-line                                # [ctrl + k]

# [ctrl + _] : Undo the last change
#    Default : (^_ ^Xu ^X^U) (unbound) (unbound)
bindkey '\C-_' undo                                     # [ctrl + _]

# [ctrl + q] : Delete word
#   Defaults : (ESC-D ESC-d) (unbound) (unbound)
# [ctrl + w] : Delete word backward
#   Defaults : (^W ESC-^H ESC-^?) (unbound) (unbound)
bindkey '\C-q' kill-word                                # [ctrl + q]
bindkey '\C-w' backward-kill-word                       # [ctrl + w]

# [ctrl + t] : Delete word
#   Defaults : (^T) (unbound) (unbound)
bindkey '\C-t' transpose-chars                          # [ctrl + t]

# [ctrl + y] : Insert the contents of the kill buffer at the cursor position.
#   Defaults : (^Y) (unbound) (unbound)
bindkey '\C-y' yank                                     # [ctrl + y]

# [ctrl + i] or [tab]: Copy previous word in command line
#   Defaults : (unbound) (unbound) (unbound)
bindkey '\C-i' menu-expand-or-complete                       # [ctrl + i] = [tab] replaces expand-or-compete

# [ctrl + o] : Execute the current line, and push the next history event on the the buffer stack
#   Defaults : (^O) (unbound) (unbound)
bindkey '\C-o' accept-line-and-down-history             # [ctrl + o]

# [ctrl + p] : Move up a line in the buffer, or if already at the top line, move to the previous event in the history list
#   Defaults : (^P ESC-[A) (k) (unbound)
# [ctrl + n] : Move down a line in the buffer, or if already at the top line, move to the next event in the history list
#   Defaults : (^N ESC-[B) (j) (unbound)
bindkey '\C-p' up-line-or-history                       # [ctrl + p]
bindkey '\C-n' down-line-or-history                     # [ctrl + n]

# [ctrl + j] : UNASSIGNED (or can be replaced)
# [ctrl + r] : UNASSIGNED (or can be replaced)
# [ctrl + s] : UNASSIGNED (or can be replaced)

# [esc + q] : Kill from the cursor to the mark
bindkey '\e-q' kill-region                              # [esc + q]

# bindkey ' ' magic-space                               # [Space] - do history expansion

## Command bindings:
bindkey -s '\ep' 'pwd\n'                                # [Esc + p] - run command: pwd
bindkey -s '\el' 'ls\n'                                 # [Esc + l] - run command: ls

bindkey '\C-k\C-p' 'pwd\n'                              # [ctrl + k, ctrl + p]
bindkey '\C-k\C-l' 'ls\n'                               # [ctrl + k, ctrl + l]

## Widget bindings:
# [Esc + e] Edit the current command line in $EDITOR
autoload -U        edit-command-line
zle -N             edit-command-line
bindkey '\ee'      edit-command-line                    # [esc + e]
bindkey '\C-k\C-e' edit-command-line                    # [ctrl + k, ctrl + e]

# [Esc + s] : insert sudo at the start of the line
function insert_sudo()
{
    zle beginning-of-line
    zle -U "sudo "
}
zle -N insert-sudo insert_sudo
bindkey '\es'      insert-sudo  # [esc + s]
bindkey '\C-k\C-s' insert-sudo  # [ctrl + k, ctrl + s]

# [Esc + Esc]: insert sudo at the start of the previous command
# Superseeded by sudo plugin of oh-my-zsh
# sudo-command-line()
# {
#     zle up-history
#     zle -U "sudo "
# }
# zle -N sudo-command-line sudo-command-line
# bindkey "\e\e" sudo-command-line

# [Ctrl + x] : insert last command result
zmodload -i zsh/parameter
function insert-last-command-output()
{
    LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '\C-x' insert-last-command-output
