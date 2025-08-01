#!/usr/bin/env bash

LAST_ARG="${@: -1}"

IMAGE_NAME=core-placeholder

source ../../.env

ECR_ORIGIN=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# --------------------------------------------------------------------------------------------------
# AWS AUTHENTICATION -------------------------------------------------------------------------------

source ../authentication/mfa.bash

# --------------------------------------------------------------------------------------------------
# DOCKER -------------------------------------------------------------------------------------------

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_ORIGIN
docker buildx create --use --name lambda-builder 2>/dev/null || docker buildx use lambda-builder
docker buildx build \
  --provenance=false \
  --platform linux/arm64 \
  -t $ECR_ORIGIN/$IMAGE_NAME:latest \
  . \
  --push || exit 1
