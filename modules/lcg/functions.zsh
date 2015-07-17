##
#  @file
#      lcg/functions.zsh
#
#  @brief
#      Useful functions for LHC Computing Grid.
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#

# Load Ganga function
function setup-ganga()
{
    green "Loading Ganga enviroment ..."
    # automatic LXPLUS Ganga setup
    source /afs/cern.ch/sw/ganga/install/etc/setup-atlas.sh # LATEST
    #source /afs/cern.ch/sw/ganga/install/etc/setup-atlas.sh 5.5.10-hotfix2 # SPECIFY VERSION
}

# Load Panda function
function setup-pathena()
{
    green "Loading Panda enviroment ..."
    # automatic LXPLUS Panda setup
    source /afs/cern.ch/atlas/offline/external/GRID/DA/panda-client/latest/etc/panda/panda_setup.sh
}

## Load DQ2 function
function setup-dq2()
{
    green "Loading DQ2 enviroment ..."
    # source /afs/cern.ch/atlas/offline/external/GRID/ddm/DQ2Clients/setup.sh # BASH only
    source /afs/cern.ch/atlas/offline/external/GRID/ddm/DQ2Clients/setup.zsh # zshell only
    voms-proxy-init --voms atlas
}

## Load AMI database
function setup-ami()
{
    green "Loading AMI enviroment ..."
    CURRENT_DIR=`pwd` # save current directory
    cd ${HOME}/Ami
    source aliasMaker.sh
    cd ${CURRENT_DIR} # return to current directory
    source /afs/cern.ch/project/gd/LCG-share/current/etc/profile.d/grid_env.sh
    voms-proxy-init --voms=atlas
}

## Install AMI database
function install-ami()
{
    green "Installing AMI database ..."
    CURRENT_DIR=`pwd` # save current directory
    source /afs/cern.ch/atlas/software/builds/AtlasCore/16.0.1/Database/Bookkeeping/AMIClients/pyAMI/cmt/setup.sh
    cd ${HOME}/Ami
    python /afs/cern.ch/atlas/software/builds/AtlasCore/16.0.1/Database/Bookkeeping/AMIClients/pyAMI/share/makeAMICommandList.py
    source aliasMaker.sh
    cd ${CURRENT_DIR} # return to current directory
}
