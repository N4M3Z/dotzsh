##
#  @file
#      wordchar/init.zsh
#
#  @brief
#      Z-Shell character skipping using extended wordchars
#
#  @author
#      Martin Zeman <martin.zeman@protonmail.ch>
#
extended_wordchars='*?_-.[]~=&;!#$%^(){}<>:@,\\';
extended_wordchars_space="${my_extended_wordchars} "
extended_wordchars_slash="${my_extended_wordchars}/"

##
# Aliases
#
source ${0:h}/functions.zsh

##
# Key Bindings
#
source ${0:h}/bindings.zsh
