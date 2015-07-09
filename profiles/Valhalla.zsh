#!/bin/zsh

##
#  @file
#  @brief Z-Shell profile project-related functions and aliases
#
#  @author Martin Zeman <Martin.Zeman@cern.ch>

##
# Modules
#
zplugins=(
            "osx"
            "homebrew"
            "root"
            "dropbox"
            "trash"
         )

pmodload $zplugins

##
# Functions
#
function ElectroweakBosons()
{
    cd $HOME/Developer/Atlas/Frameworks/ElectroweakBosons
    export PROJECT_SOURCE_DIR=`pwd`
    source AnalysisBase/scripts/setup_WW.sh
    #open ElectroweakBosons.creator
    open /Applications/Qt\ Creator.app
    open ElectroweakBosons.sublime-project
}

function ElectroweakBosons.errors()
{
    cd $EWPATH/AnalysisWW/scripts/run
    cd $1
    grep ERROR */*.log
}

function EWHistograms()
{
    cd $HOME/Developer/Atlas/Frameworks/EWHistograms
    export PROJECT_SOURCE_DIR=`pwd`
    open /Applications/Qt\ Creator.app
    open EWHistograms.sublime-project
}

function EWHistograms.get.histograms()
{
    source /Users/mzeman/Developer/Atlas/Frameworks/EWHistograms/Scripts/getHists_ui5.sh
}

function EWHistograms.get.ntuples()
{
    source /Users/mzeman/Developer/Atlas/Frameworks/EWHistograms/Scripts/getNtup_ui5.sh
}

function EWUnfolding()
{
    cd $HOME/Developer/Atlas/Frameworks/EWUnfolding
    #open EWUnfolding.creator
    open /Applications/Qt\ Creator.app
    open EWUnfolding.sublime-project
}

function Filelists()
{
    cd ${HOME}/Developer/Atlas/Filelists
    subl .
}

## Obsolete
function EWPATH.sync.repositories()
{
    SOURCE=$EWPATH
    if [ -z $1 ]; TARGET=$HOME/Developer/Atlas/Frameworks/ElectroweakBosons8TeV

    rsync -tvzrlpgoD --exclude "*.root" --exclude "*Dict*" --exclude "*.o" --exclude "*.d" --exclude "*.par" --exclude "**.svn**" \
    $SOURCE/ $TARGET
}

