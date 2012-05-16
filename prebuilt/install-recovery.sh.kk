#!/system/bin/sh

if busybox test ! -f /sdcard/recovery.img; then
	echo no /sdcard/recovery.img
	exit 1
fi

cat /sdcard/recovery.img > /dev/block/nandg
sync; sync; sync

echo done
