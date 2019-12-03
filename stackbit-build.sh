#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5de5fb6ecd4f49001b439f6c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5de5fb6ecd4f49001b439f6c
curl -s -X POST https://api.stackbit.com/project/5de5fb6ecd4f49001b439f6c/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5de5fb6ecd4f49001b439f6c/webhook/build/publish > /dev/null
