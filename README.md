# uchile_ci (WIP)

Continuous Integration scripts for uchile-robotics repositories.

## Overview

## Usage

### Repository Badges

https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow#adding-a-workflow-status-badge-to-your-repository
- License
- Build
- Test
- Lint
- Coverage

## Design

- matrix for melodic/18.04 + kinetic/16.04
- Docker for ROS?

## Jobs

Languages:
- Python
- C++
- BASH
- XML
- YAML

Checks:
- Small Checks
  - Lint
  - see uchile system hooks
- Package Build and Test
- Project Build and Test
- Platform Specific tests: Bender/Maqui

## Workflows

The following workflows are designed to run at different development stages: commit, pre-merge, merge, post-merge. 

Each one provides a deeper level of testing, but takes longer to run. For instance, at the commit stage. the checks should be simple and fast, but the whole system should to be checked before and after merge.

### Check

Overview: The check allows fast retrieval of build/test results on a per commit basis.
Trigger: Last pushed commit on a branch.
Manual Trigger: "manual-check".
Timeout: 30 min.
Scope: Limited build/test suite, usually only unit/integration for the current package/repository.
Stop Conditions: Timeout, Any job fails, New commit.
Jobs:
- TODO

### Gate

Overview: The gate checks most off the system and is a prerequisite for a branch to be merged into develop/master.
Trigger: Check is green + Merge label.
Manual Trigger: "manual-gate".
Timeout: 2 hr.
Scope: Build/tests most of the system.
Stop Conditions: Timeout, Any job fails, New Commit. Merge label is removed.
Jobs:
- TODO

### Merge

Overview: Check if the branch has passed the gate. Otherwise, deny the merge. Should be very fast. Branch is deleted after merge.
Trigger: Gate is green + merge label.
Manual Trigger: None.
Timeout: 10 min?.
Scope: Check gate is green, merge label is on and no merge conflicts.
Stop Conditions: Timeout, Any Job fails, New Commit.
Jobs:
- TODO

### Post

Overview: Checks a merged branch did not break the build. Allows to track guilty merge commit.
Trigger: After merge.
Manual Trigger: None.
Timeout: None?
Scope: Check full build/test suite.
Stop Conditions: Jobs are independent. CI timeout.
Jobs:
- TODO

## References

Examples
- Python Black
  - https://github.com/psf/black/blob/master/.travis.yml
  - https://github.com/psf/black/blob/master/.github/workflows/test.yml
  - https://github.com/psf/black/blob/master/.github/workflows/lint.yml
  - https://github.com/psf/black/blob/master/.flake8
  - https://github.com/psf/black/blob/master/.coveragerc

CI Frameworks
- https://travis-ci.com/
