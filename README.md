# kafka-kraft-docker

A docker image for [Kafka](https://kafka.apache.org) without requiring Zookeeper.

For more information about the Kafka running in KRaft mode check out the [introductory blog post](https://www.confluent.io/blog/kafka-without-zookeeper-a-sneak-peek).


## Getting started

### Run with Docker

```
docker run -p 9092:9092 -d bashj79/kafka-kraft
```

Check out [Docker Hub](https://registry.hub.docker.com/r/bashj79/kafka-kraft) for further details.
