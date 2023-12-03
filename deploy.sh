#!/usr/bin/env bash

date +%s > web/timestamp
docker compose build web
docker compose down web
docker compose up web --wait
