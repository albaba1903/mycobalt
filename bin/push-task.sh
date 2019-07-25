#!/bin/bash
export PATH=$PATH:/usr/local/maven/bin
export version="dev"

pushd cobalt-services
echo dockerbuild  -t $DOCKER_REGISTRY/ariba-spotbuy/task1:$version .
dockerbuild  -t $DOCKER_REGISTRY/ariba-spotbuy/task1:$version .
popd