# golang image where workspace (GOPATH) configured at /go.
FROM golang:1.6

# Install dependencies
RUN go get gopkg.in/mgo.v2
RUN go get github.com/gorilla/mux

# copy the local package files to the container workspace
ADD . /go/src/github.com/sanguinius69/cinema-users

# Setting up working directory
WORKDIR /go/src/github.com/sanguinius69/cinema-users

# Build the users command inside the container.
RUN go install github.com/sanguinius69/cinema-users

# Run the users microservice when the container starts.
ENTRYPOINT /go/bin/users

# Service listens on port 8080.
EXPOSE 8080
