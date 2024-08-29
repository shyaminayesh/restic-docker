FROM golang:1.23.0-alpine AS build

RUN apk add --no-cache wget bzip2

WORKDIR /app

RUN wget "https://github.com/restic/restic/releases/download/v0.17.0/restic_0.17.0_linux_amd64.bz2" && bzip2 -dk restic_0.17.0_linux_amd64.bz2

FROM alpine:latest
COPY --from=build /app/restic_0.17.0_linux_amd64 /bin/restic
RUN chmod u+x /bin/restic