#!/bin/sh

TMPIMG=` ls /tmp/tmp_img* 2>/dev/null || echo 'mkstemp(/tmp/tmp_img-XXXXXX)' | m4 `

curl --output $TMPIMG $1 && sxiv -bfaZs w $TMPIMG
