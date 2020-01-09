################
# docker pull #
################
# Pull an image or a repository from a registry
# Usage:	docker pull [OPTIONS] NAME[:TAG|@DIGEST]

docker build NAME:TAG


################
# docker build #
################
# Build an image from a Dockerfile
# Usage:	docker build [OPTIONS] PATH | URL | -
#  -t, --tag list                Name and optionally a tag in the 'name:tag' format

docker build -t NAME:TAG PATH


################
# docker push #
################
# Push an image or a repository to a registry
# Usage:	docker push [OPTIONS] NAME[:TAG]

docker push NAME:TAG


#################
# docker images #
#################
# List images
# Usage:	docker images [OPTIONS] [REPOSITORY[:TAG]]

docker images


##############
# docker run #
##############
# Run a command in a new container
# Usage:	docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
#  -i, --interactive                    Keep STDIN open even if not attached
#  -p, --publish list                   Publish a container's port(s) to the host
#      --rm                             Automatically remove the container when it exits

docker run NAME:TAG
docker run -p IMAGE_PORT:LOCAL_PORT NAME:TAG
docker run -i --rm -p IMAGE_PORT:LOCAL_PORT NAME:TAG
