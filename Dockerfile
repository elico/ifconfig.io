FROM alpine:latest
ARG TARGETOS
ARG TARGETARCH

COPY ./templates /templates
COPY ./LICENSE /LICENSE

ADD build-dir/${TARGETOS}/${TARGETARCH}/ifconfig.io /ifconfig.io

ENTRYPOINT ["/ifconfig.io"]
