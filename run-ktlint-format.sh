#!/usr/bin/env sh
mkdir -p .cache
cd .cache
if [ ! -f ktlint_3_60_0 ]
then
    curl -sSLO https://github.com/pinterest/ktlint/releases/download/0.36.0/ktlint
    mv ktlint ktlint_3_60_0
    chmod a+x ktlint_3_60_0
fi
cd ..

changed_kotlin_files=$(git diff --cached --name-only --diff-filter=ACMR | grep ".*kt$" )
echo $changed_kotlin_files
.cache/ktlint_3_60_0 -F $changed_kotlin_files
