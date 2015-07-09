##
#  @file
#  @brief MacPorts Plugin
#
#  @author N4M3Z <https://github.com/N4M3Z>
#  @author Sorin Ionescu <https://github.com/sorin-ionescu>
#
#  @note Original version from oh-my-zsh repository

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
    return 1
fi

##
# Paths
#
# Set the list of directories that Zsh searches for programs.
function port.setup()
{
    export PORTPATH=/opt/local
    export PATH=${PORTPATH}/bin:${PORTPATH}/sbin:$PATH
}

# Automatic setup
if [ -z "${PORTPATH}" ] ; then
    echo -e "\033[32mSetting up MacPorts ...\033[0m"
    port.setup
fi

##
# Functions
#
function port.clean()
{
    sudo port clean --all installed
}

function port.install()
{
    sudo port install "$1"
}

function port.install.all()
{
    sudo mkdir -p ${PORTPATH}
    cd ${PORTPATH}
    sudo svn checkout https://svn.macports.org/repository/macports/trunk
    cd ${PORTPATH}/trunk/base
    sudo ./configure --enable-readline --prefix=/Ports
    sudo make
    sudo make install
    sudo make distclean
    port.selfupdate
}

function port.uninstall()
{
    sudo port uninstall "$1"
}

function port.uninstall.all()
{
    sudo port -fp uninstall installed
}

function port.uninstall.inactive()
{
    sudo port uninstall inactive
}

function port.uninstall.self()
{
    port.uninstall.all
    sudo rm -rf ${PORTPATH}
    sudo rm -rf /Applications/DarwinPorts
    sudo rm -rf /Applications/MacPorts
    sudo rm -rf /Library/LaunchDaemons/org.macports.*
    sudo rm -rf /Library/Receipts/DarwinPorts*.pkg
    sudo rm -rf /Library/Receipts/MacPorts*.pkg
    sudo rm -rf /Library/StartupItems/DarwinPortsStartup
    sudo rm -rf /Library/Tcl/darwinports1.0
    sudo rm -rf /Library/Tcl/macports1.0
    sudo rm -rf ~/.macports
}

function port.update()
{
    sudo port upgrade "$1"
}

function port.update.outdated()
{
    sudo port upgrade outdated
}

function port.update.self()
{
    sudo port selfupdate
}

#
# Aliases
#
alias portc='port.clean'
alias porti='port.install'
alias ports='port search'

alias portu='port.update'
alias portU='port.update.self && port.update.outdated'

alias portx='port.uninstall'
alias portX='port.uninstall.inactive'
