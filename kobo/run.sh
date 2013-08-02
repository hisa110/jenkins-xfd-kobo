#!/bin/sh

echo "Running run.sh" > /mnt/onboard/command-output.txt
date >> /mnt/onboard/command-output.txt
ifconfig >> /mnt/onboard/command-output.txt


mkdir -p /dev/pts
mount -t devpts devpts /dev/pts
/bin/busybox telnetd -l /bin/sh &


/bin/sh /mnt/onboard/to-usb.sh

sleep 15
/bin/sh /mnt/onboard/nickel.sh
