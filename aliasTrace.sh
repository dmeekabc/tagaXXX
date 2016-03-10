#####################################################
# Copyright 2016 IBOA Corp
# All Rights Reserved
#####################################################

TAGA_DIR=~/scripts/taga
source $TAGA_DIR/config

# validate input
if [ $# -eq 1 ]; then
   echo; echo $0 : $MYIP :  executing at `date`; echo
else
   echo; echo $0 requires one parameter, exiting with no action...; echo
   exit
fi

# ensure proper setup
echo Please confirm that the following has been performed:
echo "alias > aliasExamples.txt"

# issue confirmation prompt
./confirm.sh

# check the response
let response=$?
if [ $response -eq 1 ]; then
  echo; echo Confirmed, $0 continuing....; echo
else
  echo; echo Not Confirmed, $0 exiting with no action...; echo
  exit
fi

#source ~/.bashrc

# note, prior to running this script, # run the following: 
#
#    alias > $TAGA_DIR/aliasExamples.txt
#
source ./aliasExamples.txt

let i=1

aliasNext=`alias $1`
RET=$?
echo $i: $aliasNext
#echo

aliasNext=`echo $aliasNext | cut -d\' -f 2`
RET=$?

while [ $RET -eq 0 ] 
do
   # increment the count
   let i=$i+1

   echo $aliasNext
   aliasNext=`alias $aliasNext` 2>/dev/null
   RET=$?
   if [ $RET -eq 0 ]; then
      echo
      echo $i: $aliasNext
#      echo
      #echo RET:$RET
      aliasNext=`echo $aliasNext | cut -d\' -f 2`
   else
      echo; echo End of the Trace 
   fi
done

