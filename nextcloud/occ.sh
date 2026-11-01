#!/bin/bash
exec podman exec --user www-data -it nextcloud php occ $@
