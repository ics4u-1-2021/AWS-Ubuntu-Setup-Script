#!/bin/bash

# do the 3 step:
#  - git add -A
#  - git commit -m "..."
#  - git push origin main

git add -A
git commit -m "$1"
git push origin main
