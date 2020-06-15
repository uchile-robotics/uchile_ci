#!/bin/sh -l

# ================================================
# Run Scripts
# ================================================

FAILED=false

# XML Lint
if ! sh /lint/xml.sh; then
    export FAILED=true
fi


# ================================================
# Run Scripts
# ================================================
if [ "${FAILED}" = true ]; then
    cat <<EOF
Lint checks failed!.
Please verify the log above.

If the linter throws an error and you believe your file is ok,
please contact me: Matias Pavez, matias.pavez.b@gmail.com
EOF
    exit 1
fi
echo "Lint checks succeeded!."
exit 0