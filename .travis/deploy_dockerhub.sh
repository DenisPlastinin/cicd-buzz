#!/bin/sh
#docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
docker login -u $DOCKER_USER -p $DOCKER_PASS
#docker login -u $DOCKER_USER --password-stdin $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="dev"
fi
REPONAME="hoper/cicd-buzz"
docker build -f Dockerfile -t "$REPONAME":"$TAG" .
#docker push "$TRAVIS_REPO_SLUG"
docker push "$REPONAME":"$TAG"

