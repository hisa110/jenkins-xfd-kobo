#!/bin/sh

killall nickel
/bin/busybox insmod /drivers/ntx508/usb/gadget/arcotg_udc.ko
/bin/busybox insmod /drivers/ntx508/usb/gadget/g_ether.ko
ifconfig usb0 192.168.1.100

