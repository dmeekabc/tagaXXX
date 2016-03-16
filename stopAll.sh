#####################################################
# Copyright 2016 IBOA Corp
# All Rights Reserved
#####################################################

TAGA_DIR=~/scripts/taga
source $TAGA_DIR/config

for target in $targetList
do
   if [ $target == $MYIP ]; then
      echo skipping self for now...
      continue
   fi
   echo processing, cleaning $target
   ssh -l $MYLOGIN_ID $target $TAGA_DIR/stop.sh  <$TAGA_DIR/passwd.txt
done

# do myself last
ssh -l $MYLOGIN_ID $MYIP $TAGA_DIR/stop.sh  <$TAGA_DIR/passwd.txt

