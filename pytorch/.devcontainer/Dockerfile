FROM pytorch/pytorch:2.4.1-cuda12.4-cudnn9-devel

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

RUN apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends  \
        git \
        x11-apps \
        python-tk \
        ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

WORKDIR /tmp
COPY ./requirements.txt /tmp/

RUN mamba init; \
    mamba update --all -qy; \
    mamba install --file ./requirements.txt -qy; \
    mamba clean -qafy;
