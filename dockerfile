FROM golang:1.13.5-alpine as build-env

# All these steps will be cached
RUN mkdir /test
WORKDIR /test
COPY go.mod .
COPY go.sum .

# Get dependecneis - will also be cached
RUN go mod download
# COPY the source code
COPY . .

# Build the binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o /go/bin/test

# second step to build minimal image
FROM scratch
COPY --from=build-env /go/bin/test /go/bin/test
ENTRYPOINT ["/go/bin/test"]