#!/bin/sh -l

DIR="${GITHUB_WORKSPACE}"
echo "======================="
echo "= Checking file size  ="
echo "======================="

FAILED=false

_max_size="400" # kB
_max_size_B=$(awk "BEGIN {printf \"%d\",${_max_size}*1024}")
_max_size_MB=$(awk "BEGIN {printf \"%.2f\",${_max_size}/1024}")

for FILE in $(find "${DIR}" -type f -not -path '*/\.git/*' -exec ls {} \;); do
    _size=$(stat --format="%s" "$FILE")

    if [ "${_size}" -gt "${_max_size_B}" ]; then
        _human_size=$(ls -lh "$FILE"  | awk '{ print $5 }')
        echo "[FAILED]: OVERSIZED FILE: $FILE"
        echo " - The file is too big for git: ${_human_size} (max: ${_max_size_MB} MB)"
	FAILED=true
    fi
done;

if [ "${FAILED}" = true ]; then
    echo ""
    echo "Problems found."
    exit 1
fi
echo "No problems found."
exit 0

