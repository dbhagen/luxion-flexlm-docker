set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=dbhagen
# image name
IMAGE=luxion-flexlm-docker
VERSION=`cat VERSION`
docker build -t $USERNAME/$IMAGE:latest -t $USERNAME/$IMAGE:$VERSION .