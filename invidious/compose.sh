#!/bin/bash
podman compose \
	--env-file .env \
	--env-file .env.local \
	$@
