FROM alpine:3.19


RUN apk --update add redis 

EXPOSE 6379

CMD ["redis-server", "--bind", "0.0.0.0", "--protected-mode", "no"]