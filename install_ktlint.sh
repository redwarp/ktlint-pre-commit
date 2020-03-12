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

export KTLINT=ktlint_3_60_0