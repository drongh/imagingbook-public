#!/bin/bash
echo "Listing remote GIT repos:"
echo ""
git remote -v
git submodule foreach --recursive 'git remote -v'
echo ""
read -rsp $'Done. Press any key to quit...\n' -n1 key
