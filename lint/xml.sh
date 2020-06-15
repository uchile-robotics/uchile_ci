#!/bin/sh -l

DIR="${GITHUB_WORKSPACE}"
echo "====================="
echo "= Linting XML files ="
echo "====================="
find "${DIR}" -type f \( \
     -name "*.xml"    -o \
     -name "*.html"   -o \
     -name "*.launch" -o \
     -name "*.test"   -o \
     -name "*.urdf"   -o \
     -name "*.xacro"  -o \
     -name "*.sdf"    -o \
     -name "*.aiml"   \
     \) -exec xmllint --noout {} +
