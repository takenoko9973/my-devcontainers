FROM alpine:3.21 AS build

RUN apk update; \
    apk add --no-cache \
        curl \
        perl \
        build-base \
        python3 \
        py3-pip \
        ; \
    curl https://sh.rustup.rs -sSf | sh -s -- -y; \
    source "$HOME/.cargo/env"; \
    pip install touying --break-system-packages;

# ============================================================================

FROM ghcr.io/typst/typst:v0.13.1

RUN apk update;\
    apk add --no-cache  \
        unzip \
        git \
        npm \
        gnuplot \
        msttcorefonts-installer \
        python3 \
        py3-pip \
        ; \
    npm install -g pnpm;


# 日本語フォント(原ノ味フォント)導入
ARG FONT_FOLDER="/usr/share/fonts"

# COPY fonts/ ${FONT_FOLDER}
COPY local.conf /etc/fonts

WORKDIR ${FONT_FOLDER}
ENV TYPST_FONT_PATHS=${FONT_FOLDER}

RUN wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Bold.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Bold.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Regular.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Regular.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Light.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Light.otf; \
    update-ms-fonts; \
    fc-cache -fv;

COPY --from=build /usr/bin/touying /usr/bin/touying
COPY --from=build /usr/lib/python3.12 /usr/lib/python3.12
