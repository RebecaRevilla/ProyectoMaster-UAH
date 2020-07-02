DOCKER_NETWORK=test-net

build:
	docker build --network ${DOCKER_NETWORK} --rm -t pfmuah/jupyter-base:6.0.3 ./base

run:
	docker run -it --net test-net --name jupyter --hostname jupyter \
	-v /opt/docker_volumes/jupyter_notebooks:/data/notebooks \
	-v /opt/docker_volumes/Schemas:/data/schemas \
	--rm pfmuah/jupyter-base:6.0.3 /root/run.sh -bash
