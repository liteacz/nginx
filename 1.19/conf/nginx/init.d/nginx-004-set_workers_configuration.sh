#!/bin/sh

cores=$(nproc --all)
defaultConnections="4096"

if [[ ! -z "${cores}" ]]; then
    defaultConnections=$((cores * 1024))
fi

[[ -z "${WORKER_PROCESSES}" ]] && WORKER_PROCESSES="auto"
[[ -z "${WORKER_CONNECTIONS}" ]] && WORKER_CONNECTIONS="$defaultConnections"
[[ -z "${WORKER_RLIMIT_NO_FILE}" ]] && WORKER_RLIMIT_NO_FILE="$defaultConnections"

sed -i -e "
s~\# litea.nginx.placeholders.worker_processes~${WORKER_PROCESSES}~g
s~\# litea.nginx.placeholders.worker_rlimit_no_file~${WORKER_CONNECTIONS}~g
s~\# litea.nginx.placeholders.worke_connections~${WORKER_RLIMIT_NO_FILE}~g
" /etc/nginx/nginx.conf
