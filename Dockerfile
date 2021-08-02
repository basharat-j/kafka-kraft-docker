FROM alpine:3.13 AS builder
ENV KAFKA_VERSION=2.8.0
ENV SCALA_VERSION=2.13
COPY install_kafka.sh /bin/
RUN apk update \
  && apk add --no-cache bash curl jq \
  && /bin/install_kafka.sh \
  && apk del curl jq

FROM alpine:3.13
RUN apk update && apk add --no-cache bash openjdk8-jre
COPY --from=builder /opt/kafka /opt/kafka
COPY start_kafka.sh /bin/
CMD [ "/bin/start_kafka.sh" ]