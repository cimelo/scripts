#!/bin/sh

up_down() {
	TMP=` ls /tmp/back* 2>/dev/null `
	[ -z $TMP ] || B=` cat $TMP ` && VAL=` echo "$B $1" | bc `
	[ ` xbacklight ` = 0.000000 ] && xbacklight =$VAL || xbacklight $1
}

toggle() {
	TMPBACK=` ls /tmp/back* 2>/dev/null || echo 'mkstemp(/tmp/back-XXXXXX)' | m4 `
	[ -z $TMPBACK ] && exit 1
	[ ` xbacklight ` = 0.000000 ] && xbacklight =` cat $TMPBACK ` || ( xbacklight  > $TMPBACK && xbacklight =0 )
}

case $1 in
	c) up_down $2 ;;
	t) toggle ;;
esac
