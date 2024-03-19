#!/usr/bin/env bash

set -e

RUN_MANAGE_PY='poetry run python -m mytenderweb.manage'

echo 'Collecting static files...'
$RUN_MANAGE_PY collectstatic --no-input


exec poetry run daphne mytenderweb.project.asgi:application -p 8000 -b 0.0.0.0
