#!/bin/bash
BUILD_DIR=$TRAVIS_BUILD_DIR
ARTIFACT=$1

build(){
  cd $BUILD_DIR/$ARTIFACT
  MVN_VERSION=$(mvn -q -Dexec.executable="echo" -Dexec.args='${project.version}' --non-recursive org.codehaus.mojo:exec-maven-plugin:1.3.1:exec)
  DOCKER_IMAGE=$DOCKER_NAMESPACE/$DOCKER_REPO:$ARTIFACT-$MVN_VERSION
  echo "docker image: " $DOCKER_IMAGE
  docker build -t $DOCKER_NAMESPACE/$DOCKER_REPO:$ARTIFACT-$MVN_VERSION .
  docker push $DOCKER_NAMESPACE/$DOCKER_REPO:$ARTIFACT-$MVN_VERSION
  cd $BUILD_DIR
}

build
