#!/bin/sh
set -e

if [ $# -ne 2 ]; then
    echo "Script execution failed. Specify mandatory arguments e.g.: sh $0 UPSTREAM_URL ORIGIN_URL"
    exit 1
fi

upstream_url=$1
origin_url=$2
 
if ! git remote | grep -q '^upstream$' ; then
  git remote add upstream $upstream_url
  git remote set-url --push upstream none
  git remote set-url --push origin $origin_url
fi

echo "Upstream set to: $(git remote get-url upstream)"

