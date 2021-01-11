#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

export WAIT_TIMEOUT=${WAIT_TIMEOUT:-60}
export BACKEND_ADDRESS=${BACKEND_ADDRESS:-"postgres:5432"}

wait-for-it -t $WAIT_TIMEOUT $BACKEND_ADDRESS

airflow db init

airflow users create \
    --username admin \
    --password admin \
    --firstname Peter \
    --lastname Parker \
    --role Admin \
    --email spiderman@superhero.org

# start the scheduler
# open a new terminal or else run webserver with ``-D`` option to run it as a daemon
airflow scheduler &
# start the web server, default port is 8080
airflow webserver --port 8080 