DOCKER_NETWORK=test-net

build:
	docker build --network ${DOCKER_NETWORK} --rm -t pfmuah/kafka-base:2.12_2.5.0-java8 ./base
	docker build --network ${DOCKER_NETWORK} --rm -t pfmuah/kafka-zookeeper:2.12_2.5.0-java8 ./zookeeper
	docker build --network ${DOCKER_NETWORK} --rm -t pfmuah/kafka-broker:2.12_2.5.0-java8 ./kafka

topic:
	docker run -it --net test-net --name create-topic --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-topics.sh \
	--bootstrap-server kafka:9092 --create --replication-factor 1 --partitions 1 --topic pfm_topic1

producer:
	docker run -it --net test-net --name run-producer --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-console-producer.sh \
	--bootstrap-server kafka:9092 --topic pfm_topic1

consumer:
	docker run -it --net test-net --name run-consumer --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-console-consumer.sh \
	--bootstrap-server kafka:9092 --topic pfm_topic1 --group pfm_group1 --from-beginning

topic2:
	docker run -it --net test-net --name create-topic2 --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-topics.sh \
	--bootstrap-server kafka:9092 --create --replication-factor 1 --partitions 1 --topic pfm_topic2

producer2:
	docker run -it --net test-net --name run-producer2 --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-console-producer.sh \
	--bootstrap-server kafka:9092 --topic pfm_topic2

consumer2a:
	docker run -it --net test-net --name run-consumer2a --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-console-consumer.sh \
	--bootstrap-server kafka:9092 --topic pfm_topic2 --group pfm_group2 --from-beginning

consumer2b:
	docker run -it --net test-net --name run-consumer2b --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-console-consumer.sh \
	--bootstrap-server kafka:9092 --topic pfm_topic2 --group pfm_group2 --from-beginning

topic3:
	docker run -it --net test-net --name create-topic3 --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-topics.sh \
	--bootstrap-server kafka:9092 --create --replication-factor 1 --partitions 1 --topic pfm_topic3

producer3:
	docker run -it --net test-net --name run-producer3 --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-console-producer.sh \
	--bootstrap-server kafka:9092 --topic pfm_topic3

consumer3a:
	docker run -it --net test-net --name run-consumer3a --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-console-consumer.sh \
	--bootstrap-server kafka:9092 --topic pfm_topic3 --group pfm_group3 --from-beginning

consumer3b:
	docker run -it --net test-net --name run-consumer3b --rm pfmuah/kafka-broker:2.12_2.5.0-java8 kafka-console-consumer.sh \
	--bootstrap-server kafka:9092 --topic pfm_topic3 --group pfm_group3 --from-beginning
