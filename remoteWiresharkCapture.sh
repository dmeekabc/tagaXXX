#####################################################
# Copyright 2016 IBOA Corp
# All Rights Reserved
#####################################################

TAGA_DIR=~/scripts/taga
source $TAGA_DIR/config

REMOTE_NODE=$REBOOT_ONE_LIST
REMOTE_NODE_ITFC=$REMOTE_ONE_LIST_ITFC

echo $0 : $MYIP remote to $REMOTE_NODE :  executing at `date`

if [ $1 -eq 1 ] ; then
   echo mkfifo /tmp/packet_capture
   mkfifo /tmp/packet_capture
elif [ $1 -eq 2 ] ; then
   ssh $REMOTE_NODE "tcpdump -s 0 -U -n -w - -i $REMOTE_ONE_LIST_ITFC not port 22" > /tmp/packet_capture
elif [ $1 -eq 3 ] ; then
   echo sudo wireshark -k -i /tmp/packet_capture
   sudo wireshark -k -i /tmp/packet_capture
else
   echo Error, $0 expects 1 input param of value 1 thru 3, exiting with no action...
fi
