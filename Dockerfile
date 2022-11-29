FROM alpine:latest

# Below line allows for using binary built in ubuntu (ie: GitHub Actions) to run on alpine
RUN apk add --no-cache libc6-compat
RUN adduser scep --uid 1010 --disabled-password --gecos ""

COPY ./scepserver-linux-amd64 /usr/bin/scepserver
COPY ./scepclient-linux-amd64 /usr/bin/scepclient
RUN chown scep:scep /usr/bin/scepserver
RUN chown scep:scep /usr/bin/scepclient

EXPOSE 8080

VOLUME ["/depot"]

USER scep

ENTRYPOINT ["scepserver"]
