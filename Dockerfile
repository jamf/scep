FROM alpine:latest

RUN adduser scep --uid 1010 --disabled-password --gecos ""

COPY ./scepserver-linux-amd64 /usr/bin/scepserver
RUN chown scep:scep /usr/bin/scepserver

EXPOSE 8080

VOLUME ["/depot"]

USER scep

ENTRYPOINT ["scepserver"]
