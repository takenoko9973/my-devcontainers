FROM ghcr.io/typst/typst:latest

RUN apk update;\
    apk add --no-cache  \
        git \
        npm \
        ; \
    npm install -g pnpm;

# 日本語フォント(原ノ味フォント)導入
ARG FONT_FOLDER="/root/fonts"

COPY fonts/ ${FONT_FOLDER}

WORKDIR ${FONT_FOLDER}
ENV TYPST_FONT_PATHS=${FONT_FOLDER}

RUN wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Bold.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiGothic-Regular.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Bold.otf; \
    wget -q https://github.com/trueroad/HaranoAjiFonts/raw/refs/heads/master/HaranoAjiMincho-Regular.otf;
