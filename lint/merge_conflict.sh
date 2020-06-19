#!/bin/sh -l

set -eu

DIR="${GITHUB_WORKSPACE}"
echo "================================"
echo "= Checking for merge conflicts ="
echo "================================"

if grep -lr -R --exclude-dir=.git '^<<<<<<<' "${DIR}"; then
    printf "\033[1;31mFound merge conflicts.\033[0m\n"
    exit 1;
fi

if grep -lr -R --exclude-dir=.git '^>>>>>>>' "${DIR}"; then
    printf "\033[1;31mFound merge conflicts.\033[0m\n"
    exit 1;
fi

printf "\033[0;32mNo merge conflicts found.\033[0m\n"
exit 0;
