set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=dbhagen
# image name
IMAGE=luxion-flexlm-docker
if [[ "$1" == "debug" ]]; then
docker run -it --entrypoint=/bin/bash --hostname=luxion-flexlm-1 $USERNAME/$IMAGE:latest
else
docker run -it --hostname=luxion-flexlm-1 $USERNAME/$IMAGE:latest
fi