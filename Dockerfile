FROM golang:1.15.1-alpine3.12 AS build

WORKDIR /tmp/simple-demo-app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build 

FROM scratch
COPY --from=build /tmp/simple-demo-app/simple-demo-app /app/simple-demo-app

EXPOSE 8080
CMD ["/app/simple-demo-app"]
