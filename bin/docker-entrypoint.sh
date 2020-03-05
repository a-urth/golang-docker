#!/bin/bash
set -e
if [[ -n "${CI_REGISTRY_USER}${CI_REGISTRY_PASSWORD}${CI_REGISTRY}" ]]
then
    docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" "$CI_REGISTRY" 2>/dev/null
fi

exec "$@"
