####################################################
# Copyright 2016 IBOA Corp
# All Rights Reserved
#####################################################

TAGA_DIR=~/scripts/taga
source $TAGA_DIR/config

rm delta.out; touch delta.out

cp ppc.out tmp.txt
let lines=`cat tmp.txt | wc -l`

let i=0
while [ $lines -gt 0 ] 
do

   input=`head -n 1 tmp.txt`
   echo $input > input.txt
   read input1 input2 < input.txt
#   echo input1: $input1 
#   echo input2: $input2 

   let delta=$input1-$input2
#   echo $delta
   echo $delta >> delta.out

   let i=$i+1

   let MOD=$i%100

   let lines=`cat tmp.txt | wc -l`

   if [ $MOD -eq 0 ] ; then
      echo $i : $lines remain
   fi

   cat tmp.txt | sed 1d > tmp2.txt
   mv tmp2.txt tmp.txt


done


