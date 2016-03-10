#####################################################
# Copyright 2016 IBOA Corp
# All Rights Reserved
#####################################################

TAGA_DIR=~/scripts/taga
source $TAGA_DIR/config

if [ $# -eq 1 ]; then
   echo; echo $0 : $MYIP :  executing at `date`; echo
else
   echo; echo $0 requires one parameter, exiting with no action...; echo
   exit
fi

source ~/.bashrc

# note, prior to running this script, # run the following: 
#
#    alias > $TAGA_DIR/aliasExamples.txt
#
source ./aliasExamples.txt

aliasNext=`alias $1`
RET=$?
echo $aliasNext
echo

aliasNext=`echo $aliasNext | cut -d\' -f 2`
RET=$?

while [ $RET -eq 0 ] 
do
   echo $aliasNext
   aliasNext=`alias $aliasNext` 2>/dev/null
   RET=$?
   if [ $RET -eq 0 ]; then
      echo
      echo $aliasNext
      echo
      #echo RET:$RET
      aliasNext=`echo $aliasNext | cut -d\' -f 2`
   else
      echo; echo End of the line
   fi
done

