#!/usr/bin/env sh
mkdir -p .cache
cd .cache
if [ ! -f ktlint ]
then
    curl -sSLO https://github.com/pinterest/ktlint/releases/download/0.36.0/ktlint
    chmod a+x ktlint
fi
cd ..

changed_kotlin_files=$(git diff --cached --name-only --diff-filter=ACMR | grep ".*kt$" )
echo $changed_kotlin_files
.cache/ktlint $changed_kotlin_files
