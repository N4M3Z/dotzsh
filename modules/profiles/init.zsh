# Detect hostname for host-dependent profiles
hostname=(${(s:.:)HOST})
for i in {${#hostname}..1}; do
    profile=${(j:.:)${hostname[$i,${#hostname}]}}
done

##
# Profiles
#
# @note
#       Loads custom profile for the local machine and each domain or subdomain it belongs to. (e.g. com, example.com and foo.example.com)
#
echo -e "\033[32mSetting up profile for ${profile} ...\033[0m"
pfileload ${ZDOTDIR:-$HOME}/.zprezto/profiles/$profile.zsh
