#!/bin/bash

cd /opt/dellemc/diag/bin

./fantool --set --fan=all --speed=2500

./psutool --fanspeed=25

./fantool --set --fan=all --speed=2500