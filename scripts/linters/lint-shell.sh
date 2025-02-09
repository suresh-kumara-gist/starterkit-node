#!/bin/bash
#
# Lint files; make sure they follow style guidelines.
set -e

source ./scripts/lib/start.source.sh

echo "$MYINDENT"'=> Linting shell scripts'
find . -name "*.sh" -print0 | \
  xargs -0 docker run --rm -v "$(pwd)":/code dcycle/shell-lint

source ./scripts/lib/end.source.sh
