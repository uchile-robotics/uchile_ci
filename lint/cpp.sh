#!/bin/sh -l

DIR="${GITHUB_WORKSPACE}"
echo "======================="
echo "= Linting C/C++ files ="
echo "======================="
find "${DIR}" -type f \( \
     -name "*.c"    -o \
     -name "*.cpp"  -o \
     -name "*.h"    -o \
     -name "*.hpp"     \
     \) -not -path '*/\.git/*' -exec cppcheck --error-exitcode=1 --enable=warning --language=c++  --quiet --verbose {} +
