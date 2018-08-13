#!/bin/bash

echo "Please fill the following required values:"

echo -e "\n[ metrics ]\n"

echo "New Grafana db password: "
unset input && read -s input \
; echo $input | docker secret create metrics_gf_database_password - \
; echo $input | docker secret create metrics_postgres_password -
echo "New Grafana admin password: "
unset input && read -s input \
; echo $input | docker secret create metrics_gf_security_admin_password -

echo -e "\n[ netstats ]\n"

echo "New Netstats websocket secret ('WS_SECRET'): "
unset input && read -s input \
; echo $input | docker secret create netstats_ws_secret -

echo -e "\n[ proxy ]\n"

echo "Certificate pem file (path): "
unset input && read input \
; docker secret create proxy_cert_pem "${input}"
echo "Certificate private key file (path): "
unset input && read input \
; docker secret create proxy_cert_private_key "${input}"

clear
echo -e "\n[ review ]\n"
docker secret list
