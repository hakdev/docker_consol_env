# docker_consol_env
# Docker container environment for Spark Kafka Cassandra
Consolidated Docker environment that runs - Spark Kafka Cassandra

## Images used:
Spark : jupyter/pyspark-notebook

Kafka: confluentinc/cp-zookeeper

Cassandra: bitnami/cassandra

## How to run:
```sh
$ sudo ./docker_run.sh
```

## Additional steps:

### Spark:
#### Run Jupyter notebook: 
```sh
$ docker exec docker_env_master_1 start-notebook.sh
```

### Cassandra:
#### Start CQLSH:
```sh
$ sudo docker exec -it -u 0 cassandra bash
$ cqlsh -u cassandra -p cassandra
```

### Kafka:
#### List topics
```sh
$ kafka-topics --list --zookeeper zookeeper:2181
```

#### Describe topic
```sh
$ kafka-topics --describe --topic foo --zookeeper zookeeper:2181
```

#### Create topic
```sh
$ kafka-topics --create --topic foo --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181
```

#### Publish to a topic
```sh
$ seq 42 | kafka-console-producer --request-required-acks 1 --broker-list kafka:29092 --topic foo && echo 'Produced 42 messages.'
```

#### Consume data
 ```sh
 $ kafka-console-consumer --bootstrap-server kafka:29092 --topic foo --from-beginning --max-messages 42
 ```
