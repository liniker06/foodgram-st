#!/bin/bash

set -a
source .env
set +a


echo "username: ref+vault://secrets/db#/username" | vals eval -f -



helm secrets --evaluate-templates --backend vals upgrade --install foodgram ./ -n foodgram \ -f values.yaml

