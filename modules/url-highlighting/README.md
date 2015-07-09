URL Highlighting
================

Integrates [ascii-soup/zsh-url-highlighter][1] into Prezto.

This module needs to be loaded *after* the *syntax-highlighting* module
and **before** the *history-substring-search* if used in conjunction with it.

Settings
--------

### Highlighting

This module requires the `syntax-highlighting` option enabled in *zpreztorc*:
```sh
zstyle ':prezto:module:syntax-highlighting' color 'yes'
```

### Highlighters

To enable URL highlighter, add it amongst other highlighters in *zpreztorc*:

```sh
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line' \
  'cursor' \
  'root' \
  'url'
```

Authors
-------

*The authors of this module should be contacted via the [issue tracker][3].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Martin Zeman](https://github.com/N4M3Z)

[1]: https://github.com/ascii-soup/zsh-url-highlighter
