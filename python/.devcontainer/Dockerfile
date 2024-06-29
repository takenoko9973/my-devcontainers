FROM mcr.microsoft.com/devcontainers/base:debian

RUN apt-get update; \
    DEBIAN_FRONTEND=noninteractive; \
    apt-get upgrade -y; \
    apt-get install -y --no-install-recommends  \
        git \
        ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;
