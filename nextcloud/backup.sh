#!/bin/bash
#set -x
set -euo pipefail

STATUS="$(./occ.sh status --output=json | grep -v -F -e 'Nextcloud or one of the apps require upgrade - only a limited number of commands are available' -e 'You may use your browser or the occ upgrade command to do the upgrade')"

VERSION="$(echo ${STATUS} | jq -r '.versionstring')"
MAINTENANCE="$(echo ${STATUS} | jq -r '.maintenance')"
DATE="$(date +"%Y%m%dT%H%M%S")"

if [ "${MAINTENANCE}" != 'true' ]; then
	./occ.sh maintenance:mode --on
fi
podman exec nextcloud-db-1 mariadb-dump --single-transaction nextcloud > "db_backups/${DATE}_${VERSION}.sql"
if [ "${MAINTENANCE}" != 'true' ]; then
	./occ.sh maintenance:mode --off
fi
