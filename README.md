# Docker Protoc Generator for dart

This is a docker image for [Dart gRPC](https://grpc.io/docs/languages/dart/quickstart/)

### Repository Structure

```
|-- Dockerfile                  # The main Dockerfile for the image
|-- docker_entrypoint.sh        # The main script for generating the dart files
|-- Makefile                    # The project Makefile
```

### Building the Image

To build the docker image, run the following command:

```
make    # or `make build`
```

### Using the image

To generate the go files, run the following command:

```
docker run -it --rm \
    -v $(pwd)/proto:/proto \
    -v $(pwd)/build:/build \
    protoc-dart:latest /proto /build
```