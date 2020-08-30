#!/usr/bin/env bash

set -eu

cd "$(dirname "$0")/.."

if [ "$DRONE_SOURCE_BRANCH" != master ]; then
  exit 0
fi

ghc exec -- run-ci update-pr --base master
