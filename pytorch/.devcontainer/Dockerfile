FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

ARG MINIFORGE_NAME=Miniforge3
ARG MINIFORGE_VERSION=24.7.1-2
ARG CONDA_ENV_NAME=my_env

ENV CONDA_DIR=/opt/conda
ENV LANG=ja_JP.UTF-8
ENV PATH=${CONDA_DIR}/bin:${PATH}

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        wget \
        bzip2 \
        ca-certificates \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget --no-hsts --quiet https://github.com/conda-forge/miniforge/releases/download/${MINIFORGE_VERSION}/${MINIFORGE_NAME}-${MINIFORGE_VERSION}-Linux-$(uname -m).sh -O /tmp/miniforge.sh && \
    /bin/bash /tmp/miniforge.sh -b -p ${CONDA_DIR} && \
    rm /tmp/miniforge.sh && \
    conda update -n base -c defaults conda && \
    conda clean --tarballs --index-cache --packages -y && \
    find ${CONDA_DIR} -follow -type f -name '*.a' -delete && \
    find ${CONDA_DIR} -follow -type f -name '*.pyc' -delete && \
    conda clean --force-pkgs-dirs --all -y

COPY ./requirements.txt /tmp/

RUN conda install mamba -qy && \
    mamba init && \
    mamba create -n ${CONDA_ENV_NAME} --file /tmp/requirements.txt -qy -c pytorch -c nvidia -c gpytorch && \
    mamba clean -qafy && \
    rm /tmp/requirements.txt && \
    echo ". ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate ${CONDA_ENV_NAME}" >> /etc/skel/.bashrc && \
    echo ". ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate ${CONDA_ENV_NAME}" >> ~/.bashrc
