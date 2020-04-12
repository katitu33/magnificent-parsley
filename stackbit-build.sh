#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e926ee3801a8400196a742b/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e926ee3801a8400196a742b
curl -s -X POST https://api.stackbit.com/project/5e926ee3801a8400196a742b/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e926ee3801a8400196a742b/webhook/build/publish > /dev/null
