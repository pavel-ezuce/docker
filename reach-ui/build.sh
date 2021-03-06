#!/bin/sh -e
REPO=${1:-"https://github.com/swarmcom/reach-ui.git"}
COMMIT=${2:-"$(git ls-remote $REPO | grep master | sed 's/refs.*//')"}
echo $COMMIT > etc/commit

BRANCH=${BRANCH:-"master"}
NETWORK=${NETWORK:-"ezuce"}

echo Using repository:$REPO branch:$BRANCH
docker build $BUILD_FLAGS -t $NETWORK/reach-ui \
	--build-arg REPO=$REPO \
	--build-arg BRANCH=$BRANCH \
	.
