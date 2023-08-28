#!/usr/bin/env bash

downloadUrl="https://downloads.apache.org/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz"


curl -L "${downloadUrl}" > "/tmp/kafka.tgz"

tar xfz /tmp/kafka.tgz -C /opt

rm /tmp/kafka.tgz

ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka
