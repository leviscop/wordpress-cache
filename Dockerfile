FROM nginx:alpine
LABEL maintainer Leviscop

RUN apk add --update \
    bash \
    && rm -rf /var/cache/apk/*

COPY webserver.service /
COPY nginx.conf /etc/nginx/
RUN chmod +x /webserver.service

EXPOSE 80/tcp

ENTRYPOINT ["/bin/bash"]
CMD ["/webserver.service"]
