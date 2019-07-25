#!/bin/bash
export PATH=$PATH:/usr/local/maven/bin
echo Stopping existing jobs...

nomad stop spotbuy
chmod +x ./bin/*.sh
./bin/bootstrap.sh
./bin/buildapp.sh
echo Done building, Start Deploying...
pushd cobalt
deploy
popd
