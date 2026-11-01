#!/bin/bash
mapfile -t SUBNETS < <( sed -nE 's/^\s+ipv4_address: 10\.1\.([0-9]+)\.2$/\1/p' */docker-compose.yml | sort -n | uniq )
LAST="${SUBNETS[-1]}"
NEXT=$((LAST+1))

echo "${NEXT}"
