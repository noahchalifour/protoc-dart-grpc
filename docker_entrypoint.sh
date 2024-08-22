#!/bin/sh

# Validate the script arguments
if [ $# != 2 ]; then
    echo "Usage: protoc-dart-grpc <proto_dir> <output_dir>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

# Make sure the output directory exists
mkdir -p $output_dir

# Generate the dart files
protoc \
    $PROTOC_ARGS \
    --proto_path $input_dir \
    --dart_out "grpc:$output_dir" \
    $(find $input_dir -iname "*.proto")