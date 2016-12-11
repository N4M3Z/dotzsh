##
#  @file
#      editor/init.zsh
#
#  @authors:
#      Sorin Ionescu <sorin.ionescu@gmail.com>
#      Martin Zeman <martin.zeman@protonmail.ch>
#
#  @note:
#      Sets key bindings.
#      Follow this guide to Zsh keyboard assignments:
#
#   Grey keys:
#
#     key[F1]        = '^[[[A'
#     key[F2]        = '^[[[B'
#     key[F3]        = '^[[[C'
#     key[F4]        = '^[[[D'
#     key[F5]        = '^[[[E'
#     key[F6]        = '^[[17~'
#     key[F7]        = '^[[18~'
#     key[F8]        = '^[[19~'
#     key[F9]        = '^[[20~'
#     key[F10]       = '^[[21~'
#     key[F11]       = '^[[23~'
#     key[F12]       = '^[[24~'
#
#     key[Shift-F1]  = '^[[25~'
#     key[Shift-F2]  = '^[[26~'
#     key[Shift-F3]  = '^[[28~'
#     key[Shift-F4]  = '^[[29~'
#     key[Shift-F5]  = '^[[31~'
#     key[Shift-F6]  = '^[[32~'
#     key[Shift-F7]  = '^[[33~'
#     key[Shift-F8]  = '^[[34~'
#
#     key[Insert]    = '^[[2~'
#     key[Delete]    = '^[[3~'
#     key[Home]      = '^[[1~'
#     key[End]       = '^[[4~'
#     key[PageUp]    = '^[[5~'
#     key[PageDown]  = '^[[6~'
#     key[Up]        = '^[[A'
#     key[Down]      = '^[[B'
#     key[Right]     = '^[[C'
#     key[Left]      = '^[[D'
#
#     key[Bksp]      = '^?'
#     key[Bksp-Alt]  = '^[^?'
#     key[Bksp-Ctrl] = '^H' (console only)
#
#     key[Esc]       = '^['
#     key[Esc-Alt]   = '^[^['
#
#     key[Enter]     = '^M'
#     key[Enter-Alt] = '^[^M'
#
#     key[Tab]       = '^I' or '\t'  unique form! can be bound, but does not 'showkey -a'.
#     key[Tab-Alt]   = '^[\t'
#
#   Some common grey key combinations:
#     [fn + up]    = '\e[5~' = PageUp
#     [fn + down]  = '\e[6~' = PageDown
#     [fn + left]  = '\e[H'  = Home
#     [fn + right] = '\e[F'  = End
#
#     [alt + up]    = '\e[1;9A'
#     [alt + down]  = '\e[1;9B'
#     [alt + left]  = '\e[1;9C'
#     [alt + right] = '\e[1;9D'
#
#     [shift + up]    = '\e[1;2A'
#     [shift + down]  = '\e[1;2B'
#     [shift + left]  = '\e[1;2D'
#     [shift + right] = '\e[1;2C'
#
#   White keys and combinations:
#
#   White key codes are easy to undertand, each of these 'normal' printing keys has six forms:
#
#     A            = 'a'    (who would have guessed?)
#     A-Shift      = 'A'    (who would have guessed?)
#     A-Alt        = '^[a'
#
#     A-Ctrl       = '^A'
#     A-Alt-Ctrl   = '^[^A'
#     A-Alt-Shift  = '^[A'  (Shift has no effect)
#     A-Ctrl-Shift = '^A'   (Shift has no effect)
#
#   We can 'stack' keybindings:
#     bindkey -s '^Xm' "This is a stacked keybinding."
#     bindkey -s '^a^b' "This is another stacked keybinding."
#
#   Anomalies:
#     [ctrl+`] == [ctrl+2], [ctrl+1] == '1' in xterm.
#     Several [ctrl + <number>] combinations are void at console, but return codes in xterm.
#     On the other hand [ctrl + backspace] returns '^H' at console, but is identical to plain [backspace] in xterm.
#     There are no doubt more of these little glitches however, in the main:
#
#   Don't forget that:
#     [ctrl]      == '\C' = '^'
#     [alt]       == '\M' = '^[' = [+Esc] (depending on the system)
#
#   Which in summary converts to:
#     [backspace] == '\b' == '^?' == shift + ctrl + /
#     [esc]       == '\e' == '^[' == ctrl + [
#     [enter]     == '\r' == '^M' == ctrl + m
#     [tab]       == '\t' == '^I' == ctrl + i
#
#   which means that for example ^[ is just a representation of [esc] and \e is interpreted as an actual [esc] character
#   (much in the same in the way that \t is interpreted as a tab and \n as a newline)

# Return if requirements are not found.
if [[ "$TERM" == 'dumb' ]]; then
  return 1
fi

#
# Options
#

# Beep on error in line editor.
setopt BEEP

##
# Functions
#
source ${0:h}/functions.zsh

##
# Key Bindings
#
source ${0:h}/bindings.zsh
