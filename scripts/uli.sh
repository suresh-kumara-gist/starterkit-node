#!/bin/bash
#
# Displays a Unique Log-In link.
#
set -e

DOMAIN_AND_PORT=$(docker-compose port node 8080)

echo "=>"
echo "=> Your node app is at: http://$DOMAIN_AND_PORT"
echo "=>"
