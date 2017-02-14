#!/usr/bin/env bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$BRANCH" != "dev" ]]; then
    echo 'Aborting script because you are not on the right git branch (dev).';
    exit 1;
fi

# CM => commit message, default is "set"
CM=${1:-set} &&


if [ "$2" == "publish" ]; then
   npm version patch --force -m "Upgrade for several reasons" &&    # bump version
   echo "bumped version"
else
  echo "note that we are *not* publishing to NPM"
fi


git add . &&
git add -A &&
git commit --allow-empty -am "pdev:$CM" &&
git push &&

git checkout master &&
git merge -X theirs -m  "pdev:$CM" dev &&

git add . &&
git add -A &&
git commit --allow-empty -am "pdev:$CM" &&
git push &&

if [ "$2" == "publish" ]; then
   npm publish .  &&    # bump version
   echo "published suman to NPM"
fi


git checkout dev