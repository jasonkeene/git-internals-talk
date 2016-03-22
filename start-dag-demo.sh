#!/bin/bash

T=$(pwd)
cd ~/workspace/loggregator
doitlive play -q $T/dag-session.sh
