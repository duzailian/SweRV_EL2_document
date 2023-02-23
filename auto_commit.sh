#!/bin/bash

ts=`date +"%Y-%m-%d %H:%M.%S"`
git add *
git commit --all -m '${ts}'
git push
