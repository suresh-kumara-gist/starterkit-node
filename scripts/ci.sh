#!/bin/bash
#
# Run the continuous integration script; make sure everything works as expected.
#
# Designed to be run on a new virtual machine with Docker, especially on
# Circle CI, from ./.circleci/config.yml.
set -e

source ./scripts/lib/start.source.sh

# We need to create some directories because if they are created with
# ./scripts/end-to-end-tests.sh, Circle CI will not be able to delete them
# within the destroy.sh script.
mkdir -p ./do-not-commit/screenshots
mkdir -p ./do-not-commit/dom-captures

echo "$MYINDENT"'=> Initial deployment'
./scripts/deploy.sh
echo "$MYINDENT"'=> Running ./scripts/test.sh'
./scripts/test.sh
echo "$MYINDENT"'=> Incremental deployment'
./scripts/deploy.sh
echo "$MYINDENT"'=> End-to-end tests'
./scripts/end-to-end-tests.sh
echo "$MYINDENT"'=> Destroy'
./scripts/destroy.sh

source ./scripts/lib/end.source.sh

echo ""
echo " ===> All done running continuous integration tests!"
echo ""
