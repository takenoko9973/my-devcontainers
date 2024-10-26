FROM condaforge/miniforge3:24.7.1-2

RUN apt-get update; \
    DEBIAN_FRONTEND=noninteractive; \
    apt-get upgrade -y; \
    apt-get install -y --no-install-recommends  \
        git \
        ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

WORKDIR /tmp
COPY ./requirements.txt /tmp/

RUN mamba init; \
    mamba install --file ./requirements.txt -qy; \
    mamba update --all -qy; \
    mamba clean -qafy;
