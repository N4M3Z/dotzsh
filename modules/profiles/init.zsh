# Detect hostname for host-dependent profiles
hostname=${HOST[(ws:.:)0]}

##
# Profiles
#
# @note
#       Loads custom profile for the local machine and each domain or subdomain it belongs to. (e.g. com, example.com and foo.example.com)
#
echo -e "\033[32mSetting up profile for ${hostname} ...\033[0m"
dotzsh-file-load ${ZSH}/profiles/${hostname}.zsh
