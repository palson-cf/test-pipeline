FROM  golang:1.13.1-alpine3.10 as build
COPY . ./
RUN apk update && \
  apk add make vim

RUN make build

RUN cp ./tmp/http-server /tmp/

FROM alpine
WORKDIR /usr/local/bin
COPY --from=build /tmp/http-server /usr/local/bin/

ENTRYPOINT http-server
