#!/bin/bash
export PATH=$PATH:/usr/local/maven/bin
export BASE_IMAGE_VERSION=290-3-g18b8bb0
export version="dev"

#pushd .
#mvn clean install
#popd

#pushd task1
#echo dockerbuild  -t $DOCKER_REGISTRY/ariba-spotbuy/task1:$version .
#dockerbuild  -t $DOCKER_REGISTRY/ariba-spotbuy/task1:$version .
#popd


#pushd util
#echo dockerbuild  -t $DOCKER_REGISTRY/ariba-spotbuy/util:$version .
#dockerbuild  -t $DOCKER_REGISTRY/ariba-spotbuy/util:$version .
#popd

pushd nginx
echo dockerbuild  -t $DOCKER_REGISTRY/ariba-spotbuy/nginx:$version .
dockerbuild  -t $DOCKER_REGISTRY/ariba-spotbuy/nginx:$version .
popd
