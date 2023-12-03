#!/usr/bin/env bash

docker compose down --rmi all --volumes --remove-orphans
docker compose rm --force --volumes
