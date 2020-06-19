#!/bin/sh -l

DIR="${GITHUB_WORKSPACE}"
echo "========================"
echo "= Linting Python files ="
echo "========================"

# Flake8 setup
# ------------------------------------
# see $ flake8 --help
#
# code list: https://flake8.readthedocs.org/en/latest/warnings.html
OPTIONS=""

## show statistics
OPTIONS=$OPTIONS" --statistics"

## show source
OPTIONS=$OPTIONS" --show-source"


## Error Codes to ignore
# - C***: McCabe complexity plugin
# - F403: ‘from module import *’ used; unable to detect undefined names
OPTIONS=$OPTIONS" --ignore=C"

OPTIONS=$OPTIONS",E2,E3"
OPTIONS=$OPTIONS",W1,W2,W3"
OPTIONS=$OPTIONS",E126,E127,E128"
#OPTIONS=$OPTIONS",E121,E122,E123,E124,E125,E126,E127,E128,E129,E131,E133"
OPTIONS=$OPTIONS",F401"
OPTIONS=$OPTIONS",F841"
OPTIONS=$OPTIONS",E501"


## Error Codes to include
# i assume the remaining codes are catched by flake8 
#SELECT=$SELECT" --select=F402,F404,F8"

## max-line-length:
# - recommended: 79 (in order to view files side by side)
OPTIONS=$OPTIONS" --max-line-length=120"

find "${DIR}" -type f -not -path '*/\.git/*' -name "*.py"
