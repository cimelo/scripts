#!/bin/sh

bluetoothctl paired-devices | sed 's/Device//' | dmenu
