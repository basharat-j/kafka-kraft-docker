FROM alpine:3.18 AS build

ENV KAFKA_VERSION=3.5.1
ENV SCALA_VERSION=2.13

RUN apk add --no-cache bash \
    && wget "https://downloads.apache.org/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" -O /tmp/kafka.tgz \
    && tar -xzf /tmp/kafka.tgz \
    && mv kafka_$SCALA_VERSION-$KAFKA_VERSION /opt/kafka

FROM amazoncorretto:11-alpine3.18

COPY --from=build /opt/kafka /opt/kafka

RUN apk add --no-cache bash \
    && ln -s /opt/kafka/bin /kbin

COPY start_kafka.sh /bin

CMD [ "/bin/start_kafka.sh" ]
