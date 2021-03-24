#!/bin/sh
set -e
cd $(dirname "$0")/..
cd _notebooks/

ERRORS=""

# papermill --kernel python3 "2021-01-30-herd-immunity-ii.ipynb" "2021-01-30-herd-immunity-ii.ipynb" 
# papermill --kernel python3 "2021-02-08-herd-immunity-iii.ipynb" "2021-02-08-herd-immunity-iii.ipynb" 


# Emit Errors If Exists So Downstream Task Can Open An Issue
if [ -z "$ERRORS" ]
then
    echo "::set-output name=error_bool::false"
else
    echo "These files failed to update properly: ${ERRORS}"
    echo "::set-output name=error_bool::true"
    echo "::set-output name=error_str::${ERRORS}"
fi
