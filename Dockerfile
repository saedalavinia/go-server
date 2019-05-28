# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from golang v1.11 base image
FROM golang:1.12.5

# Add Maintainer Info
LABEL maintainer="Saed Alavinia <saedalav@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/saedalavinia/go-server

# Copy everything from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

# Download all the dependencies
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["go-server"]