#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Suspend\n  Hibernate\n  Log Out\n  Lock" | dmenu )

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Suspend") systemctl suspend-then-hibernate ;;
	"  Hibernate") systemctl hibernate ;;
	"  Log Out") i3-msg exit ;;
	"  Lock") python3 ~/.config/i3/screen_lock.py  ;;
	*) exit 1 ;;
esac
