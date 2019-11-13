#!/bin/sh
#docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
#REPONAME="hoper/cicd-buzz"
#docker build -f Dockerfile -t "$REPONAME":"$TAG" .
docker build -f Dockerfile -t "$DOCKER_USER/$TRAVIS_BRANCH":"$TAG" .
#docker push "$TRAVIS_REPO_SLUG"
#docker push "$REPONAME":"$TAG"
docker push "$DOCKER_USER/cicd-buzz":"$TAG"
