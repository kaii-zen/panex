#!/usr/bin/env bash
cat modifications.sql | docker compose exec -T db mysql -uroot