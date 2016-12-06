#!/usr/bin/env bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$BRANCH" != "dev" ]]; then
    echo 'Aborting script because you are not on the right git branch (dev).';
    exit 1;
fi

# CM => commit message, default is "set"
CM=${1:-set} &&

git add . &&
git add -A &&
git commit --allow-empty -am "pdev:$CM" &&
git push &&

git checkout master &&
git merge -X theirs dev &&

git add . &&
git add -A &&
git commit --allow-empty -am "pdev:$CM" &&
git push &&

npm publish . &&

git checkout dev