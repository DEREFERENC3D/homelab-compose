#!/bin/bash
source ~/.venv-podman-compose/bin/activate && env PODMAN_COMPOSE_PROVIDER=podman-compose podman compose $@
