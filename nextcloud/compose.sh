#!/bin/bash
podman compose \
	--env-file .env \
	--env-file .env.local \
	-f docker-compose.yml \
	-f docker-compose.override.mail.yml \
	$@
