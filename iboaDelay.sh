#####################################################
# Copyright 2016 IBOA Corp
# All Rights Reserved
#####################################################
TAGA_DIR=~/scripts/taga
source $TAGA_DIR/config

let DELAY=$1

date

while [ $DELAY -ge 0 ]; 
do

   # if we have a modulus param, only print on the modulus
   if [ $# -eq 2 ]; then 
      let MODULUS=$2
      let MODULUS_VAL=$DELAY%$MODULUS
      if [ $MODULUS_VAL -eq 0 ]; then
         echo $DELAY
      fi
   else
     echo $DELAY
   fi

   let DELAY=$DELAY-1

   # don't sleep if we have hit 0
   if [ $DELAY -ge 0 ]; then
     sleep 1
   fi

done

date
