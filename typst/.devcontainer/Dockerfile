FROM ghcr.io/typst/typst:latest

RUN apt-get update; \
    apt-get install -y \
        git \
        pkg-config \
        libssl-dev \
        ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

# 日本語フォント(原ノ味フォント)導入
ARG FONT_FOLDER="/root/fonts"

COPY fonts/ ${FONT_FOLDER}

WORKDIR ${FONT_FOLDER}
ENV TYPST_FONT_PATHS=${FONT_FOLDER}

RUN wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Bold.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Regular.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Bold.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Regular.otf;
