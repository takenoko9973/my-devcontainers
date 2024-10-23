FROM debian:bullseye-slim

RUN apt-get update; \
    apt-get install -y \
        git \
        x11-apps \
        ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;
