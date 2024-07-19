# Use an appropriate base image
FROM dart:latest

RUN echo "Acquire::http::Pipeline-Depth 0;" > /etc/apt/apt.conf.d/99custom && \
    echo "Acquire::http::No-Cache true;" >> /etc/apt/apt.conf.d/99custom && \
    echo "Acquire::BrokenProxy    true;" >> /etc/apt/apt.conf.d/99custom

# Install dependencies
RUN apt update && apt install -y protobuf-compiler

# Install Dart protoc plugin
RUN dart pub global activate protoc_plugin

# Set PATH for the Dart protoc plugin
ENV PATH="$PATH:/root/.pub-cache/bin"

# Set the working directory
WORKDIR /proto

# Copy the docker_entrypoint.sh file into the image
COPY docker_entrypoint.sh /

# Entrypoint for generating go files
ENTRYPOINT ["/docker_entrypoint.sh"]