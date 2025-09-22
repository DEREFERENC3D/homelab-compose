# Homelab Compose

This repo stores the Docker/Podman Compose configs for all the services I self-host on my home server. It serves mostly as a convenient backup of the configuration for all the containers.

The server runs OpenWRT, and Podman as the container engine. One quirk of this setup is that host name resolution of the containers (both from other containers and from the host OS) is broken. As a result, each container group has a manually assigned network address, and each container gets a manually assigned address in that network. For the (rarely needed) inter-group connection, the container in question gets an additional address in the other group's network.

Because of the manual address assignment, and sticking to the convention of naming each group's network "default", a main compose is not included, as trying to keep that name and patching out the sub-Compose files was a pain and resulted in a mess. As such, each container group needs to be managed separately (e.g. `cd $subfolder && podman compose up -d`).

Wherever possible, services are NOT port-forwarded. Instead, an nginx server is used as a reverse proxy. For this reason, any services containing a containerized reverse proxy by default have it stripped out, wherever possible.

Container data is stored in `volumes/$container_name`, once again following a convention. The data may be moved using links or mounting.

Configurable settings are stored in `.env` and/or `run.env` files. They are committed where possible, and `.local` versions allow overriding default values. Otherwise, you have to roll your own. Example configs are (sometimes) available as `.env.example`.
