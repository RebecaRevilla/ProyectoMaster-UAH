DOCKER_NETWORK=test-net
NIFI_VERSION=1.9.2

build:
	docker build --network ${DOCKER_NETWORK} --rm -t pfmuah/nifi-base:1.9.2-java8 ./base

run:
	docker run -it -p 9999:9999 --net test-net --name nifi --hostname nifi \
        -v /opt/docker_volumes/nifi/logs:/opt/nifi/nifi-current/logs \
	-v /opt/docker_volumes/nifi/conf/archive:/opt/nifi/nifi-current/conf/archive \
	-v /opt/docker_volumes/nifi/conf/templates:/opt/nifi/nifi-current/conf/templates \
	-v /opt/docker_volumes/nifi/conf/flow:/opt/nifi/nifi-current/conf/flow \
        -v /opt/docker_volumes/nifi/database_repository:/opt/nifi/nifi-current/database_repository \
        -v /opt/docker_volumes/nifi/flowfile_repository:/opt/nifi/nifi-current/flowfile_repository \
        -v /opt/docker_volumes/nifi/content_repository:/opt/nifi/nifi-current/content_repository \
        -v /opt/docker_volumes/nifi/provenance_repository:/opt/nifi/nifi-current/provenance_repository \
        -v /opt/docker_volumes/nifi/state:/opt/nifi/nifi-current/state \
	-v /opt/docker_volumes/nifi/store:/data/store \
	--rm pfmuah/nifi-base:1.9.2-java8 /root/run.sh -bash
