#!/usr/bin/env bash
set -eu

exec ttyd -E -W -p 8080 bash -lic "./init.sh; exec bash"
