#!/bin/bash
BRANCH=$(git branch | cut -d ' ' -f2)
REMOTE=$(git remote)
git add .
git commit -m $(date "+%Y%m%d")
git push -u $REMOTE $BRANCH