zsh-core — A Zsh Framework
==========================

This project is forked from the famous [Prezto][2] framework for [Zsh][1] shell.
The goals of this framework remain the same: to enrich the command line interface environment with sane defaults, aliases, functions, auto completion, and prompt themes.
The difference is in approach to some aspects of the framework.

- While most [Prezto][2] modules are small, I prefer to separate aliases, functions and key bindings from the plugin initialization completely. Hence, [zsh-core][5] automatically loads `init.zsh`, `aliases.zsh`, `bindings.zsh`, `functions.zsh` if found. [Prezto][2] authors consider such abstractions unnecessary. This behaviour is introduced in branch [enhance/modular][7], feel free to try it out.

- I prefer a different commenting style. There is limited support for [Doxygen][8] provided via [bash-doxygen][9] and for it is my personal prefernce to adhere to this standard.

See also the discussion here at [#860][5]

Apart from modifying [Prezto][2] modules to adhere to the new modular approach, [zsh-core][5] introduces support for new modules. I might eventually try to send a pull request back to [Prezto][2], I might not.

The master branch of [zsh-core][5] currently mirrors [Prezto][2], checkout [developer](https://github.com/N4M3Z/zsh-core/tree/developer) branch instead, to check out all the modifications. A comprehensive list of differences w.r.t. [Prezto][2] follows:

**New modules:**
- [alias-tips](https://github.com/N4M3Z/zsh-core/tree/module/alias-tips): Adds support for [alias-tips](https://github.com/djui/alias-tips)
- [autosuggestions](https://github.com/N4M3Z/zsh-core/tree/module/autosuggestions): Adds support for [zsh-autosuggestions](https://github.com/tarruda/zsh-autosuggestions)
- [blackbox](https://github.com/N4M3Z/zsh-core/tree/module/blackbox): Adds support for [blackbox](https://github.com/StackExchange/blackbox) encryption module.
- [composure](https://github.com/N4M3Z/zsh-core/tree/module/composure): Adds support for the excellent organic development framework [composure](https://github.com/erichs/composure)
- [dircycle](https://github.com/N4M3Z/zsh-core/tree/module/dircycle): Adds directory cycling module from [Oh-My-Zsh][3].
- [directory-history](https://github.com/N4M3Z/zsh-core/tree/module/directory-history): Adds support for [zsh-directory-history](https://github.com/tymm/zsh-directory-history). One caveat: the performance is sub-optimal.
- [dropbox](https://github.com/N4M3Z/zsh-core/tree/module/dropbox): Adds support for Linux Dropbox CLI and/or [Dropbox-Uploader](https://github.com/andreafabrizi/Dropbox-Uploader)
- [lcg](https://github.com/N4M3Z/zsh-core/tree/module/lcg): Adds functions and aliase specific to [LHC Computing Grid](http://wlcg.web.cern.ch).
- [pip](https://github.com/N4M3Z/zsh-core/tree/module/pip): Adds pip autocompletion module from [Oh-My-Zsh][3].
- [powerline](https://github.com/N4M3Z/zsh-core/tree/module/powerline): Adds support for [powerline](https://powerline.readthedocs.org/en/master/).
- [profiles](https://github.com/N4M3Z/zsh-core/tree/module/profiles): Adds support for machine specific profiles stored in `$ZDOTDIR/profiles`
- [pygmentize](https://github.com/N4M3Z/zsh-core/tree/module/pygmentize): Adds support for [Pygments](http://pygments.org/docs/cmdline/)
- [root](https://github.com/N4M3Z/zsh-core/tree/module/root): Adds support for [CERN ROOT][https://root.cern.ch]
- [sublime](https://github.com/N4M3Z/zsh-core/tree/module/sublime): Adds support for [Sublime Text](http://www.sublimetext.com)
- [trash](https://github.com/N4M3Z/zsh-core/tree/module/trash): Adds support for [trash](https://github.com/sindresorhus/trash)
- [trim](https://github.com/N4M3Z/zsh-core/tree/module/trim): Adds functions for enabling trim on third-party SSDs on OS X.
- [url-highlighting](https://github.com/N4M3Z/zsh-core/tree/module/url-highlighting): Adds support for [zsh-url-highlighter](https://github.com/ascii-soup/zsh-url-highlighter).
- [wordchar](https://github.com/N4M3Z/zsh-core/tree/module/wordchar): Adds support for character skipping using extended wordchars.
- [zgen](https://github.com/N4M3Z/zsh-core/tree/module/zgen): Adds support for [zgen](https://github.com/tarjoilija/zgen)

**Modified modules:**
All of the following modules were updated to the modular structure introduced in [enhance/modular][7]. Description of additional changes follows:
- [completion](https://github.com/N4M3Z/zsh-core/tree/enhance/completion): Added options for no beep, menu select and completion waiting dots.
- [directory](https://github.com/N4M3Z/zsh-core/tree/enhance/directory): Moved directory related aliases and functions from [utility](https://github.com/N4M3Z/zsh-core/tree/enhance/utility) module. Expanded aliases.
- [environment](https://github.com/N4M3Z/zsh-core/tree/enhance/environment): Added options to set language locale.
- [fasd](https://github.com/N4M3Z/zsh-core/tree/enhance/fasd): Added new key bindings and added default fasd aliases.
- [git](https://github.com/N4M3Z/zsh-core/tree/enhance/git): The single [Prezto][2] module that has already been using the modular structure.
- [helper](https://github.com/N4M3Z/zsh-core/tree/enhance/helper): Added new functions to detect OS, check whether a command is defined and functions to update and merge from upstream.
- [history](https://github.com/N4M3Z/zsh-core/tree/enhance/history): New option to set history date time format. Modified some aliases.
- [history-substring-search](https://github.com/N4M3Z/zsh-core/tree/enhance/history-substring-search): Modified key bindings.
- [homebrew](https://github.com/N4M3Z/zsh-core/tree/enhance/homebrew): Added autocompletion for brew cask from [Oh-My-Zsh][3] with additional fixes.
- [python](https://github.com/N4M3Z/zsh-core/tree/enhance/python): Added aliases for python2 and python3.
- [utility](https://github.com/N4M3Z/zsh-core/tree/enhance/utility): Added the option to change grep color from zpreztorc. Moved directory specific functions and aliases to [directory](https://github.com/N4M3Z/zsh-core/tree/enhance/directory) module. Added global and suffix aliases. Fixed some re-aliasing issues.

Alternatives
------------
While I fully encourage you to try [zsh-core][5], it should be pointed out that a single developer cannot realistically compete with community-driven frameworks. Hence, I recommend you to try the famous frameworks first and determine whether you would prefer a different approach. Follow what the author of [Prezto][2] said himself: "Use what you need; ignore the rest."

- [Prezto][2]: The source of this fork, an excellent fully modular [Zsh][1] framework with rigid code standards.

- [Oh-My-Zsh][3]: The wild wild west of [Zsh][1] plugins, probably the most extensive plugin library at the expense of source control.

- [zgen][4]: A lightweight plugin manager for [Zsh][1] that implements automatic loading and downloading of modules directly from [GitHub][4].

Don't misunderstand however, any help is always appreciated.

Installation
------------

Installation follows the same steps given in [Prezto][2] documentation. It will work with any recent release of Zsh, but the minimum required version is 4.3.17.

  1. Launch Zsh:

        zsh

  2. Clone the repository:

        git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  3. Create a new Zsh configuration by copying the Zsh configuration files
     provided:

        setopt EXTENDED_GLOB
        for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
          ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
        done

  4. Set Zsh as your default shell:

        chsh -s /bin/zsh

  5. Open a new Zsh terminal window or tab.

### Troubleshooting

If you are not able to find certain commands after switching to *Prezto*,
modify the `PATH` variable in *~/.zprofile* then open a new Zsh terminal
window or tab.

Updating
--------

Pull the latest changes and update submodules.

    git pull && git submodule update --init --recursive

Usage
-----

Prezto has many features disabled by default. Read the source code and
accompanying README files to learn of what is available.

### Modules

  1. Browse */modules* to see what is available.
  2. Load the modules you need in *~/.zpreztorc* then open a new Zsh terminal
     window or tab.

### Themes

  1. For a list of themes, type `prompt -l`.
  2. To preview a theme, type `prompt -p name`.
  3. Load the theme you like in *~/.zpreztorc* then open a new Zsh terminal
     window or tab.

     ![sorin theme](http://i.imgur.com/nrGV6pg.png)

Customization
-------------

The project is managed via [Git][10]. It is highly recommended that you fork this
project; so, that you can commit your changes and push them to [GitHub][11] to
not lose them. If you do not know how to use Git, follow this [tutorial][12] and
bookmark this [reference][13].

Resources
---------

The [Zsh Reference Card][14] and the [zsh-lovers][15] man page are indispensable.

License
-------

(The MIT License)

Copyright (c) 2009-2011 Robby Russell and contributors.

Copyright (c) 2011-2015 Sorin Ionescu and contributors.

Copyright (c) 2015 Martin Zeman and contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[1]: http://www.zsh.org
[2]: https://github.com/sorin-ionescu/prezto
[3]: https://github.com/robbyrussell/oh-my-zsh
[4]: https://github.com/tarjoilija/zgen
[5]: https://github.com/N4M3Z/zsh-core/
[6]: https://github.com/sorin-ionescu/prezto/issues/860
[7]: https://github.com/N4M3Z/zsh-core/tree/enhance/modular
[8]: http://www.stack.nl/~dimitri/doxygen
[9]: https://github.com/Anvil/bash-doxygen
[10]: http://git-scm.com
[11]: https://github.com
[12]: http://gitimmersion.com
[13]: http://gitref.org
[14]: http://www.bash2zsh.com/zsh_refcard/refcard.pdf
[15]: http://grml.org/zsh/zsh-lovers.html
