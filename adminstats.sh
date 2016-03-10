#####################################################
# Copyright 2016 IBOA Corp
# All Rights Reserved
#####################################################

TAGA_DIR=~/scripts/taga
source $TAGA_DIR/config


echo IP Usage: $INTERFACE: `ifconfig $INTERFACE | grep RX | grep bytes`

