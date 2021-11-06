FROM golang:1.17-alpine AS build

WORKDIR /tmp/hello-world

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build 

FROM scratch
COPY --from=build /tmp/hello-world/hello-world /app/hello-world

EXPOSE 8080
CMD ["/app/hello-world"]
