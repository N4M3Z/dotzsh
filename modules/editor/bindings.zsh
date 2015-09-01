##
#  @file
#      editor/bindings.zsh
#
#  @authors:
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# Return if requirements are not found.
if [[ "$TERM" == 'dumb' ]]; then
  return 1
fi

# Treat these characters as part of a word.
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

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
# Load widgets
#

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line

# Reset to default key bindings.
bindkey -d

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
bindkey -M emacs "$key_info[Control]K$key_info[Control]B" vi-find-prev-char

# Match bracket.
bindkey -M emacs "$key_info[Control]K$key_info[Control]]" vi-match-bracket

# Edit command in an external editor.
bindkey -M emacs "$key_info[Control]K$key_info[Control]E" edit-command-line

if (( $+widgets[history-incremental-pattern-search-backward] )); then
  # [ctrl + r] : Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
  #    Default : (^R ^Xr) (unbound) (unbound)
  bindkey -M emacs "$key_info[Control]R" \
    history-incremental-pattern-search-backward
  # [ctrl + s] : Search forward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
  #    Default : (^S ^Xs) (unbound) (unbound)
  bindkey -M emacs "$key_info[Control]S" \
    history-incremental-pattern-search-forward
fi

# Defaults are given for each keybinding (emacs mode) (vi command mode) (vi insert mode):

# [ctrl + s] : Stop output to screen
# [ctrl + q] : Re-enable screen output
# [ctrl + c] : Terminate/kill current foreground process
# [ctrl + z] : Suspend/stop current foreground process

# [ctrl + g] : Escape from search mode
#    Default : (^G ESC-^G) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]G" send-break                     # [ctrl + g]

# [ctrl + v] : Insert the next character typed into the buffer literally. An interrupt character will not be inserted.
#    Default : (^V) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]V" quoted-insert                  # [ctrl + v]

# [ctrl + a] : Go to beginning of line
#     Default: (^A) (unbound) (unbound)
# [ctrl + e] : Go to end of line (e for end)
#     Default: (^E) (unbound) (unbound)
# [ctrl + m] : Accept line - REASSIGNED
#     Default: (^J ^M) (^J ^M) (^J ^M)
bindkey -M emacs "$key_info[Control]A" beginning-of-line              # [ctrl + a]
bindkey -M emacs "$key_info[Control]E" end-of-line                    # [ctrl + e]
bindkey -M emacs "$key_info[Control]M" accept-line                    # [ctrl + m] - REASSIGNED

# [alt + f] : Move forward one character.
#   Default : (^F ESC-[C) (unbound) (unbound)
# [alt + b] : Move backward one character.
#   Default : (^B ESC-[D) (unbound) (unbound)
bindkey -M emacs "$key_info[Meta]F" forward-char                      # [alt + f] - REASSIGNED
bindkey -M emacs "$key_info[Meta]B" backward-char                     # [alt + b] - REASSIGNED

# [ctrl + f] : Move forward one word (f for forward)
#    Default : (ESC-F ESC-f) (unbound) (unbound)
# [ctrl + b] : Move backward one word (b for backward)
#    Default : (ESC-B ESC-b) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]F" forward-word                   # [ctrl + f] - REASSIGNED
bindkey -M emacs "$key_info[Control]B" backward-word                  # [ctrl + b] - REASSIGNED

# [ctrl + d] : Delete character forward (d for delete)
#   Defaults : (^D) (unbound) (unbound)
# [ctrl + h] or [backspace] : Delete backward
#     Default : (^H ^?) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]D" delete-char-or-list            # [ctrl + d]
bindkey -M emacs "$key_info[Control]B" backward-delete-char           # [backspace]

# [ctrl + u] : Delete the entire line
#    Default : (^U) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]U" kill-whole-line                # [ctrl + u]

# [ctrl + k] : Delete from character to end of line
#    Default : (^K) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]J" kill-line                      # [ctrl + k]

# [ctrl + _] : Undo the last change
#    Default : (^_ ^Xu ^X^U) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]_" undo                           # [ctrl + _]

# [ctrl + q] : Delete word
#   Defaults : (ESC-D ESC-d) (unbound) (unbound)
# [ctrl + w] : Delete word backward
#   Defaults : (^W ESC-^H ESC-^?) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]Q" kill-word                      # [ctrl + q]
bindkey -M emacs "$key_info[Control]W" backward-kill-word             # [ctrl + w]

# [ctrl + t] : Delete word
#   Defaults : (^T) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]T" transpose-chars                # [ctrl + t]

# [ctrl + y] : Insert the contents of the kill buffer at the cursor position.
#   Defaults : (^Y) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]Y" yank                           # [ctrl + y]

# [ctrl + i] or [tab]: Copy previous word in command line
#   Defaults : (unbound) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]I" menu-expand-or-complete        # [ctrl + i] = [tab] replaces expand-or-compete

# [ctrl + o] : Execute the current line, and push the next history event on the the buffer stack
#   Defaults : (^O) (unbound) (unbound)
bindkey -M emacs "$key_info[Control]O" accept-line-and-down-history   # [ctrl + o]

# [ctrl + p] : Move up a line in the buffer, or if already at the top line, move to the previous event in the history list
#   Defaults : (^P ESC-[A) (k) (unbound)
# [ctrl + n] : Move down a line in the buffer, or if already at the top line, move to the next event in the history list
#   Defaults : (^N ESC-[B) (j) (unbound)
bindkey -M emacs "$key_info[Control]P" up-line-or-history             # [ctrl + p]
bindkey -M emacs "$key_info[Control]N" down-line-or-history           # [ctrl + n]

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

  # [F1] : Read the name of an editor command and and print the listing of key sequences that invoke the specified command.
  bindkey -M "$keymap" "$key_info[F1]" where-is

  # [ctrl + l] : Clear screen
  #    Default : (^L ESC-^L) (^L) (^L)
  bindkey -M "$keymap" "$key_info[Control]L" clear-screen                   # [ctrl + l]

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
  bindkey -M "$keymap" "$key_info[Control]S" prepend-sudo

  # [Ctrl + x] : insert last command result
  bindkey -M "$keymap" "$key_info[Control]X" insert-last-command-output

  #
  # Command bindings:
  #
  # [esc + q] : Kill from the cursor to the mark
  for key in "$key_info[Escape]"{Q,q}
    bindkey -M "$keymap" "$key" kill-region                    # [esc + q]

  for key in "$key_info[Escape]"{P,p}
    bindkey -s "$key" "pwd\n"                                  # [esc + p] - run command: pwd

  for key in "$key_info[Escape]"{L,l}
    bindkey -s "$key" "ls\n"                                   # [esc + l] - run command: ls

  bindkey -s "$key_info[Control]K$key_info[Control]P" "pwd\n"  # [ctrl + k, ctrl + p]
  bindkey -s "$key_info[Control]K$key_info[Control]L" "ls\n"   # [ctrl + k, ctrl + l]

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
  # Enable emacs-like key bindings
  bindkey -e
elif [[ "$key_bindings" == vi ]]; then
  # Enable vi-like key bindings
  bindkey -v
else
  print "prezto: editor: invalid key bindings: $key_bindings" >&2
fi

unset key{,map,bindings}
