#!/bin/bash
export PATH=$PATH:/usr/local/maven/bin
echo Stopping existing jobs...
nomad stop $(nomad status | grep spotbuy | awk -F ' ' '{ print $1}') > /dev/null 2>&1