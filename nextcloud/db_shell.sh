#!/bin/bash
exec podman exec -it nextcloud-db-1 mariadb nextcloud $@
