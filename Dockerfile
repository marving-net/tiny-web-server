FROM alpine:3.17.2

RUN apk add --update --no-cache thttpd && \
	rm -rf /var/cache/apk/*

EXPOSE 8080

RUN mkdir -p /data

WORKDIR /data

ENTRYPOINT ["thttpd", "-D", "-h", "0.0.0.0", "-p", "8080", "-u", "guest", "-l", "-", "-M", "60"]

CMD ["-d", "/data"]
