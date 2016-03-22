#!/bin/bash

T=$(pwd)
cd ~/workspace/loggregator
git co master
doitlive play -q $T/refs-session.sh
