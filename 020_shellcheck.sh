apt-get install shellcheck

#apt-get install cabal-install
#
#cabal update
#
#cabal install shellcheck
#
#ln -s ~/.cabal/bin/shellcheck ~/bin/shellcheck
#
#EXCLUDE_CODE_LIST="SC1090,SC1091,SC2154,SC2001,SC2002"
#
#echo > <<"EOF"
## Run test excluding certain rules
#EXCLUDE_CODE_LIST=${EXCLUDE_CODE_LIST}
#shellcheck -e $EXCLUDE_CODE_LIST $file
#EOF
#
#echo > <<"EOF"
## Run test against all scripts under a folder
#EXCLUDE_CODE_LIST=${EXCLUDE_CODE_LIST}
#find . -name "*.sh" | xargs \
#    shellcheck -e $EXCLUDE_CODE_LIST $file
#EOF
