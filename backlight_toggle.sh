#!/bin/sh

TMPBACK=` ls /tmp/back* 2>/dev/null || echo 'mkstemp(/tmp/back-XXXXXX)' | m4 `
[ -z $TMPBACK ] && exit 1
[ ` xbacklight ` = 0.000000 ] && xbacklight =` cat $TMPBACK ` || ( xbacklight  > $TMPBACK && xbacklight =0 )
