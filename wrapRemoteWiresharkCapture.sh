#####################################################
# Copyright 2016 IBOA Corp
# All Rights Reserved
#####################################################

TAGA_DIR=~/scripts/taga
source $TAGA_DIR/config

echo $0 : $MYIP :  executing at `date`

./remoteWiresharkCapture.sh 1
sleep 5
./remoteWiresharkCapture.sh 2 &
sleep 5
./remoteWiresharkCapture.sh 3

