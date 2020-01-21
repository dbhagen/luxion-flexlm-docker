set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=dbhagen
# image name
IMAGE=luxion-flexlm-docker
docker build -t $USERNAME/$IMAGE:latest .