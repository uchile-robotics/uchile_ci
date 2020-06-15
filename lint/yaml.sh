#!/bin/sh -l
# Provides yamllint interface for uchile_ci.
#
# Strict mode (warnings as errors) can be enabled by adding '-s' option.
#
# See also: man yamllint

DIR="${GITHUB_WORKSPACE}"
echo "======================"
echo "= Linting YAML files ="
echo "======================"

# TODO: should we allow utf-8 characters?
LANG=C.UTF-8 yamllint -c /lint/yamllint.yml "${DIR}"
