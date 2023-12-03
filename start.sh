#!/usr/bin/env bash

docker compose up db --wait
docker compose up web --wait

1>&2 echo see table at http://localhost:9980
