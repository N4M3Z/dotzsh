##
#  @file
#  @brief UI5 enviroment setup
#  @author Martin Zeman <Martin.Zeman@cern.ch>

## Plugins
if ! zgen saved; then
    zgen load N4M3Z/zsh-core plugins/grid
fi

## Environment
export TEST_AREA=$HOME/Developer/Atlas/Frameworks
export SETUP_AREA=$HOME/Setup
export ATLAS_AREA=/raid7_atlas2/Atlas
export PORTSYS=/raid7_atlas/kepka/atlsoft5/root_v5.30.02.Linux-slc5_amd64-gcc4.3/root

export DQ2_LOCAL_SITE_ID=PRAGUELCG2_SCRATCHDISK

## Functions
# Boost
function boost.setup()
{
#    export BOOSTDIR=${PORTSYS}
#    export BOOSTINCDIR=${BOOSTDIR}/include
#    export BOOSTLIBDIR=${BOOSTDIR}/lib
#    export BOOSTFLAGS=${BOOSTINCDIR}
#    export BOOSTLIB=${BOOSTLIBDIR}
}

# ROOT
function root.setup()
{
    source ${SETUP_AREA}/setup_root.sh
}

## Athena
export AtlasSetup=/afs/cern.ch/atlas/software/dist/AtlasSetup
alias asetup='source $AtlasSetup/scripts/asetup.sh'

function queue()
{
    qstat -u mzeman
}

function ElectroweakBosons
{
    cd $HOME/Developer/Atlas/Frameworks/ElectroweakBosons
    source scripts/setup_prague.sh
}

function ElectroweakBosons.goto()
{
    cd $HOME/Developer/Atlas/Frameworks/ElectroweakBosons
}

function ElectroweakBosons.checkout()
{
    kinit
    voms-proxy-init -voms atlas
    cd /home/mzeman/Developer/Atlas/Frameworks
    svn co https://mzeman@svn.cern.ch/reps/atlasinst/Institutes/CERN/ElectroweakBosons/trunk ElectroweakBosons
    cd /home/mzeman/Developer/Atlas/Frameworks/ElectroweakBosons
    source $HOME/setups/setup_root.sh
    source scripts/get_allcode_2012.sh
    source scripts/setup_prague.sh
    make
    cd ${EWPATH}/AnalysisWW/scripts/run
    ./createSkeleton.sh
    ./createMasterSettings.py settingsStearing_WW8TeV.txt
}

function ElectroweakBosons.send_Data()
{
    cd ${EWPATH}AnalysisWW/scripts/run
    ./sendAnalysis.py masterSettings.8TeV.Data.All.txt
    source submit.sh
}

function ElectroweakBosons.send_MC()
{
    cd ${EWPATH}AnalysisWW/scripts/run
    ./sendAnalysis.py masterSettings.8TeV.MC.All.txt
    source submit.sh
}

function ElectroweakBosons.send_MCSyst()
{
    cd ${EWPATH}AnalysisWW/scripts/run
    ./sendAnalysis.py masterSettings.8TeV.MC.Syst.txt
    source submit.sh
}

function Filelists()
{
    cd ${ATLAS_AREA}/Atlas/Filelists
}
