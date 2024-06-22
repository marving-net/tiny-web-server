FROM alpine:3.20.1

RUN apk add --update --no-cache thttpd && \
	rm -rf /var/cache/apk/*

EXPOSE 8080

WORKDIR /data

ENTRYPOINT ["thttpd", "-D", "-h", "0.0.0.0", "-p", "8080", "-u", "guest", "-l", "-", "-M", "60"]

CMD ["-d", "/data"]
