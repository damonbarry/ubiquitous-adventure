#!/bin/bash
set -euo pipefail

context_path=$(realpath "$(dirname "$0")/../images/target")

docker buildx create --use --bootstrap
trap "docker buildx rm" EXIT

docker buildx build --no-cache --output="type=image,push=true,name=$TARGET_IMAGE,buildinfo-attrs=true" "$context_path"
