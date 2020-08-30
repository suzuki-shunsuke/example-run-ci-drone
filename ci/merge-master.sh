#!/usr/bin/env bash

set -eux

cd "$(dirname "$0")/.."

if [ "$DRONE_SOURCE_BRANCH" = master ]; then
  exit 0
fi

if [ "${DRONE_BUILD_EVENT}" = pull_request ]; then
  ghc exec -- run-ci merge
else
  ghc exec -- run-ci merge --base master
fi

ghc exec -- git log -n 5 --pretty=oneline
