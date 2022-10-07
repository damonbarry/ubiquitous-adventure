#!/bin/bash
set -euo pipefail

context_path=$(realpath "$(dirname "$0")/../images/base")

docker buildx create --use --bootstrap
trap "docker buildx rm" EXIT

docker buildx build --no-cache --output='type=image,push=true,name=damonbarry/base,buildinfo-attrs=true' "$context_path"
