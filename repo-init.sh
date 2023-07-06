#!/usr/bin/env bash

# Run in repo root directory
# Manual steps:
#   1. create (empty) repo on GH
#   2. set access in settings
#   3. initialize local repo
#   4. add remote
#   5. copy over code, readme

# EXPECTATIONS: main branch
part_init() {
    git add rpn-calc/src
    git add .gitignore
    git commit -m "initial commit: add basic RPN calculator

Parses string input and handles a handful of operators.
Includes a couple of unit tests.
"

    git add rpn-calc/docs
    git add README.md
    git commit -m "add readme"
    # MANUAL: git push -u origin main
}

# MANUAL: copy .github folder over
part_ci_pr() {
    git checkout -b ci-more-tests
    git add .github/
    git commit -m "add GitHub Actions workflow for running unit tests

Triggers on every commit to main, and every PR sync.
"
    git push -u origin ci-more-tests

    # MANUAL: Go and create the PR. We need to do the commits separately for the
    # CI to run. If you do it wrong, make some change (a nothing change is fine,
    # just update the commit hash) and force push.

    echo "

def test_subtract():
    commands = ['2.0', '1.0', '-']
    assert main(commands) == 1.0\
" >> rpn-calc/src/tests/test_calculate.py
    git add rpn-calc/src/tests/test_calculate.py
    git commit -m "add a subtraction unit test

Test currently failing."

    git push
}

part_integer_mode() {
    git checkout main
    git checkout -b integer-mode
    # TODO: make changes
    git commit -m "calculator from using floats to integers

Division is now floor division, where 3 // 2 == 1."
    git push -u origin integer-mode
}
